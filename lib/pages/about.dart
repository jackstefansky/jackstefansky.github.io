import 'package:flutter/material.dart';
import 'package:portfolio/widgets/custom_text.dart';
import 'package:portfolio/widgets/footer.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constrains) {
        return Container(
          margin: EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CustomText(
                    "We are Badgerjack",
                    weight: FontWeight.w600,
                    size: 27.0,
                  ),
                  Container(
                    height: 5.0,
                  ),
                  Container(
                    width: _determineAboutTextWidth(constrains.maxWidth),
                    child: CustomText(
                      "Hello there! We are Jacob and Lucas. We are flutter developers form Poland. Our passion is creating mobile apps with Flutter Framework. We have successfully developed many apps for our clients. We are building highly optimized, scalable and robust apps and we care about every single details in our projects.",
                      weight: FontWeight.w200,
                      size: 19.0,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Footer(),
            ],
          ),
        );
      },
    );
  }

  double _determineAboutTextWidth(double browserWidth) {
    if (browserWidth > 840) {
      return 700.0;
    } else {
      return (browserWidth / 13).floor() * 10.0;
    }
  }
}
