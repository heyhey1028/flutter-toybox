import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef AppValueWidgetBuilder<T> = Widget Function(
  BuildContext context,
  T value,
);

typedef AppErrorWidgetBuilder = Widget Function(
  BuildContext context,
  Object error,
  StackTrace? stackTrace,
);

class AsyncBuilder<T> extends ConsumerWidget {
  const AsyncBuilder({
    super.key,
    required this.provider,
    required this.builder,
    this.loadingBuilder,
    this.errorBuilder,
  });

  AsyncBuilder.withDefault({
    super.key,
    required this.provider,
    required this.builder,
    required T defaultValue,
    this.errorBuilder,
  }) : loadingBuilder = ((context) => builder(context, defaultValue));

  final ProviderListenable<AsyncValue<T>> provider;
  final AppValueWidgetBuilder<T> builder;
  final WidgetBuilder? loadingBuilder;
  final AppErrorWidgetBuilder? errorBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(provider).when(
          data: (data) => builder(context, data),
          loading: () => loadingBuilder != null
              ? loadingBuilder!(context)
              : const AsyncBuilderDefaultLoadingWidget(),
          error: (e, s) {
            return errorBuilder != null
                ? errorBuilder!(context, e, s)
                : Container();
          },
        );
  }
}

class AsyncBuilderDefaultLoadingWidget extends StatelessWidget {
  const AsyncBuilderDefaultLoadingWidget({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
