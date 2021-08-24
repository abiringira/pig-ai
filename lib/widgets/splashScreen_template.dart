import 'package:flutter/material.dart';

class WalkThroughTemplate extends StatelessWidget {
  final String title;
  final String subTitle;
  final Image image;

  const WalkThroughTemplate(
      {@required this.title, @required this.subTitle, @required this.image})
      : assert(title != null),
        assert(subTitle != null);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
        padding: EdgeInsets.only(top: 141),
        // alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                child: Center(
              child: image,
            )),
            Container(
              height: 180,
              child: Column(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(title,
                          style: theme.textTheme.bodyText1.merge(TextStyle(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w900,
                          ))),
                      SizedBox(height: 10.0),
                      Text(
                        subTitle,
                        style: theme.textTheme.bodyText1.merge(TextStyle(
                            color: theme.accentColor,
                            fontWeight: FontWeight.w700,
                            height: 1.3)),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
