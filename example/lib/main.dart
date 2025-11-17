import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gallimaps_vector_plugin/gallimaps_vector_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const VectorMap(),
    );
  }
}

class VectorMap extends StatefulWidget {
  const VectorMap({super.key});

  @override
  State<VectorMap> createState() => _VectorMapState();
}

class _VectorMapState extends State<VectorMap> {
  GalliMapController? controller;
  GalliMethods methods = GalliMethods("token");
  List<Marker> markers = [];
  late void Function() clearMarkers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: GalliMap(
            showCurrentLocation: true,
            authToken: "token",
            size: (
              height: MediaQuery.of(context).size.height * 2,
              width: MediaQuery.of(context).size.width * 2,
            ),
            compassPosition: (
              position: CompassViewPosition.topRight,
              offset: const Point(32, 82),
            ),
            showCompass: true,
            onMapCreated: (newC) {
              controller = newC;

              controller!.addFill(FillOptions());
              controller!.addCircle(
                CircleOptions(
                  circleOpacity: 0.32,
                  geometry: LatLng(27.677670698052346, 85.32128605620954),
                  circleRadius: 50,
                ),
              );
              setState(() {});
            },
            onMapClick: (LatLng latLng) {
              // methods.get360Image(latLng).then((value) {
              //   if (value != null) {
              //     GalliViewer galliViewer = GalliViewer(
              //       builder:
              //           (BuildContext context, Function() methodFromChild) {
              //         clearMarkers = methodFromChild;
              //       },
              //       image: value,
              //       onTap: (latitude, longitude, tilt) {},
              //       markers: markers,
              //       maxMarkers: 2,
              //     );
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (_) => Scaffold(
              //                 appBar: AppBar(
              //                   actions: [
              //                     GestureDetector(
              //                         onTap: () {
              //                           clearMarkers();
              //                         },
              //                         child: const Text("Clear"))
              //                   ],
              //                 ),
              //                 body: galliViewer)));
              //   } else {
              //     log("Image not found");
              //   }
              // });

              // String? data =
              //     await galliMapController!.reverGeoCoding(latLng);
              // log("latlng $latLng");
            },
          ),
        ),
      ),
    );
  }
}
