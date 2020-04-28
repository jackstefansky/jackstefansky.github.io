import 'package:flutter/material.dart';
import 'package:portfolio/pages/about.dart';
import 'package:portfolio/pages/contact.dart';
import 'package:portfolio/pages/portfolio.dart';
import 'package:portfolio/widgets/custom_text.dart';
import 'package:portfolio/widgets/page_changer.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[_buildNavbar(), _buildContent()],
        ),
      ),
    );
  }

  Widget _buildNavbar() {
    return Container(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constrains) {
          if (constrains.maxWidth >= 840) {
            return Container(
              width: double.infinity,
              color: Color(0xFF171B36),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildLogo(),
                    _buildPageChanger(),
                  ],
                ),
              ),
            );
          } else {
            return Container(
              width: double.infinity,
              color: Color(0xFF171B36),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _buildLogo(),
                    _buildPageChanger(),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      child: Expanded(
        child: PageView(
          controller: _pageController,
          children: <Widget>[
            PortfolioPage(),
            AboutPage(),
            ContactPage(),
          ],
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      child: CustomText(
        "BADGERJACK TEAM",
        color: Colors.white,
        size: 35.0,
        family: "Crillee Italic Std",
      ),
    );
  }

  Widget _buildPageChanger() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constrains) {
        SiteConfig.width = constrains.maxWidth;
        return Container(
          margin: EdgeInsets.only(top: constrains.maxWidth >= 840 ? 0.0 : 20.0),
          child: PageChanger(
            children: [
              PageChangerElement("PORTFOLIO"),
              PageChangerElement("ABOUT"),
              PageChangerElement("CONTACT")
            ],
            onElementChange: (int position) => _changeCard(position),
          ),
        );
      },
    );
  }

  void _changeCard(int position) {
    _pageController.animateToPage(
      position,
      duration: Duration(milliseconds: 400),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }
}

class SiteConfig {
  static double width = 798;
}
