import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

import '../global/error_dialog.dart';

class CodeButton extends StatelessWidget {
  const CodeButton({
    super.key,
    this.path = '',
  });

  final String path;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _CodeModal.show(context, path),
      icon: const Icon(
        Icons.code,
        color: Colors.white,
      ),
    );
  }
}

class _CodeModal extends StatelessWidget {
  const _CodeModal();

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  static Future<void> show(
    BuildContext context,
    String codePath,
  ) async {
    try {
      final code = await DefaultAssetBundle.of(context).loadString(codePath);
      await showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return CodeModalContent(code: code);
        },
      );
    } on Exception catch (e) {
      await ErrorDialog.show(context, e);
    }
  }
}

class CodeModalContent extends StatelessWidget {
  const CodeModalContent({
    super.key,
    required this.code,
  });
  final String code;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 0.90,
      width: double.infinity,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 56),
            child: SyntaxView(
              code: code,
              syntax: Syntax.DART,
              syntaxTheme: SyntaxTheme.vscodeDark(),
              fontSize: 14,
              expanded: true,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              splashRadius: 12,
              iconSize: 32,
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
