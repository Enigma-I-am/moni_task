import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moni_task/core/theme/theme.dart';
import 'package:moni_task/views/controller/tabs/home/widgets/offer_item.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool _animateLocation = false;
  bool _animateLocationContent = false;
  bool _animateAvatar = false;
  bool _animateName = false;
  bool _animateLine1 = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 300));
      if (mounted) {
        setState(() {
          _animateAvatar = true;
        });
      }
      await Future.delayed(const Duration(milliseconds: 600));
      if (mounted) {
        setState(() {
          _animateLocation = true;
        });
      }
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        await Future.delayed(const Duration(milliseconds: 800));
        if (mounted) {
          setState(() {
            _animateName = true;
          });
        }
        await Future.delayed(const Duration(milliseconds: 1000));
        if (mounted) {
          setState(() {
            _animateLine1 = true;
          });
        }
        await Future.delayed(const Duration(milliseconds: 1000));
        if (mounted) {
          setState(() {
            _animateLocationContent = true;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
      child: Column(
        children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: _animateLocation ? 1 : 0,
                  child: Chip(
                    backgroundColor: const Color(0xffffffff),
                    side: BorderSide.none,
                    label: AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: _animateLocationContent ? 1 : 0,
                      child: Text(
                        'Saint Petersburg',
                        style: AppTheme.textTheme.bodyMedium?.copyWith(
                          color: const Color(0xffa5957d),
                        ),
                      ),
                    ),
                    avatar: AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: _animateLocationContent ? 1 : 0,
                      child: const Icon(
                        Iconsax.location5,
                        color: Color(0xffa5957d),
                      ),
                    ),
                  ),
                ),
                AnimatedScale(
                  duration: const Duration(milliseconds: 500),
                  scale: _animateAvatar ? 1 : 0,
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.1, 0.6],
                        colors: [
                          Color(0xffd97805),
                          Color(0xfffc9f12),
                        ],
                      ),
                    ),
                    child: ClipOval(
                      child: Image.network(
                          'https://avatars.githubusercontent.com/u/24194413?v=4'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _animateName ? 1 : 0,
              child: const Text(
                'Hi, Marina',
                style: TextStyle(
                  color: Color(0xffa5957d),
                ),
              ),
            ),
          ),
          ClipRRect(
            child: Align(
              alignment: Alignment.topLeft,
              child: AnimatedSlide(
                duration: const Duration(milliseconds: 500),
                offset: _animateLine1 ? Offset.zero : const Offset(0, 1),
                child: const Text(
                  "let's select your \nperfect place",
                  style: TextStyle(
                    fontSize: 36,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ),
          ),
          // ClipRRect(
          //   child: Align(
          //     alignment: Alignment.topLeft,
          //     child: AnimatedSlide(
          //       duration: const Duration(milliseconds: 500),
          //       offset: _animateLine2 ? Offset.zero : const Offset(0, 1),
          //       child: const Text(
          //         'perfect place',
          //         style: TextStyle(
          //           fontSize: 36,
          //           color: Color(0xff000000),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          const SizedBox(height: 36),
          Row(
            children: [
              const Expanded(
                child: OfferItem(
                  title: 'BUY',
                  count: 1034,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: OfferItem(
                  title: 'RENT',
                  count: 2212,
                  color: const Color(0xffffffff),
                  textColor: const Color(0xffa5957d),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
