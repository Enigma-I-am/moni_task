import 'package:flutter/material.dart';
import 'package:moni_task/views/controller/tabs/home/widgets/sliding_button.dart';


class ListingItem extends StatelessWidget {
  const ListingItem({
    super.key,
    required this.image,
    required this.address,
    required this.alignment,
  });

  final String image;
  final String address;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.bottomLeft,
            child: SlidingButton(address: address, alignment: alignment)),
      ],
    );
  }
}
