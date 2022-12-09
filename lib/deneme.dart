import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OverlayController {
  final Widget? background;
  late final Widget widget;
  OverlayController({
    this.background,
    required this.widget,
  });

  late final _overlayEntryOpacity = OverlayEntry(builder: (context) {
    return background ??
        Opacity(
          opacity: .5,
          child: Container(
            color: Colors.black,
          ),
        );
  });

  late final _overlayEntryWidget = OverlayEntry(
    builder: (context) {
      return widget;
    },
  );

  bool isShowing = false;
  void show() {
    if (isShowing) return;

    // _overlayState.insert(_overlayEntryOpacity);
    // _overlayState.insert(_overlayEntryWidget);
    isShowing = true;
  }

  void hide() {
    if (!isShowing) return;
    _overlayEntryWidget.remove();
    _overlayEntryOpacity.remove();
    isShowing = false;
  }
}

class LoadingController {
  static final _loadingController = OverlayController(
    widget: Center(
      child: SizedBox(
        height: 90,
        width: 90,
        child: Platform.isIOS
            ? const CupertinoActivityIndicator(
                radius: 20,
              )
            : const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
              ),
      ),
    ),
  );

  static bool get isShowing => _loadingController.isShowing;

  static void showLoading() => _loadingController.show();
  static void hideLoading() => _loadingController.hide();
}

class ToastController {
  final String text;
  ToastController(this.text);
  late final _toastController = OverlayController(
    background: const SizedBox.shrink(),
    widget: Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 35.0),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.normal,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    ),
  );

  void showToast() {
    _toastController.show();
    Future.delayed(const Duration(milliseconds: 2400), hideToast);
  }

  void hideToast() {
    _toastController.hide();
  }
}

// class name will be updated later
class CustomSnackbar {
  final String text;
  final bool isSuccess;
  final bool isInfo;
  CustomSnackbar(this.text, this.isSuccess, {this.isInfo = false});
  late final _toastController = OverlayController(
    background: const SizedBox.shrink(),
    widget: !isInfo
        ? GestureDetector(
            onTap: () => _toastController.hide(),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ShakeTransitition(
                axis: isSuccess ? Axis.vertical : Axis.horizontal,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 40.0, left: 12, right: 12, top: 30),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  decoration: BoxDecoration(
                    color: isSuccess ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.10),
                        spreadRadius: 0,
                        blurRadius: 1,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 18,
                        child: Center(
                          child: FaIcon(
                            isSuccess ? FontAwesomeIcons.check : FontAwesomeIcons.exclamation,
                            color: isSuccess ? Colors.green : Colors.red,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 200,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isSuccess ? 'success' : 'error',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Flexible(
                              child: Text(
                                text,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        : GestureDetector(
            onTap: () => _toastController.hide(),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ShakeTransitition(
                axis: Axis.vertical,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 30.0, left: 12, right: 12, top: 30),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.10),
                        spreadRadius: 0,
                        blurRadius: 1,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 18,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 3.0, left: 1),
                            child: FaIcon(
                              FontAwesomeIcons.info,
                              color: Colors.orange,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 200,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'info',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Flexible(
                              child: Text(
                                text,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
  );

  void showToast() {
    _toastController.show();
    Future.delayed(const Duration(milliseconds: 2000), hideToast);
  }

  void hideToast() {
    _toastController.hide();
  }
}

class ShakeTransitition extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double offset;
  final Axis axis;
  const ShakeTransitition({
    Key? key,
    this.duration = const Duration(milliseconds: 800),
    this.offset = 140.0,
    this.axis = Axis.horizontal,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1.0, end: 0.0),
      duration: duration,
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.translate(
          offset: axis == Axis.horizontal
              ? Offset(
                  value * offset,
                  0.0,
                )
              : Offset(
                  0.0,
                  value * offset,
                ),
          child: child,
        );
      },
      child: child,
    );
  }
}
