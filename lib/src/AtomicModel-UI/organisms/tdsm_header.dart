import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:poke_app/src/AtomicModel-UI/organisms/asset_image.dart';
import 'package:poke_app/src/AtomicModel-UI/organisms/tdsm_logos_horizontal.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../module_ui.dart';

enum TDSMHeaderType {
  camera,
  cameraNoFlash,
  primary,
  transparentWithLogo,
  transparentWithLogoAndIcons,
  transparentWithTitle,
  transparentWalletUser,
  transparentWalletMerchant,
  transparentWithoutLogo,
  codeScanner,
  agent,
  transparentWithAgentLogo,
  transparentWithTitleSteps,
  transparentWithTitleStepsCircular,
  transparentWithTitleHelpTyC,
}

class TDSMHeader extends StatelessWidget implements PreferredSizeWidget {
  final String? toolbarText;
  final VoidCallback? onActionPressed;
  final VoidCallback? onHelpPressed;
  final VoidCallback? onNotificationPressed;
  final VoidCallback? onCrossPressed;
  final VoidCallback? onLogoutPressed;
  final double bottomLeftRadius;
  final double bottomRightRadius;
  final Color backgroundColor;
  final TDSMHeaderType headerType;
  final bool? onOffFlash;
  final bool? isAgentMaster;
  final bool isAgentSuccess;
  final bool? isMTFlow;
  final String? stepText;
  final String? nextStepText;
  final int? currentStep;
  final int? totalStep;
  final Widget? onNext;

  const TDSMHeader({
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
    this.isAgentMaster,
    this.isAgentSuccess = false,
    this.isMTFlow = false,
    this.stepText,
    this.nextStepText,
    this.currentStep,
    this.totalStep,
    this.onNext,
    super.key,
  });

  const TDSMHeader.camera({
    required VoidCallback onActionPressed,
    required VoidCallback onFlashPressed,
    required bool onOffFlash,
    Key? key,
  }) : this(
         bottomLeftRadius: 0.0,
         bottomRightRadius: 0.0,
         backgroundColor: UIColorPalette.primarySpaceCadet,
         headerType: TDSMHeaderType.camera,
         onActionPressed: onActionPressed,
         onHelpPressed: onFlashPressed,
         onOffFlash: onOffFlash,
         key: key,
       );

  const TDSMHeader.qr({
    required VoidCallback onActionPressed,
    required VoidCallback onFlashPressed,
    required bool onOffFlash,
    required String toolbarText,
    Key? key,
  }) : this(
         bottomLeftRadius: 0.0,
         bottomRightRadius: 0.0,
         backgroundColor: UIColorPalette.primarySpaceCadet,
         headerType: TDSMHeaderType.codeScanner,
         onActionPressed: onActionPressed,
         onHelpPressed: onFlashPressed,
         onOffFlash: onOffFlash,
         toolbarText: toolbarText,
         key: key,
       );

  const TDSMHeader.cameraNoFlash({
    required VoidCallback onActionPressed,
    Key? key,
  }) : this(
         bottomLeftRadius: 0.0,
         bottomRightRadius: 0.0,
         backgroundColor: UIColorPalette.primarySpaceCadet,
         headerType: TDSMHeaderType.cameraNoFlash,
         onActionPressed: onActionPressed,
         key: key,
       );

  const TDSMHeader.primary({required VoidCallback onActionPressed, Key? key})
    : this(
        bottomLeftRadius: 0.0,
        bottomRightRadius: 0.0,
        backgroundColor: UIColorPalette.primarySpaceCadet,
        headerType: TDSMHeaderType.primary,
        onActionPressed: onActionPressed,
        key: key,
      );

