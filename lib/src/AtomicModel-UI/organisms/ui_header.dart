import '../module_ui.dart';

enum UIHeaderType { transparentWithTitle }

class UIHeader extends StatelessWidget implements PreferredSizeWidget {
  final String? toolbarText;
  final VoidCallback? onActionPressed;
  final VoidCallback? onHelpPressed;
  final VoidCallback? onNotificationPressed;
  final VoidCallback? onCrossPressed;
  final VoidCallback? onLogoutPressed;
  final double bottomLeftRadius;
  final double bottomRightRadius;
  final Color backgroundColor;
  final UIHeaderType headerType;
  final bool? onOffFlash;
  final String? stepText;
  final String? nextStepText;
  final int? currentStep;
  final int? totalStep;
  final Widget? onNext;

  const UIHeader({
    required this.bottomLeftRadius,
    required this.bottomRightRadius,
    required this.backgroundColor,
    required this.headerType,
    this.toolbarText,
    this.onActionPressed,
    this.onHelpPressed,
    this.onNotificationPressed,
    this.onCrossPressed,
    this.onOffFlash,
    this.onLogoutPressed,
    this.stepText,
    this.nextStepText,
    this.currentStep,
    this.totalStep,
    this.onNext,
    super.key,
  });

  const UIHeader.withTitle({
    required String title,
    VoidCallback? onActionPressed,
    VoidCallback? onHelpPressed,
    VoidCallback? onNotificationPressed,
    VoidCallback? onCrossPressed,
    VoidCallback? onLogoutPressed,
    bool? isAgentMaster,
    bool? isMTFlow = false,
    Widget? onNext,
    Key? key,
  }) : this(
         bottomLeftRadius: UISpacing.spacingXL_32,
         bottomRightRadius: 0.0,
         backgroundColor: Colors.transparent,
         headerType: UIHeaderType.transparentWithTitle,
         toolbarText: title,
         onActionPressed: onActionPressed,
         onHelpPressed: onHelpPressed,
         onNotificationPressed: onNotificationPressed,
         onCrossPressed: onCrossPressed,
         onLogoutPressed: onLogoutPressed,
         key: key,
         onNext: onNext,
       );

  @override
  Widget build(BuildContext context) {
    final double dynamicHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(bottomLeftRadius),
          bottomRight: Radius.circular(bottomRightRadius),
        ),
        color: backgroundColor,
      ),
      child: SafeArea(
        child: Container(
          constraints: const BoxConstraints(
            minWidth: double.infinity,
            minHeight: double.infinity,
          ),
          padding: EdgeInsets.symmetric(horizontal: UISpacing.spacingL_24),
          child: Container(child: _getToolbarWidgets(headerType)),
        ),
      ),
    );
  }

  Widget _getToolbarWidgets(UIHeaderType headerType) {
    switch (headerType) {
      case UIHeaderType.transparentWithTitle:
        return Row(
          children: [
            InkWell(
              onTap: onActionPressed,
              child: Icon(Icons.navigate_before, color: Colors.white),
            ),
            Expanded(
              child: Text(
                toolbarText!,
                maxLines: 1,
                style: UITextStyles.subtituloMedium_16.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            onNext!,
          ],
        );
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
