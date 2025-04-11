import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

class UIComponentsSlider extends StatefulWidget {
  final List<Widget> componentsSliders;
  final bool showCurrentIndicator;

  const UIComponentsSlider({
    super.key,
    required this.componentsSliders,
    this.showCurrentIndicator = true,
  });

  @override
  State<StatefulWidget> createState() {
    return _UIComponentsSliderState();
  }
}

class _UIComponentsSliderState extends State<UIComponentsSlider> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double getHeight() {
          double current = constraints.maxWidth;
          if (current <= 200) {
            return current -= 40;
          } else if (current > 200 && current <= 400) {
            return current -= 130;
          } else if (current > 400 && current <= 500) {
            return current = current - 180;
          } else if (current > 500 && current <= 600) {
            return current = current - 220;
          } else if (current > 600 && current <= 700) {
            return current = current - 240;
          } else if (current > 700 && current <= 800) {
            return current = current - 260;
          } else if (current > 800 && current <= 900) {
            return current = current - 340;
          } else if (current > 900 && current <= 1000) {
            return current = current - 400;
          } else if (current > 1000 && current <= 1100) {
            return current = current - 440;
          } else if (current > 1100 && current <= 1200) {
            return current = current - 480;
          } else if (current > 1200 && current <= 1300) {
            return current = current - 520;
          } else if (current > 1300 && current <= 1400) {
            return current = current - 580;
          } else if (current > 1400 && current <= 1500) {
            return current = current - 620;
          } else if (current > 1500 && current <= 1600) {
            return current = current - 680;
          } else if (current > 1600 && current <= 1700) {
            return current = current - 720;
          } else if (current > 1700 && current <= 1800) {
            return current = current - 760;
          } else if (current > 1800 && current <= 1900) {
            return current = current - 800;
          }
          return current;
        }

        return Column(
          children: [
            Text('${constraints.maxWidth}'),
            SizedBox(
              height: getHeight(),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        CarouselSlider(
                          items: widget.componentsSliders,
                          carouselController: _controller,
                          options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            aspectRatio: 2.0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            },
                          ),
                        ),
                        if (widget.showCurrentIndicator)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                                widget.componentsSliders.asMap().entries.map((
                                  entry,
                                ) {
                                  return GestureDetector(
                                    onTap:
                                        () => _controller.animateToPage(
                                          entry.key,
                                        ),
                                    child: Container(
                                      width: 12.0,
                                      height: 12.0,
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 8.0,
                                        horizontal: 4.0,
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: (Theme.of(context).brightness ==
                                                    Brightness.dark
                                                ? Colors.white
                                                : Colors.black)
                                            .withOpacity(
                                              _current == entry.key ? 0.9 : 0.4,
                                            ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
