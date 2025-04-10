import 'package:flutter/material.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:poke_app/src/AtomicModel-UI/utils/ui_colors_palette.dart';

class UILoaderScreen {
  static bool _isLoading = false;
  static BuildContext? _dialogContext;

  static Future<void> showPageLoading(BuildContext context) async {
    if (_isLoading) {
      return;
    }
    _isLoading = true;

    showDialog(
      context: context,
      builder: (context) {
        _dialogContext = context;
        return const _DialogLoader();
      },
      useSafeArea: false,
      barrierColor: Colors.transparent,
    ).timeout(const Duration(seconds: 30), onTimeout: () {
      _isLoading = false;

      Navigator.pop(_dialogContext ?? context);
      _dialogContext = null;
    });
  }

  static void cancelPageLoading(BuildContext context) {
    if (!_isLoading) {
      return;
    }
    _isLoading = false;
    Navigator.pop(context);
    _dialogContext = null;
  }
}

class _DialogLoader extends StatelessWidget {
  const _DialogLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const UIDialogLoader(),
    );
  }
}

class UIDialogLoader extends StatelessWidget {
  const UIDialogLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: UIColorPalette.primaryWhite.withOpacity(.4),
      child: Center(
        child: SizedBox(
            width: 80,
            height: 80,
            child: Column(
              children: [
                FittedBox(
                  child: LoadingAnimationWidget.fourRotatingDots(
                    color: UIColorPalette.backgroundColor,
                    size: 100,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class AppBody {
  final String title;
  final Widget widget;

  AppBody(
    this.title,
    this.widget,
  );
}
