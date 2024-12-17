import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';


class ErrorDialog extends StatefulWidget {
  const ErrorDialog({
    super.key,
    required this.erroMsg,
    this.onCloseTap,
    this.hideCloseButton = false,
  });

  final bool hideCloseButton;
  final List<String> erroMsg;
  final void Function()? onCloseTap;

  @override
  State<ErrorDialog> createState() => _ErrorDialogState();
}

class _ErrorDialogState extends State<ErrorDialog>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _fadeAnimation;
  Animation<Offset>? _slideAnimation;

  String message = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this, // Required for animations
      duration: const Duration(milliseconds: 500), // Duration for both fade and slide
    );

    // Define the fade animation (opacity from 0.0 to 1.0)
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller!);

    // Define the slide animation (slide from below to its normal position)
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
        .animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeOut, // Smooth sliding curve
    ));

    // Start the animation when the page is built
    _controller?.forward();
    for (var element in widget.erroMsg) {
      message = "$message $element";
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_slideAnimation == null || _fadeAnimation == null) {
      return const SizedBox.shrink();
    }
    return PopScope(
      canPop: false,
      child: FadeTransition(
        opacity: _fadeAnimation!,
        child: SlideTransition(
          position: _slideAnimation!,
          child: SizedBox(
            width: context.width,
            child: AlertDialog(
                backgroundColor: KColor.transparent.color,
                buttonPadding: EdgeInsets.zero,
                actionsPadding: EdgeInsets.zero,
                contentPadding: EdgeInsets.zero,
                elevation: 0.0,
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: context.width,
                      padding: EdgeInsets.symmetric(
                        vertical: 20.h,
                        horizontal: 10.w,
                      ),
                      decoration: BoxDecoration(
                        color: KColor.red.color,
                        borderRadius: BorderRadius.circular(
                          6.r,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: KColor.white.color,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              GlobalText(
                                str: "Error",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: KColor.white.color,
                              ),
                              const Spacer(),
                              if (!widget.hideCloseButton)
                                InkWell(
                                  onTap: widget.onCloseTap ??
                                          () {
                                        Navigation.pop();
                                      },
                                  child: Icon(
                                    Icons.close,
                                    color: KColor.white.color,
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 32.w,
                                right: 32.w,
                              ),
                              child: GlobalText(
                                str: message.trim(),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: KColor.white.color,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
