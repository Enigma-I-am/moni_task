import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moni_task/core/viewmodels/viewmodels.dart';
import 'package:moni_task/views/widgets/widgets.dart';

class MyHomePage extends StatefulHookConsumerWidget {
  const MyHomePage({
    super.key,
  });

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {

  final _controller = PageController(initialPage: 0);

  
  @override
  Widget build(BuildContext context) {
    final currentTab = ref.watch(
      controllerVM.select(
        (it) => it.currentTab,
      ),
    );

    final pages = ref.watch(
      controllerVM.select(
        (it) => it.pages,
      ),
    );
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: PageView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: [pages.indexed.where((it) => it.$1 == currentTab).first.$2.page],
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: ControllerBottomNav(),
          ),
        ],
      ),
    );
  }
}
