import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moni_task/core/viewmodels/providers.dart';
import 'package:moni_task/utils/utils.dart';
import 'package:moni_task/views/widgets/widgets.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

class SearchScreen extends StatefulHookConsumerWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _mapController = Completer<GoogleMapController>();
  bool _animateItems = false;
  bool _animateOptions = false;

  final CameraPosition _initialCameraPosition = const CameraPosition(
    target: LatLng(6.6025926099405226, 3.2849539756822987),
    zoom: 16,
  );

  final Set<Marker> _markers = {};

  Future<void> _addMarkers() async {
    await Future.delayed(const Duration(milliseconds: 200));
    _markers.addAll({
      Marker(
        markerId: const MarkerId('marker_1'),
        position: const LatLng(6.607354, 3.282811),
        icon: await const CustomMarker(title: '10,3 mn P').toBitmapDescriptor(),
      ),
      Marker(
        markerId: const MarkerId('marker_2'),
        position: const LatLng(6.605701, 3.283308),
        icon: await const CustomMarker(title: '11 mn P').toBitmapDescriptor(),
      ),
      Marker(
        markerId: const MarkerId('marker_3'),
        position: const LatLng(6.604992, 3.287754),
        icon: await const CustomMarker(title: '7,8 mn P').toBitmapDescriptor(),
      ),
      Marker(
        markerId: const MarkerId('marker_4'),
        position: const LatLng(6.602455, 3.287775),
        icon: await const CustomMarker(title: '8,5 mn P').toBitmapDescriptor(),
      ),
      Marker(
        markerId: const MarkerId('marker_5'),
        position: const LatLng(6.600324, 3.283097),
        icon: await const CustomMarker(title: '13,3 mn P').toBitmapDescriptor(),
      ),
      Marker(
        markerId: const MarkerId('marker_6'),
        position: const LatLng(6.597686, 3.286839),
        icon: await const CustomMarker(title: '6,95 mn P').toBitmapDescriptor(),
      )
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // await _loadMapStyle();
      await _addMarkers();
      if (mounted) {
        setState(() {
          _animateItems = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final menuItems = ref.watch(
      controllerVM.select(
        (value) => value.mapMenuOptions,
      ),
    );
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: _initialCameraPosition,
          style: mapStyle,
          markers: _markers,
          onMapCreated: (GoogleMapController controller) async {
            _mapController.complete(controller);
          },
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: AnimatedScale(
                        scale: _animateItems ? 1 : 0,
                        duration: const Duration(milliseconds: 700),
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: const Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Iconsax.search_normal_1),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Saint Petersburg',
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                    const SizedBox(width: 10),
                    AnimatedScale(
                      scale: _animateItems ? 1 : 0,
                      duration: const Duration(milliseconds: 700),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xffffffff), shape: BoxShape.circle),
                        child: const Padding(
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Iconsax.candle_2,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Stack(
                  children: [
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: AnimatedScale(
                        scale: _animateItems ? 1 : 0,
                        duration: const Duration(milliseconds: 700),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _animateOptions = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xff737373).withOpacity(0.9),
                                shape: BoxShape.circle),
                            child: const Padding(
                              padding: EdgeInsets.all(12),
                              child:
                                  Icon(Icons.layers, color: Color(0xffffffff)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _animateOptions = false;
                        });
                      },
                      child: AnimatedScale(
                        alignment: Alignment.bottomLeft,
                        scale: _animateOptions ? 1 : 0,
                        duration: const Duration(milliseconds: 700),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(24)),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: menuItems.indexed.map((item) {
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        item.$2.icon,
                                        color: item.$1 == 1
                                            ? const Color(0xfffc9f12)
                                            : const Color(0xff737373),
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        item.$2.name,
                                        style: TextStyle(
                                            color: item.$1 == 1
                                                ? const Color(0xfffc9f12)
                                                : const Color(0xff737373)),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ).nudge(x: 45, y: -30),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 4),
                        AnimatedScale(
                          scale: _animateItems ? 1 : 0,
                          duration: const Duration(milliseconds: 700),
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xff737373).withOpacity(0.9),
                                shape: BoxShape.circle),
                            child: const Padding(
                              padding: EdgeInsets.all(12),
                              child: Icon(Icons.arrow_outward,
                                  color: Color(0xffffffff)),
                            ),
                          ),
                        )
                      ],
                    ),
                    AnimatedScale(
                      scale: _animateItems ? 1 : 0,
                      duration: const Duration(milliseconds: 700),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xff737373).withOpacity(0.9),
                            borderRadius: BorderRadius.circular(28)),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              top: 12, bottom: 12, left: 18, right: 18),
                          child: Row(
                            children: [
                              Icon(Icons.menu, color: Color(0xffffffff)),
                              SizedBox(width: 10),
                              Text(
                                'List of variants',
                                style: TextStyle(color: Color(0xffffffff)),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: kBottomNavigationBarHeight * 1.4),
              ],
            ),
          ),
        )
      ],
    );
  }
}
