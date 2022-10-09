import 'package:animator_galaxy_planet/screens/separator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../model/planets.dart';
import '../text_style.dart';
import 'detail_page.dart';

class PlanetSummary extends StatefulWidget {
  final Planet planet;
  final bool horizontal;

  PlanetSummary(this.planet, {this.horizontal = true});

  PlanetSummary.vertical(this.planet, {super.key}) : horizontal = false;

  @override
  State<PlanetSummary> createState() => _PlanetSummaryState();
}

class _PlanetSummaryState extends State<PlanetSummary>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 9));
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      alignment: widget.horizontal
          ? FractionalOffset.centerLeft
          : FractionalOffset.center,
      child: Hero(
        tag: "planet-hero-${widget.planet.id}",
        child: RotationTransition(
          turns: animationController,
          child: Image(
            image: AssetImage(widget.planet.image),
            height: 92.0,
            width: 92.0,
          ),
        ),
      ),
    );

    Widget _planetValue({required String value, required String image}) {
      return Row(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(image, height: 12.0),
        Container(width: 8.0),
        Text(widget.planet.gravity, style: Style.smallTextStyle),
      ]);
    }

    final planetCardContent = Container(
      margin: EdgeInsets.fromLTRB(
          widget.horizontal ? 76 : 16, widget.horizontal ? 16 : 42, 16, 16),
      constraints: const BoxConstraints.expand(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: widget.horizontal
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            Container(height: 4.0),
            Text(widget.planet.name, style: Style.titleTextStyle),
            Container(height: 10.0),
            Text(widget.planet.location, style: Style.commonTextStyle),
            Separator(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: widget.horizontal ? 1 : 0,
                    child: _planetValue(
                        value: widget.planet.distance,
                        image: 'assets/images/ic_distance.png')),
                Container(
                  width: widget.horizontal ? 8.0 : 32.0,
                ),
                Expanded(
                    flex: widget.horizontal ? 1 : 0,
                    child: _planetValue(
                        value: widget.planet.gravity,
                        image: 'assets/images/ic_gravity.png'))
              ],
            ),
          ],
        ),
      ),
    );

    final planetCard = Container(
      height: widget.horizontal ? 124.0 : 154.0,
      margin: widget.horizontal
          ? const EdgeInsets.only(left: 46.0)
          : const EdgeInsets.only(top: 72.0),
      decoration: BoxDecoration(
        color: const Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: planetCardContent,
    );

    return GestureDetector(
        onTap: widget.horizontal
            ? () => Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => DetailPage(widget.planet),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            FadeTransition(opacity: animation, child: child),
                  ),
                )
            : null,
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          child: Stack(
            children: [
              planetCard,
              planetThumbnail,
            ],
          ),
        ));
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Planet>('planet', widget.planet));
  }
}
