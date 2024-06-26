import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MessageTab extends StatefulHookConsumerWidget {
  const MessageTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavesTabState();
}

class _FavesTabState extends ConsumerState<MessageTab> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Messages'),
    );
  }
}
