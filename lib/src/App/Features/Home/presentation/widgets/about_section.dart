import 'package:poke_app/src/App/Core/constants/global_constants.dart';
import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        spacing: 18,
        children: [
          UILabel(
            text: AppConstants.about.title,
            alignment: Alignment.center,
            textColor: UIColorPalette.primaryWhite,
          ),
          UILabel(
            text: AppConstants.about.develop,
            textColor: UIColorPalette.primaryWhite,
          ),
          UILabel(
            text: AppConstants.about.phone,
            textColor: UIColorPalette.primaryWhite,
          ),
          UILabel(
            text: AppConstants.about.website,
            textColor: UIColorPalette.primaryWhite,
          ),
          UILabel(
            text: AppConstants.about.websiteApp,
            textColor: UIColorPalette.primaryWhite,
          ),
        ],
      ),
    );
  }
}
