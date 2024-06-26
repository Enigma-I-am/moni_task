import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moni_task/core/models/models.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moni_task/views/controller/tabs/home/home_tab.dart';
import 'package:moni_task/views/controller/tabs/message_tab.dart';
import 'package:moni_task/views/controller/tabs/profile_tab.dart';
import 'package:moni_task/views/controller/tabs/search_tab.dart';

import '../../views/controller/tabs/faves_tab.dart';

typedef ListingModel = ({
  String address,
  String image,
  int mainAxis,
  int crossAxis
});

class ControllerVM extends ChangeNotifier {
  ControllerVM(this.ref);

  final Ref ref;

  final pages = <ControllerPageModel>[
    const ControllerPageModel(
      icon: Iconsax.search_normal_15,
      name: 'Search',
      page: SearchScreen(),
    ),
    const ControllerPageModel(
      icon: Iconsax.message5,
      name: 'Message',
      page: MessageTab(),
    ),
    const ControllerPageModel(
      icon: Iconsax.home5,
      name: 'Home',
      page: HomeTab(),
    ),
    const ControllerPageModel(
      icon: Iconsax.heart5,
      name: 'Fave',
      page: FavesTab(),
    ),
    const ControllerPageModel(
      icon: Iconsax.profile_tick5,
      name: 'Profile',
      page: ProfileTab(),
    ),
  ];

  final mapMenuOptions = const <MapMenuOptionsModel>[
    MapMenuOptionsModel(
      icon: Iconsax.shield_tick,
      name: 'Cosy areas',
    ),
    MapMenuOptionsModel(
      icon: Iconsax.empty_wallet,
      name: 'Price',
    ),
    MapMenuOptionsModel(
      icon: Iconsax.bag,
      name: 'Infrastructure',
    ),
    MapMenuOptionsModel(
      icon: Iconsax.layer,
      name: 'Without any layer',
    ),
  ];

  final List<ListingModel> listings = [
    (
      address: 'Gladkova St., 25',
      image: 'assets/images/place_1.png',
      mainAxis: 2,
      crossAxis: 1
    ),
    (
      address: 'Gubina St., 11',
      image: 'assets/images/place_2.png',
      mainAxis: 1,
      crossAxis: 2
    ),
    (
      address: 'Trefoleva St., 43',
      image: 'assets/images/place_3.png',
      mainAxis: 1,
      crossAxis: 1
    ),
    (
      address: 'Sedova St., 22',
      image: 'assets/images/place_4.png',
      mainAxis: 1,
      crossAxis: 1
    )
  ];

  int _currentTab = 2;
  int get currentTab => _currentTab;
  set currentTab(int val) {
    _currentTab = val;
    notifyListeners();
  }
}
