from base64 import decode
import codecs
from os import name
import re
from urllib.request import urlopen
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
import firebase_admin
from firebase_admin import auth
from firebase_admin import credentials
from firebase_admin import db
# import urllib library
from urllib.request import urlopen
# import json
import json
url ='https://raw.githubusercontent.com/Leena-MD/SwapIt_Sprint5/master/serviceAccountKey.json'
response = urlopen(url)

# Initialize the default app
cred = credentials.Certificate(json.loads(response.read()))
firebase_admin.initialize_app(cred, {
    'databaseURL': 'https://swapit-474e1-default-rtdb.firebaseio.com/'
})
ref = db.reference('/')
ref.set({
        'boxes': 
            {
                'box001': {
                    'color': 'red',
                    'width': 1,
                    'height': 3,
                    'length': 2
                },
                'box002': {
                    'color': 'green',
                    'width': 1,
                    'height': 2,
                    'length': 3
                },
                'box003': {
                    'color': 'yellow',
                    'width': 3,
                    'height': 2,
                    'length': 1
                }
            }
        })
ref = db.reference('boxes')
box_ref = ref.child('box001')
box_ref.update({
    'color': 'red'
})
        






#declared an empty variable for reassignment
response = ''
res=[]

#creating the instance of our flask application
app = Flask(__name__)

#route to entertain our post and get request from flutter app


@app.route('/name', methods = ['GET', 'POST'])

def nameRoute():
    global response  
    global name
    #checking the request type we get from the app
    if(request.method == 'POST'):
        request_data = request.data #getting the response data
        request_data = json.loads(request_data.decode('utf-8')) #converting it from json to key value pair
        name = request_data['name'] #assigning it to name
        respo="joud"
        
        response = f'Hi {name}! this is Python{respo}'
        print(response) 
        print(name)
        CSvFilePath="https://raw.githubusercontent.com/Leena-MD/SwapIt_Sprint5/master/first_swap-master/assets/data.csv"
        a=Recommendation(CSvFilePath, name)
      
        ##Recommendation(CSvFilePath, name)
        
    
      
        #re-assigning response with the name we got from the user
        return ' ' #to avoid a type error 
    else:
        
        return jsonify({'name' : response})

    
def nameRoute():

    #fetching the global response variable to manipulate inside the function
    global response
   
    
#file.close()
print("nnn")
CSvFilePath="https://raw.githubusercontent.com/Leena-MD/SwapIt_Sprint5/master/first_swap-master/assets/data.csv"
df = pd.read_csv(CSvFilePath, error_bad_lines=False)
print(df)
jsonFilePath = 'driver2.json'
# read cv file and add to data
data = {}
with urlopen(CSvFilePath) as csvFile:
 CSvReader = csv.DictReader(codecs.iterdecode(csvFile, 'utf-8'))
 for rows in CSvReader:
  id = rows ['cate']
  data[id] = rows
# create new json file and write data on it
with open (jsonFilePath,'w') as jsonFile:
# make it more readable and pretty
    jsonFile.write(json.dumps(data, indent=4))
    print(json.dumps(data, indent=4))
print("nnn")


        #sending data back to your frontend app
#""" @author: Almathami. Y """

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
    print("this is the cates")
    print(recommendations)
    # Storing Categories recommended for each customer
    recommendations = recommendations.to_dict()
    refsims = db.reference('/Categories')
    sim_ref = refsims.child(name)
    sim_ref.set(recommendations)
    

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
    print("this is the simms")
    print(simData)
    datajss=simData.to_dict()
    print(datajss)
    print(name)
    refsims = db.reference('/SimilarUsers')
    sim_ref = refsims.child(name)
    sim_ref.set(datajss)
    # Storing recommended Users for cusrrent userID
    simData.to_csv("https://raw.githubusercontent.com/Leena-MD/SwapIt_Sprint5/master/first_swap-master/assets/SimilarUsers.csv")
    
    
if __name__=="__main__":
    app.run(), 
