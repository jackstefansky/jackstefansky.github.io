import 'package:flutter/material.dart';
import 'package:portfolio/widgets/custom_text.dart';
import 'dart:js' as js;

import 'package:portfolio/widgets/footer.dart';

class ContactPage extends StatelessWidget {
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
                      "Let's get in touch",
                      weight: FontWeight.w600,
                      size: 27.0,
                    ),
                    _buildEmail(),
                    _buildPhoneNumer(),
                    _buildLinkedInLink(),
                  ],
                ),
                Footer(),
              ],
            ));
      },
    );
  }

  Widget _buildLinkedInLink() {
    return GestureDetector(
      onTap: () => js.context
          .callMethod("open", ["https://www.linkedin.com/in/jck-stefansky/"]),
      child: Container(
        margin: EdgeInsets.only(top: 25.0),
        child: Column(
          children: <Widget>[
            CustomText(
              "LinkedIn",
              weight: FontWeight.w700,
              size: 27.0,
            ),
            CustomText(
              "https://www.linkedin.com/in/jck-stefansky/",
              size: 22.0,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneNumer() {
    return GestureDetector(
      onTap: () => js.context.callMethod("open", ["tel://+48 798 620 916"]),
      child: Container(
        margin: EdgeInsets.only(top: 25.0),
        child: Column(
          children: <Widget>[
            CustomText(
              "Phone",
              weight: FontWeight.w700,
              size: 27.0,
            ),
            CustomText(
              "+48 798 620 916",
              size: 22.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmail() {
    return GestureDetector(
      onTap: () =>
          js.context.callMethod("open", ["mailto:stefphan01@gmail.com"]),
      child: Container(
        margin: EdgeInsets.only(top: 40.0),
        child: Column(
          children: <Widget>[
            CustomText(
              "Email",
              weight: FontWeight.w700,
              size: 27.0,
            ),
            CustomText(
              "stefphan01@gmail.com",
              size: 22.0,
            ),
          ],
        ),
      ),
    );
  }
}
