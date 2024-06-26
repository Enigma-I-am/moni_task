import 'package:flutter/material.dart';

class OfferItem extends StatefulWidget {
  const OfferItem({
    super.key,
    required this.title,
    required this.count,
    this.shape,
    this.borderRadius,
    this.color,
    this.textColor,
  });

  final String title;
  final int count;
  final BoxShape? shape;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final Color? textColor;

  @override
  State<OfferItem> createState() => _OfferItemState();
}

class _OfferItemState extends State<OfferItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<int> _animateCount;

  bool _animateSize = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _animateCount = StepTween(
      begin: 0,
      end: widget.count,
    ).animate(_animationController);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 3000));
      if (mounted) {
        setState(() {
          _animateSize = true;
        });
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 500),
      scale: _animateSize ? 1 : 0,
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          shape: widget.shape ?? BoxShape.rectangle,
          color: widget.color ?? const Color(0xfffc9f12),
          borderRadius: widget.borderRadius,
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 18, left: 16, right: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 16,
                  color: widget.textColor ?? const Color(0xffffffff),
                ),
              ),
              const SizedBox(height: 24),
              AnimatedBuilder(
                  animation: _animateCount,
                  builder: (context, child) {
                    return FittedBox(
                      child: Text(
                        '${_animateCount.value}',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: widget.textColor ?? const Color(0xffffffff),
                        ),
                      ),
                    );
                  }),
              Text(
                'offers',
                style: TextStyle(
                  color: widget.textColor ?? const Color(0xffffffff),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
