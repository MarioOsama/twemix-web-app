import 'package:crm/core/theming/app_colors.dart';
import 'package:crm/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';

const double HORIZONTAL_MARGIN_PERCENT = 0.30;
const double TOP_MARGIN = 75;

enum AppMessageBarType { success, error, warning }

class AppMessageBar {
  // Keep track of the current overlay entry to remove it if necessary
  static OverlayEntry? _currentOverlayEntry;

  /// Displays a message bar with the specified message and type.
  ///
  /// This method shows a message bar overlay in the given [context] with the
  /// provided [message] and [type]. If an existing message bar is currently
  /// being displayed, it will be removed before showing the new one.
  ///
  /// The message bar will automatically be removed after a delay of 3 seconds.
  ///
  /// Parameters:
  /// - [context]: The build context in which to display the message bar.
  /// - [message]: The message to display in the message bar.
  /// - [type]: The type of the message bar, which determines its appearance.

  AppMessageBar.showBar(
      BuildContext context, String message, AppMessageBarType type) {
    // If an existing message is being shown, remove it first
    _removeCurrentBar();

    // Create a new overlay entry
    _currentOverlayEntry = OverlayEntry(
      builder: (context) => _MessageBar(
        message: message,
        type: type,
      ),
    );

    // Insert the new overlay entry
    Overlay.of(context).insert(_currentOverlayEntry!);

    // Remove the message bar after a delay
    Future.delayed(const Duration(seconds: 3), () {
      _removeCurrentBar();
    });
  }

  static void _removeCurrentBar() {
    // Remove the current overlay if it's still being shown
    if (_currentOverlayEntry != null) {
      _currentOverlayEntry!.remove();
      _currentOverlayEntry = null;
    }
  }
}

class _MessageBar extends StatefulWidget {
  final String message;
  final AppMessageBarType type;

  const _MessageBar({
    required this.message,
    required this.type,
  });

  @override
  __MessageBarState createState() => __MessageBarState();
}

class __MessageBarState extends State<_MessageBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));

    // Start the animation when the widget is built
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double horizontalMargin =
        MediaQuery.of(context).size.width * HORIZONTAL_MARGIN_PERCENT;

    return Positioned(
      top: TOP_MARGIN,
      left: horizontalMargin,
      right: horizontalMargin,
      child: FadeTransition(
        opacity: _animation,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _getColor(widget.type),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                widget.message,
                style: AppTextStyles.font16WhiteSemiBold(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getColor(AppMessageBarType type) {
    switch (type) {
      case AppMessageBarType.success:
        return AppColors.green;
      case AppMessageBarType.error:
        return AppColors.red;
      case AppMessageBarType.warning:
        return AppColors.yellow;
    }
  }
}
