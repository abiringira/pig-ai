import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:PigAi/provider/walkThrough_provider.dart';

class WalkThroughStepper extends StatelessWidget {
  final PageController controller;

  const WalkThroughStepper({@required this.controller})
      : assert(controller != null);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(3, (int index) {
        return Consumer(builder: (BuildContext context,
            WalkThroughProvider walkthrough, Widget child) {
          return GestureDetector(
              onTap: () {
                controller.animateToPage(index,
                    duration: Duration(microseconds: 500), curve: Curves.ease);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Container(
                  decoration: BoxDecoration(
                      color: index <= walkthrough.currentPageValue
                          ? Theme.of(context).primaryColor
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(5.0)),
                  margin: EdgeInsets.only(right: 5.0),
                ),
              ));
        });
      }),
    );
  }
}
