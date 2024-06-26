import 'package:flutter/material.dart';
import 'package:moni_task/views/controller/tabs/home/widgets/home_body.dart';
import 'package:moni_task/views/controller/tabs/home/widgets/listings.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffffffff), Color(0xffe9a135)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.05, 0.9],
        ),
      ),
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext headerContext, bool boolean) {
          return [
            const SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: 440,
              flexibleSpace: FlexibleSpaceBar(
                background: HomeBody(),
              ),
            )
          ];
        },
        body: const Listings(),
      ),
    );
  }
}
