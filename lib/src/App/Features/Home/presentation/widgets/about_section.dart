import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

class AboutSection extends StatelessWidget{
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
   return
       Padding(padding: EdgeInsets.all(16),
       child: Column(
         spacing: 18,
         children: [
           UILabel(text: 'Información de la app',alignment: Alignment.center,textColor: UIColorPalette.primaryWhite,),
           UILabel(text: 'Desarrollo: Arturo Montiel Salguero',textColor: UIColorPalette.primaryWhite,),
           UILabel(text: 'Télefono: 7711223125',textColor: UIColorPalette.primaryWhite,),
           UILabel(text: 'Sitio Web: https://www.artmontielssolutions.com/',textColor: UIColorPalette.primaryWhite,),
           UILabel(text: 'Versión web: https://www.artmontielssolutions.com/',textColor: UIColorPalette.primaryWhite,),
         ],
       ),
       );
  }

}