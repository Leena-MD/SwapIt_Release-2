import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Center_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class DonationsMap extends StatefulWidget {
  @override
  _DonationsMapState createState() => _DonationsMapState();
}

class _DonationsMapState extends State<DonationsMap> {

  @override
  GoogleMapController? _controller1;

  late GoogleMapController _controller;

  List<Marker> allMarkers = [];
   Location currentLocation = Location();


  late PageController _pageController;

  late BitmapDescriptor mapMarker;


  late int prevPage;
  void iniState(){
    super.initState();
    setCustMarker();
  }
void setCustMarker() async {

mapMarker = await BitmapDescriptor.fromAssetImage(
  ImageConfiguration(), 'assets\googlemapbluedo.png');
}

    void getLocation() async{
    var location = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((LocationData loc){
 
      _controller1?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
        target: LatLng(loc.latitude ?? 0.0,loc.longitude?? 0.0),
        zoom: 12.0,
      )));
      print(loc.latitude);
      print(loc.longitude);
      setCustMarker();
      setState(() {

        setCustMarker();



        allMarkers.add(
          Marker(markerId: MarkerId('Home'),
       // icon: mapMarker, مايشتغل اذا حطيته فيه مشكله
          infoWindow:
               InfoWindow(title: "موقعك الحالي",snippet: "     "),

            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
            //icon: mapMarker
        ));
      });
       });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      setCustMarker();
    Dcenters.forEach((element) {
      allMarkers.add(Marker(
          markerId: MarkerId(element.centerName),
          draggable: false,
          infoWindow:
              InfoWindow(title: element.centerName, snippet: element.address),
          position: element.locationCoords));
    });
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  void _onScroll() {
    if (_pageController.page!.toInt() != prevPage) {
      prevPage = _pageController.page!.toInt();
      moveCamera();
    }
  }

  _DcentersList(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget? widget){
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = (_pageController.page! - index);
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }

        
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 125.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      
      child: InkWell(
          onTap: () {
            // moveCamera();
          },
          child: 
          Stack(children: [
            Center(
                child: 
                Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10.0,
                    ),
                    height: 160.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          const BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 10.0,
                          ),
                        ]),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white),
                        child: Row(children: [
                          Expanded(
                            child: Container(
                                width: 90.0,
                                height: 160.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.0),
                                        topLeft: Radius.circular(10.0)),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            Dcenters[index].thumbNail),
                                        fit: BoxFit.fill))),
                          ),
                          const SizedBox(width: 5.0),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 170.0,
                                  child: Text(
                                    Dcenters[index].centerName,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 10.5,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  width: 170.0,
                                  child: Text(
                                    Dcenters[index].address,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 10.5,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  width: 170.0,
                                  child: Text(
                                    Dcenters[index].description,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                )
                              ])
                        ]))))
          ]
          )
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan[800],
          title: const Text('خريطة الجمعيات الخيريه'),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 50.0,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(24.774265, 46.738586), zoom: 11.0),
                markers: Set.from(allMarkers),
                onMapCreated: mapCreated,
              ),
            ),
            Positioned(
              bottom: 20.0,
              child: Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: Dcenters.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _DcentersList(index);
                  },
                ),
              ),
            )
          ],
        )
                , floatingActionButton: 
        FloatingActionButton(
        child: Icon(Icons.location_searching,color: Colors.white,),

        onPressed: (){
          getLocation();
        },
      ),
                          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        );
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: Dcenters[_pageController.page!.toInt()].locationCoords,
        zoom: 14.0,
        bearing: 45.0,
        tilt: 45.0)));
  }
}
 

