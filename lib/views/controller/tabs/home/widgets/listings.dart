import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moni_task/core/viewmodels/providers.dart';
import 'package:moni_task/views/controller/tabs/home/widgets/listing_item.dart';

class Listings extends StatefulHookConsumerWidget {
  const Listings({
    super.key,
  });

  @override
  ConsumerState<Listings> createState() => _ListingsState();
}

class _ListingsState extends ConsumerState<Listings> {
  bool _animateListings = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 3500));
      if (mounted) {
        setState(() {
          _animateListings = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final listing = ref.watch(controllerVM.select((value) => value.listings));
    return AnimatedSlide(
        offset: _animateListings ? Offset.zero : const Offset(0, 1),
        duration: const Duration(milliseconds: 500),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            color: Color(0xffffffff),
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: listing
                        .map(
                          (listing) => StaggeredGridTile.count(
                            crossAxisCellCount: listing.mainAxis,
                            mainAxisCellCount: listing.crossAxis,
                            child: ListingItem(
                              image: listing.image,
                              address: listing.address,
                              alignment: listing.mainAxis > listing.crossAxis
                                  ? Alignment.center
                                  : Alignment.centerLeft,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
