from base64 import decode
from flask import Flask, jsonify, request
import json
import csv
import pandas as pd
import numpy as np
from psutil import users

# Importing important libraries
from scipy.sparse import coo_matrix, csr_matrix 
from sklearn.metrics.pairwise import cosine_similarity 
from sklearn.preprocessing import LabelEncoder
from sklearn.metrics.pairwise import cosine_similarity
import operator

#declared an empty variable for reassignment
response = ''
res=[]

#creating the instance of our flask application
app = Flask(__name__)

#route to entertain our post and get request from flutter app


@app.route('/name', methods = ['GET', 'POST'])

def nameRoute():
    global response  

    #checking the request type we get from the app
    if(request.method == 'POST'):
        request_data = request.data #getting the response data
        request_data = json.loads(request_data.decode('utf-8')) #converting it from json to key value pair
        name = request_data['name'] #assigning it to name
        respo="joud"
        
        response = f'Hi {name}! this is Python{respo}'
        print(response) 
        print(name)
        CSvFilePath="https://raw.githubusercontent.com/Leena-MD/SwapIt_Sprint3/master/first_swap-master/assets/data.csv"
        a=Recommendation(CSvFilePath, name)
        ##Recommendation(CSvFilePath, name)
        
    
      
        #re-assigning response with the name we got from the user
        return ' ' #to avoid a type error 
    else:
        
        return jsonify({'name' : response})

    
def nameRoute():

    #fetching the global response variable to manipulate inside the function
    global response
   
    
