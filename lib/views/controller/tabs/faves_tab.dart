import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavesTab extends StatefulHookConsumerWidget {
  const FavesTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavesTabState();
}

class _FavesTabState extends ConsumerState<FavesTab> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Faves'),
    );
  }
}
