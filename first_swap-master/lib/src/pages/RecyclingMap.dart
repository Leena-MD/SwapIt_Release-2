import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Center_model.dart';
import 'package:location/location.dart';

class RecyclingMap extends StatefulWidget {
  @override
  _RecyclingMapState createState() => _RecyclingMapState();
}

class _RecyclingMapState extends State<RecyclingMap> {
  _makingPhoneCall(String url) async {
    url = 'tel:' + url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  GoogleMapController? _controller1;

  late GoogleMapController _controller;

  List<Marker> allMarkers = [];

  late PageController _pageController;
  Location currentLocation = Location();

  late int prevPage;
  late BitmapDescriptor mapMarker;

  @override
  void iniState() {
    super.initState();
    setCustMarker();
  }

  void setCustMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/googlemapbluedo.png');
  }

  void getLocation() async {
    var location = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((LocationData loc) {
      _controller1
          ?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
        target: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
        zoom: 12.0,
      )));
      print(loc.latitude);
      print(loc.longitude);
      setCustMarker();
      setState(() {
        setCustMarker();

        allMarkers.add(Marker(
            markerId: MarkerId('Home'),
            infoWindow: InfoWindow(title: "موقعك الحالي", snippet: "     "),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
            icon: mapMarker));
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Rcenters.forEach((element) {
      allMarkers.add(Marker(
        markerId: MarkerId(element.centerName),
        draggable: false,
        onTap: () {
          setState(() {
            _pageController.jumpToPage(element.index);
          });
        },
        infoWindow:
            InfoWindow(title: element.centerName, snippet: element.address),
        position: element.locationCoords,
      ));
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

  _RcentersList(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget? widget) {
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
            moveCamera();
          },
          child: Stack(children: [
            Center(
                child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10.0,
                    ),
                    height: 160.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
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
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.0),
                                        topLeft: Radius.circular(10.0)),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            Rcenters[index].thumbNail),
                                        fit: BoxFit.fill))),
                          ),
                          SizedBox(width: 5.0),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 170.0,
                                  child: Text(
                                    Rcenters[index].centerName,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  width: 170,
                                  child: Text(
                                    Rcenters[index].address,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
<<<<<<< Updated upstream
                                Container(
                                  width: 170.0,
                                  child: InkWell(
                                    child: Text(
                                      Dcenters[index].phoneNumber,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    onTap: () {
                                      if (Dcenters[index].phoneNumber.length >
                                          0) {
                                        showDialog<bool>(
                                          context: context,
                                          builder: (c) => AlertDialog(
                                            titleTextStyle: TextStyle(),
                                            title: Text(
                                              'تنبية',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                            content: Text(
                                                'هل تريد الاتصال بالرقم ' +
                                                    Dcenters[index].phoneNumber,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w900)),
                                            actions: [
                                              FlatButton(
                                                  child: Text('نعم',
                                                      style: TextStyle(
                                                          color: Colors
                                                              .blue.shade800,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w900)),
                                                  onPressed: () {
                                                    setState(() {
                                                      _makingPhoneCall(
                                                          Dcenters[index]
                                                              .phoneNumber);
                                                    });
                                                    Navigator.pop(c, true);
                                                  }),
                                              FlatButton(
                                                child: Text('لا',
                                                    style: TextStyle(
                                                        color:
                                                            Colors.red.shade800,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w900)),
                                                onPressed: () =>
                                                    Navigator.pop(c, false),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                )
=======
                                Dcenters[index].phoneNumber.length > 0
                                    ? TextButton.icon(
                                        onPressed: () {
                                          _makingPhoneCall(
                                              Dcenters[index].phoneNumber);
                                        },
                                        icon: Icon(Icons.call),
                                        label: Text(Dcenters[index].phoneNumber,
                                            style: TextStyle(
                                                fontSize: 11.0,
                                                fontWeight: FontWeight.w300)))
                                    : Row(),
>>>>>>> Stashed changes
                              ])
                        ]))))
          ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.cyan[800], //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        title: Text('خريطة مراكز اعادة التدوير'),
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
                itemCount: Rcenters.length,
                itemBuilder: (BuildContext context, int index) {
                  return _RcentersList(index);
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.location_searching,
          color: Colors.white,
        ),
        onPressed: () {
          getLocation();
        },
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: Rcenters[_pageController.page!.toInt()].locationCoords,
        zoom: 14.0,
        bearing: 45.0,
        tilt: 45.0)));
  }
}