  const TDSMHeader.withTitle({
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
         isAgentMaster: isAgentMaster,
         bottomLeftRadius: UISpacing.spacingXL_32,
         bottomRightRadius: 0.0,
         backgroundColor: Colors.transparent,
         headerType: TDSMHeaderType.transparentWithTitle,
         toolbarText: title,
         onActionPressed: onActionPressed,
         onHelpPressed: onHelpPressed,
         onNotificationPressed: onNotificationPressed,
         onCrossPressed: onCrossPressed,
         onLogoutPressed: onLogoutPressed,
         key: key,
         isMTFlow: isMTFlow,
      onNext:onNext
       );

  const TDSMHeader.withTitleHelpTyC({
    required String title,
    VoidCallback? onActionPressed,
    VoidCallback? onHelpPressed,
    VoidCallback? onNotificationPressed,
    VoidCallback? onCrossPressed,
    VoidCallback? onLogoutPressed,
    bool? isAgentMaster,
    bool? isMTFlow = false,
    Key? key,
  }) : this(
         isAgentMaster: isAgentMaster,
         bottomLeftRadius: UISpacing.spacingXL_32,
         bottomRightRadius: 0.0,
         backgroundColor: Colors.transparent,
         headerType: TDSMHeaderType.transparentWithTitleHelpTyC,
         toolbarText: title,
         onActionPressed: onActionPressed,
         onHelpPressed: onHelpPressed,
         onNotificationPressed: onNotificationPressed,
         onCrossPressed: onCrossPressed,
         onLogoutPressed: onLogoutPressed,
         key: key,
         isMTFlow: isMTFlow,
       );

  const TDSMHeader.withTitleSteps({
    required String title,
    VoidCallback? onActionPressed,
    VoidCallback? onHelpPressed,
    VoidCallback? onNotificationPressed,
    VoidCallback? onCrossPressed,
    VoidCallback? onLogoutPressed,
    bool? isAgentMaster,
    bool? isMTFlow = false,
    String? stepText,
    Key? key,
  }) : this(
         isAgentMaster: isAgentMaster,
         bottomLeftRadius: UISpacing.spacingXL_32,
         bottomRightRadius: 0.0,
         backgroundColor: Colors.transparent,
         headerType: TDSMHeaderType.transparentWithTitleSteps,
         toolbarText: title,
         onActionPressed: onActionPressed,
         onHelpPressed: onHelpPressed,
         onNotificationPressed: onNotificationPressed,
         onCrossPressed: onCrossPressed,
         onLogoutPressed: onLogoutPressed,
         key: key,
         isMTFlow: isMTFlow,
         stepText: stepText,
       );

  const TDSMHeader.withTitleStepsCircular({
    required String title,
    VoidCallback? onActionPressed,
    VoidCallback? onHelpPressed,
    VoidCallback? onNotificationPressed,
    VoidCallback? onCrossPressed,
    VoidCallback? onLogoutPressed,
    bool? isAgentMaster,
    bool? isMTFlow = false,
    String? stepText,
    String? nextStepText,
    int? currentStep,
    int? totalStep,
    Key? key,
  }) : this(
         isAgentMaster: isAgentMaster,
         bottomLeftRadius: UISpacing.spacingXL_32,
         bottomRightRadius: 0.0,
         backgroundColor: Colors.transparent,
         headerType: TDSMHeaderType.transparentWithTitleStepsCircular,
         toolbarText: title,
         onActionPressed: onActionPressed,
         onHelpPressed: onHelpPressed,
         onNotificationPressed: onNotificationPressed,
         onCrossPressed: onCrossPressed,
         onLogoutPressed: onLogoutPressed,
         key: key,
         isMTFlow: isMTFlow,
         stepText: stepText,
         nextStepText: nextStepText,
         currentStep: currentStep,
         totalStep: totalStep,
       );

  const TDSMHeader.withLogo({Key? key})
    : this(
        bottomLeftRadius: 0.0,
        bottomRightRadius: 0.0,
        backgroundColor: Colors.transparent,
        headerType: TDSMHeaderType.transparentWithLogo,
        key: key,
      );

  const TDSMHeader.withLogoAndIcons({
    required VoidCallback onActionPressed,
    required VoidCallback onHelpPressed,
    Key? key,
  }) : this(
         bottomLeftRadius: 0.0,
         bottomRightRadius: 0.0,
         backgroundColor: Colors.transparent,
         headerType: TDSMHeaderType.transparentWithLogoAndIcons,
         onActionPressed: onActionPressed,
         onHelpPressed: onHelpPressed,
         key: key,
       );

  const TDSMHeader.walletUser({
    required String walletUserName,
    required VoidCallback onActionPressed,
    VoidCallback? onHelpPressed,
    VoidCallback? onNotificationPressed,
    Key? key,
  }) : this(
         bottomLeftRadius: UISpacing.spacingM_16,
         bottomRightRadius: UISpacing.spacingM_16,
         backgroundColor: Colors.transparent,
         headerType: TDSMHeaderType.transparentWalletUser,
         toolbarText: walletUserName,
         onActionPressed: onActionPressed,
         onHelpPressed: onHelpPressed,
         onNotificationPressed: onNotificationPressed,
         key: key,
       );

  const TDSMHeader.walletMerchant({
    required String merchantUserName,
    required VoidCallback onActionPressed,
    VoidCallback? onHelpPressed,
    VoidCallback? onNotificationPressed,
    Key? key,
  }) : this(
         bottomLeftRadius: UISpacing.spacingM_16,
         bottomRightRadius: UISpacing.spacingM_16,
         backgroundColor: Colors.transparent,
         headerType: TDSMHeaderType.transparentWalletMerchant,
         toolbarText: merchantUserName,
         onActionPressed: onActionPressed,
         onHelpPressed: onHelpPressed,
         onNotificationPressed: onNotificationPressed,
         key: key,
       );

  const TDSMHeader.withoutLogo({Key? key})
    : this(
        bottomLeftRadius: 0.0,
        bottomRightRadius: 0.0,
        backgroundColor: Colors.transparent,
        headerType: TDSMHeaderType.transparentWithoutLogo,
        key: key,
      );

  const TDSMHeader.agentUser({
    required String walletUserName,
    required VoidCallback onActionPressed,
    required bool isAgentMaster,
    VoidCallback? onHelpPressed,
    VoidCallback? onNotificationPressed,
    Key? key,
  }) : this(
         bottomLeftRadius: UISpacing.spacingM_16,
         bottomRightRadius: UISpacing.spacingM_16,
         backgroundColor: Colors.transparent,
         headerType: TDSMHeaderType.agent,
         toolbarText: walletUserName,
         onActionPressed: onActionPressed,
         onHelpPressed: onHelpPressed,
         onNotificationPressed: onNotificationPressed,
         isAgentMaster: isAgentMaster,
         key: key,
       );

  const TDSMHeader.withAgentLogo({Key? key, bool? isMTFlow = false})
    : this(
        bottomLeftRadius: 0.0,
        bottomRightRadius: 0.0,
        backgroundColor: Colors.transparent,
        headerType: TDSMHeaderType.transparentWithAgentLogo,
        isAgentSuccess: true,
        key: key,
        isMTFlow: isMTFlow,
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
          padding: EdgeInsets.symmetric(
            horizontal:
                isAgentMaster == true
                    ? kIsWeb
                        ? dynamicHeight * 0.025
                        : dynamicHeight * 0.0135
                    : isAgentSuccess
                    ? UISpacing.spacingXXL_64
                    : UISpacing.spacingL_24,
          ),
          child: Container(child: _getToolbarWidgets(headerType, isMTFlow!)),
        ),
      ),
    );
  }

  Widget _getToolbarWidgets(TDSMHeaderType headerType, bool isMTFlow) {
    Widget defaultWidget = Padding(
      padding: EdgeInsets.all(
        isAgentMaster == true ? UISpacing.spacingL_25 : UISpacing.spacingS_12,
      ),
      child: TDSMLogosHorizontal(logo: ' TDSMAssets.logos.horizontal1'),
    );
    switch (headerType) {
      case TDSMHeaderType.codeScanner:
        return Container();
      case TDSMHeaderType.camera:
        return Container();
      case TDSMHeaderType.cameraNoFlash:
        return Container();
      case TDSMHeaderType.primary:
        return Container();
      case TDSMHeaderType.transparentWithLogo:
        return defaultWidget;
      case TDSMHeaderType.transparentWithLogoAndIcons:
        return Container();
      case TDSMHeaderType.transparentWithTitle:
        TextStyle _getStyle() {
          return isAgentMaster == null
              ? UITextStyles.subtituloMedium_16
              : isAgentMaster == true
              ? UITextStyles.subtituloMedium_16
              : UITextStyles.subtituloMedium_16;
        }
        return _getRowWithIcons(
          Text(
            toolbarText!,
            maxLines: 1,
            style: _getStyle().copyWith(color: Colors.white),
          ),
          onActionPressed == null ? null : 'TDSMAssets.header.iconArrowLight',
          onHelpPressed == null ? null : 'TDSMAssets.header.iconQuestion',
          onNotificationPressed == null
              ? null
              : 'TDSMAssets.header.iconNotification',
          onCrossPressed == null ? null : 'TDSMAssets.header.iconCross',
          onLogoutPressed == null ? null : 'TDSMAssets.sesion.logoutBox',
          onNext
        );
      case TDSMHeaderType.transparentWithTitleHelpTyC:
        TextStyle _getStyle() {
          return isAgentMaster == null
              ? UITextStyles.subtituloMedium_16
              : isAgentMaster == true
              ? UITextStyles.subtituloMedium_16
              : UITextStyles.subtituloMedium_16;
        }
        return AppBar(
          title: Text(toolbarText!),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Preguntas Frecuentes',
                icon: Icon(Icons.question_answer),
              ),
              Tab(text: 'Soporte', icon: Icon(Icons.contact_phone)),
            ],
          ),
        );
      case TDSMHeaderType.transparentWithTitleSteps:
        return Container();
      case TDSMHeaderType.transparentWithTitleStepsCircular:
        return _getRowWithIconsSingUpCircular(
          Text(
            toolbarText!,
            maxLines: 1,
            style: UITextStyles.subtituloMedium_16.copyWith(
              color: UIColorPalette.colorSecondary,
            ),
          ),
          onActionPressed == null ? null : 'TDSMAssets.header.iconArrowLight',
          onHelpPressed == null ? null : 'TDSMAssets.header.iconQuestion',
          onNotificationPressed == null
              ? null
              : 'TDSMAssets.header.iconNotification',
          onCrossPressed == null ? null : 'TDSMAssets.header.iconCross',
          onLogoutPressed == null ? null : 'TDSMAssets.sesion.logoutClose',
          stepText,
          nextStepText,
          currentStep,
          totalStep,
        );
      case TDSMHeaderType.transparentWalletUser:
        return Container();
      case TDSMHeaderType.transparentWalletMerchant:
        return Container();
      case TDSMHeaderType.transparentWithoutLogo:
        return const Padding(padding: EdgeInsets.all(UISpacing.spacingS_12));
      case TDSMHeaderType.agent:
        return Container();
      case TDSMHeaderType.transparentWithAgentLogo:
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: UISpacing.spacingL_25,
            vertical: UISpacing.spacingS_12,
          ),
          child: TDSMLogosHorizontal(
            logo:
                isMTFlow
                    ? 'TDSMAssets.logos.noContainerColor1'
                    : 'TDSMAssets.logos.agents',
          ),
        );
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget _getRowWithIconsSingUp(
    Widget placeHolder,
    String? actionIconPath,
    String? helpIconPath,
    String? notificationIconPath,
    String? crossIconPath,
    String? logoutIconPath,
    String? stepText,
  ) {
    return Row(
      children: [
        if (actionIconPath != null)
          IconButton(
            icon: TDSMAssetImage(
              color: UIColorPalette.colorSecondary,
              path: actionIconPath,
            ),
            onPressed: onActionPressed,
          ),
        Expanded(child: placeHolder),
        if (stepText != null)
          Text(
            stepText!,
            maxLines: 1,
            style: UITextStyles.subtituloMedium_16.copyWith(
              color: UIColorPalette.colorSecondary,
            ),
          ),
        if (notificationIconPath != null)
          IconButton(
            icon: TDSMAssetImage(path: notificationIconPath),
            onPressed: onNotificationPressed,
          ),
        if (crossIconPath != null)
          IconButton(
            icon: TDSMAssetImage(path: crossIconPath),
            onPressed: onCrossPressed,
          ),
        if (logoutIconPath != null)
          IconButton(
            icon: TDSMAssetImage(color: Colors.white, path: logoutIconPath),
            onPressed: onLogoutPressed,
          ),
      ],
    );
  }

  Widget _getRowWithIconsSingUpCircular(
    Widget placeHolder,
    String? actionIconPath,
    String? helpIconPath,
    String? notificationIconPath,
    String? crossIconPath,
    String? logoutIconPath,
    String? stepText,
    String? nextStepText,
    int? currentStep,
    int? totalStep,
  ) {
    return Row(
      children: [
        if (actionIconPath != null)
          IconButton(
            icon: TDSMAssetImage(
              color: UIColorPalette.trainColorPrimaryBtn,
              path: actionIconPath,
            ),
            onPressed: onActionPressed,
          ),
        Expanded(child: Container()),

        if (notificationIconPath != null)
          IconButton(
            icon: TDSMAssetImage(path: notificationIconPath),
            onPressed: onNotificationPressed,
          ),
        if (crossIconPath != null)
          IconButton(
            icon: TDSMAssetImage(path: crossIconPath),
            onPressed: onCrossPressed,
          ),
        if (logoutIconPath != null)
          IconButton(
            icon: TDSMAssetImage(color: Colors.white, path: logoutIconPath),
            onPressed: onLogoutPressed,
          ),
      ],
    );
  }

  Widget _getRowWithIcons(
    Widget placeHolder,
    String? actionIconPath,
    String? helpIconPath,
    String? notificationIconPath,
    String? crossIconPath,
    String? logoutIconPath,
    Widget? onNext,
  ) {
    return Row(
      children: [
        if (actionIconPath != null)
          InkWell(onTap: onActionPressed, child: Icon(Icons.navigate_before,color: Colors.white,)),
        Expanded(child: placeHolder),
        if (onNext !=null) onNext,
        if (notificationIconPath != null)
          IconButton(
            icon: TDSMAssetImage(path: notificationIconPath),
            onPressed: onNotificationPressed,
          ),
      ],
    );
  }

  Widget _getRowWithIconsHelpTyC(
    Widget placeHolder,
    String? actionIconPath,
    String? helpIconPath,
    String? notificationIconPath,
    String? crossIconPath,
    String? logoutIconPath,
  ) {
    return Row(
      children: [
        if (actionIconPath != null)
          IconButton(
            icon: TDSMAssetImage(path: actionIconPath),
            onPressed: onActionPressed,
          ),
        Expanded(child: placeHolder),
        if (helpIconPath != null)
          IconButton(
            icon: TDSMAssetImage(path: helpIconPath, color: Colors.white),
            onPressed: onHelpPressed,
          ),
        if (notificationIconPath != null)
          IconButton(
            icon: TDSMAssetImage(path: notificationIconPath),
            onPressed: onNotificationPressed,
          ),
        if (crossIconPath != null)
          IconButton(
            icon: TDSMAssetImage(path: crossIconPath),
            onPressed: onCrossPressed,
          ),
        if (logoutIconPath != null)
          IconButton(
            icon: TDSMAssetImage(path: logoutIconPath),
            onPressed: onLogoutPressed,
          ),
      ],
    );
  }

  Widget _getCardProfileAndRowWithIcons(
    Widget placeHolder,
    String actionIconPath,
    String? helpIconPath,
    String? notificationIconPath,
    Widget cardProfile,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: TDSMAssetImage(path: actionIconPath),
              onPressed: onActionPressed,
            ),
            Expanded(child: placeHolder),
            if (helpIconPath != null)
              IconButton(
                icon: TDSMAssetImage(path: helpIconPath),
                onPressed: onHelpPressed,
              ),
            if (notificationIconPath != null)
              IconButton(
                icon: TDSMAssetImage(path: notificationIconPath),
                onPressed: onNotificationPressed,
              ),
          ],
        ),
        cardProfile,
      ],
    );
  }
}