def Recommendation(fileName, userID):
    
    print("RECO IS HERE")
    """Finding Top categories recommended to userID and show Top similar Customers to UserID. 
    
    Parameters
    ----------
    fileName : String
    UserID : String

    Returns
    ------
    SimilarCustomers : List
    """
    
    
    
    # Use your source folder here in csv read
    Data = pd.read_csv(fileName, encoding='latin-1')
    print("#1R")
    print(Data)
    # Renaming Columns (this might change)
    Data.rename(columns = {'receiverID': 'Customer', 'cate': 'SalesItem'}, inplace = True)
    print(Data)
    # ------ For user based RS later ---
    data=Data.drop(['interested goods ID'], axis=1)
    data.rename(columns = {'SalesItem': 'cate'}, inplace = True)
    # Group Sales Items that have been purchased by what Customer
    DataGrouped = Data.groupby(['Customer', 'SalesItem']).sum().reset_index() # Group together
    print("#2R")
    print(DataGrouped)
    # ------------- Category Recommendation --------------------------------
    #-------------------------   Part 1 ------------------------------------
    DataBinary = DataGrouped
    def create_DataBinary(DataGrouped):
        DataBinary = DataGrouped.copy()
        DataBinary['PurchasedYes'] = 1
        return DataBinary
    print("#3R")
    print(DataBinary)
    DataBinary = create_DataBinary(DataGrouped)
    
    # -----   Used for Categories Based RS
    purchase_data=DataBinary.drop(['interested goods ID'], axis=1)
    
    def GetItemItemSim(user_ids, product_ids):
        SalesItemCustomerMatrix = csr_matrix(([1]*len(user_ids), (product_ids, user_ids)))
        similarity = cosine_similarity(SalesItemCustomerMatrix)
        return similarity, SalesItemCustomerMatrix
    print('HI')
    
    def get_recommendations_from_similarity(similarity_matrix, SalesItemCustomerMatrix, top_n=8):
        CustomerSalesItemMatrix = csr_matrix(SalesItemCustomerMatrix.T)
        CustomerSalesItemScores = CustomerSalesItemMatrix.dot(similarity_matrix) 
        # sum of similarities to all purchased products
        RecForCust = []
        for user_id in range(CustomerSalesItemScores.shape[0]):
            scores = CustomerSalesItemScores[user_id, :]
            purchased_items = CustomerSalesItemMatrix.indices[CustomerSalesItemMatrix.indptr[user_id]:CustomerSalesItemMatrix.indptr[user_id+1]]
            scores[purchased_items] = -1  # do not recommend already purchased SalesItems
            top_products_ids = np.argsort(scores)[-top_n:][::-1]
            recommendations = pd.DataFrame(top_products_ids.reshape(1, -1),index=[user_id],columns=['Top%s' % (i+1) for i in range(top_n)])
            RecForCust.append(recommendations)
        return pd.concat(RecForCust)
    
    
    def get_recommendations(purchase_data):
        user_label_encoder = LabelEncoder()
        user_ids = user_label_encoder.fit_transform(purchase_data.Customer)
        product_label_encoder = LabelEncoder()
        product_ids = product_label_encoder.fit_transform(purchase_data.SalesItem)
        # compute recommendations
        similarity_matrix, SalesItemCustomerMatrix = GetItemItemSim(user_ids, product_ids)
        recommendations = get_recommendations_from_similarity(similarity_matrix, SalesItemCustomerMatrix)
        recommendations.index = user_label_encoder.inverse_transform(recommendations.index)
        for i in range(recommendations.shape[1]):
            recommendations.iloc[:, i] = product_label_encoder.inverse_transform(recommendations.iloc[:, i])
        return recommendations
    
    recommendations = get_recommendations(purchase_data)
    #print(recommendations)
    
    # Storing Categories recommended for each customer
    recommendations.to_csv("https://raw.githubusercontent.com/Leena-MD/SwapIt_Sprint3/master/first_swap-master/assets/Categories.csv")
    
    #------------------ User Based Recommendation -------------------------
    #-------------------------   Part 2 ------------------------------------
    
    def similar_users(user_id, matrix, k=3):
        # create a df of just the current user
        user = matrix[matrix.index == user_id]
        
        # and a df of all other users
        other_users = matrix[matrix.index != user_id]
        
        # calc cosine similarity between user and each other user
        similarities = cosine_similarity(user,other_users)[0].tolist()
        
        # create list of indices of these users
        indices = other_users.index.tolist()
        
        # create key/values pairs of user index and their similarity
        index_similarity = dict(zip(indices, similarities))
        
        # sort by similarity
        index_similarity_sorted = sorted(index_similarity.items(), key=operator.itemgetter(1))
        index_similarity_sorted.reverse()
        
        # grab k users off the top
        top_users_similarities = index_similarity_sorted[:k]
        users = [u[0] for u in top_users_similarities]
    
        return users
   
    # Find Category Frequencies for each customer
    FM=data.groupby(['Customer','cate']).size().reset_index()
    FM.rename( columns={0:'Freq'}, inplace=True )
        
    # Creating a matrix of customers vs categories: each cell is the frequency
    
    lenCus=data['Customer'].unique()
    lenCat=9
    matrix=[]
    lenTest=1
    
    for val in lenCus:
        #print(val)
        k=FM[FM['Customer']==val]
        i=k.reset_index(drop=True)
        #print(i)
        # Here i should store userID to be integer
        v=0
        row=[]
        while v < lenCat:
            if i['cate'].isin([v]).any():
                # Getting the index location where cat exists in i
                index=int(i[i['cate']==v].index.values)
                freq=i.iat[index,2]
                row.append(freq)
                #print(v)
            else: 
                row.append(0)
            v+=1
            
        
        matrix.append(row)
        
    # ------ Generate Mappings of UserIds with integers ----
    # ---------------- IDs Holds Original and new Customer IDs ------
    Ids=list(range(0,len(data['Customer'].unique())))
    d = {'OCID': lenCus, 'CID': Ids}
    IDs=pd.DataFrame(data=d)
    
    # ------ Storing Frequency Table in DataFreq : User vs Categories Frequencies -------
    colName = list(['Cat0','Cat1','Cat2','Cat3','Cat4','Cat5','Cat6','Cat7','Cat8'])
    DataFreq=pd.DataFrame(matrix,columns=colName)
    
    # --- Getting UserID's mapping ----
    X=IDs.loc[IDs['OCID'] == userID].values
    #print(X)
    
    # --- Get similar users for userID ---
    simUsers=similar_users(X[0,1], DataFreq)
    # --- Store Similar users after mapping back ---
    S=[]
    for i in simUsers:
        X=IDs.loc[IDs['CID'] == i].values
        S.append(X[0,0])
        
    colN = list(['Similar Users'])
    simData=pd.DataFrame(S,columns=colN)
    # Storing recommended Users for cusrrent userID
    simData.to_csv("https://raw.githubusercontent.com/Leena-MD/SwapIt_Sprint3/master/first_swap-master/assets/SimilarUsers.csv")

    
if __name__=="__main__":
    app.run(), 
           
