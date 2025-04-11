import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

class TabInfo {
  const TabInfo(this.icon, this.builder, this.label, this.description);

  final IconData icon;
  final WidgetBuilder builder;
  final String label;
  final String description;
}
