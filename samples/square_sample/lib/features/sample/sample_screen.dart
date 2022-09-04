import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/app_scaffold.dart';

final transactionProvider =
    StateProvider.autoDispose<String>((ref) => 'No Transaction Yet');

class SampleScreen extends ConsumerWidget {
  const SampleScreen({super.key});

  static const squareChannel = MethodChannel('kiosk.flutter/square');
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      color: Colors.grey,
      body: Stack(
        children: [
          Center(
            child: Text(
              ref.watch(transactionProvider),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.7),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
              ),
              onPressed: () => _openSquareReaderPayment(ref),
              child: const Text('OPEN SQUARE'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openSquareReaderPayment(
    WidgetRef ref,
  ) async {
    final arguments = <String, dynamic>{
      'price': 140,
      'memo': 'test',
      'disablesKeyedInCardEntry': true,
    };
    final transactionID =
        await squareChannel.invokeMethod<String?>('openSquare', arguments);

    ref
        .read(transactionProvider.notifier)
        .update((state) => 'Success with $transactionID');
  }
}
