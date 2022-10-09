import 'package:animator_galaxy_planet/screens/planet_summary.dart';
import 'package:animator_galaxy_planet/screens/separator.dart';
import 'package:flutter/material.dart';

import '../model/planets.dart';
import '../text_style.dart';

class DetailPage extends StatelessWidget {
  final Planet planet;

  DetailPage(this.planet);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: const Color(0xFF736AB7),
        child: Stack(
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getContent(),

            Padding(
              padding: const EdgeInsets.only(top: 40, left: 10),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 26,
                  )),
            )
            //_getToolbar(context),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            colors: [Color(0xFF3366FF), Color(0xFF00CCFF)],
          ),
        ),
        child: _getToolbar(context),
      ),
    );
  }

  Container _getBackground() {
    return Container(
      constraints: const BoxConstraints.expand(height: 295.0),
      child: Image.network(
        planet.picture,
        fit: BoxFit.cover,
        height: 300.0,
      ),
    );
  }

  Container _getGradient() {
    return Container(
      margin: const EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[Color(0x00736AB7), Color(0xFF736AB7)],
          stops: [0.0, 0.9],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  ListView _getContent() {
    final _overviewTitle = "Overview".toUpperCase();
    return ListView(
      padding: const EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
      children: <Widget>[
        PlanetSummary(
          planet,
          horizontal: false,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _overviewTitle,
                style: Style.headerTextStyle,
              ),
              Separator(),
              Text(planet.description, style: Style.commonTextStyle),
            ],
          ),
        ),
      ],
    );
  }

  Container _getToolbar(BuildContext context) {
    return Container(
      height: 30,
      alignment: Alignment(0.8, -10),
      //color: Colors.blue,
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          colors: [Color(0xFF3366FF), Color(0xFF00CCFF)],
        ),
      ),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              backgroundColor: Color(0xFF736AB7),
              context: context,
              builder: (context) {
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 70,
                      decoration: BoxDecoration(
                        //color: Color(0xFF736AB7),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.blueAccent,
                            Colors.lightBlue,
                          ],
                        ),
                      ),
                      child: Text(
                        "Welcome to ${planet.name.toUpperCase()} ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      planet.image,
                      height: 110,
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Text(
                      "Distance to Sun",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${planet.distance}",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),

                    // Text(
                    //   "Distance to Earth",
                    //   style: TextStyle(
                    //       fontSize: 18, color: Colors.white.withOpacity(0.7)),
                    // ),
                    // Text(
                    //   "${planet.distance}",
                    //   style: TextStyle(
                    //       fontSize: 24,
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.white),
                    // ),
                    Spacer(
                      flex: 12,
                    )
                  ],
                );
              });
        },
        child: const Text(
          "Book Now",
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),

      // child: const BackButton(
      //   color: Colors.white,
      // ),
    );
  }
}
