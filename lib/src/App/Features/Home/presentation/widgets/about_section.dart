import 'package:poke_app/src/App/Core/constants/global_constants.dart';
import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';
import 'package:url_launcher/url_launcher.dart';

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
          InkWell(
            child: UILabel(
              text:
                  '${AppConstants.about.websiteLabel} ${AppConstants.about.website}',
              textColor: UIColorPalette.primaryWhite,
            ),
            onTap: () async {
              final Uri uri = Uri.parse(AppConstants.about.website);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              }
            },
          ),
        ],
      ),
    );
  }
}
