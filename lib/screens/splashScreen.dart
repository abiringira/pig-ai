import 'package:PigAi/widgets/splashScreen_template.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:PigAi/provider/walkThrough_provider.dart';
import 'package:PigAi/router.dart';
import 'package:PigAi/widgets/splashScreen_stepper.dart';

class WalkThrough extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final WalkThroughProvider _walkThroughProvider =
        Provider.of<WalkThroughProvider>(context, listen: false);

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: PageView(
            controller: _pageController,
            onPageChanged: (int index) {
              _walkThroughProvider.onPageChanged(index);
            },
            children: <Widget>[
              WalkThroughTemplate(
                title: "Umucyo",
                subTitle: "Vet Consult Ltd.",
                // image: Image.asset("assets/images/icon1.png"),
                image: Image(
                    height: 130,
                    width: 130,
                    image: AssetImage('assets/images/icon1.png')),
              ),
              WalkThroughTemplate(
                title: "Pig",
                subTitle: "Traceability Tool.",
                image: Image(
                    height: 130,
                    width: 130,
                    image: AssetImage('assets/images/icon1.png')),
              ),
            ],
          )),
          Container(
            padding: EdgeInsets.all(24.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: WalkThroughStepper(controller: _pageController),
                ),
                ClipOval(
                  child: Container(
                    color: Theme.of(context).primaryColor,
                    child: IconButton(
                      icon: Icon(
                        Icons.trending_flat_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (_pageController.page >= 1) {
                          Navigator.of(context)
                              .pushReplacementNamed(HomePageRoute);
                          return;
                        }
                        _pageController.nextPage(
                            duration: Duration(microseconds: 500),
                            curve: Curves.ease);
                      },
                      padding: EdgeInsets.all(13.0),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      // ),
    ));
  }
}
