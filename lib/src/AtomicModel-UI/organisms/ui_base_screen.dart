import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

class UIBaseScreen extends StatelessWidget {
  //appbar
  final PreferredSize? appBarCustom;
  final String appBarTitle;
  final Widget? appBarTitleWidget;
  final bool appBarCenterTitle;
  final Color? appBarBackgroundColor;

  //header
  final Widget? header;
  final Color? headerBackgroundColor;

  //body
  final Widget? body;
  final Color? bodyBackgroundColor;

  //footer
  final Widget? footer;
  final Color? footerBackgroundColor;

  final double paddingScreen;
  final bool showBottomBar;
  final Widget? childBottomBar;
  final double heightAppBar;
  final double heightBottomBar;
  final double heightBodyStart;
  final Widget? bodyAppBar;
  final double bodyAppBarTop;
  final double bodyAppBarLeft;
  final double bodyAppBarRight;

  const UIBaseScreen({
    super.key,
    this.appBarCustom,
    this.appBarTitle = 'AppBar-Title',
    this.appBarTitleWidget,
    this.appBarCenterTitle = false,
    this.appBarBackgroundColor,
    this.header,
    this.body,
    this.footer,
    this.headerBackgroundColor,
    this.bodyBackgroundColor,
    this.footerBackgroundColor,
    this.paddingScreen = 16,
    this.showBottomBar = false,
    this.childBottomBar,
    this.heightAppBar = 100,
    this.heightBottomBar = 150,
    this.heightBodyStart = 0,
    this.bodyAppBar,
    this.bodyAppBarTop = 150,
    this.bodyAppBarLeft = 35,
    this.bodyAppBarRight = 35,
  });

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: UIColorPalette.backgroundColor,
        appBar:
        appBarCustom ??
            AppBar(
              title: appBarTitleWidget ?? Text(appBarTitle),
              centerTitle: appBarCenterTitle,
              backgroundColor:
              appBarBackgroundColor ?? UIColorPalette.backgroundColor,
            ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Container(
              padding: EdgeInsets.all(paddingScreen),
              color: headerBackgroundColor ?? UIColorPalette.backgroundColor,
              child: header,
            ),

            // Body
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(paddingScreen),
                  color: bodyBackgroundColor,
                  child: body,
                ),
              ),
            ),

            // Footer
            Container(
              padding: EdgeInsets.all(paddingScreen),
              color: footerBackgroundColor ?? UIColorPalette.backgroundColor,
              child: footer,
            ),
          ],
        ),
      );

  }
}
