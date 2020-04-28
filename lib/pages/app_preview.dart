import 'package:flutter/material.dart';
import 'package:portfolio/data/app_dataset.dart';
import 'package:portfolio/models/app.dart';
import 'package:portfolio/pages/portfolio.dart';
import 'package:portfolio/widgets/custom_text.dart';
import 'package:portfolio/main_page.dart';
import 'dart:js' as js;

class AppPreview extends StatefulWidget {
  @override
  _AppPreviewState createState() => _AppPreviewState();
}

class _AppPreviewState extends State<AppPreview> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: _buildAppCard(),
              )
            ],
          ),
        ),
        Container(
          height: 60.0,
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                color: Color(0XFFFAFAFA),
                child: _buildBackArrow(),
              ),
              Container(
                width: double.infinity,
                height: 20.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0XFFFAFAFA),
                      Color(0XFFFAFAFA).withOpacity(0.0)
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildAppCard() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 1024) {
          return Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: _buildAppLabel(),
                ),
                Expanded(
                  flex: 3,
                  child: _buildAppGallery(),
                ),
              ],
            ),
          );
        } else {
          return Container(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  _buildAppLabel(),
                  Container(
                    width: double.infinity,
                    height: 700.0,
                    child: _buildAppGallery(),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildAppLabel() {
    return Container(
      margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
      child: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildAppIcon(),
                  Container(
                    width: 20.0,
                  ),
                  _buildAppData(),
                ],
              ),
              Container(
                height: 20.0,
              ),
              CustomText(StaticPageController.currentApp.description),
              Container(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppIcon() {
    return Container(
      width: 120.0,
      height: 120.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        image: DecorationImage(
          image: AssetImage(
            'assets/app_icons/${StaticPageController.currentApp.iconName}',
          ),
        ),
      ),
    );
  }

  Widget _buildAppData() {
    return Container(
      height: 120.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: CustomText(
                  StaticPageController.currentApp.name,
                  weight: FontWeight.w700,
                  height: 1.1,
                  size: 22.0,
                ),
              ),
              CustomText(
                StaticPageController.currentApp.publisher,
                weight: FontWeight.w200,
                size: 17.0,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              _buildStoreLabel('gp'),
              Container(
                width: 10.0,
              ),
              _buildStoreLabel('as'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStoreLabel(String store) {
    return store == 'gp'
        ? (StaticPageController.currentApp.googlePlayLink.isNotEmpty
            ? GestureDetector(
                onTap: () => js.context.callMethod(
                    "open", [StaticPageController.currentApp.googlePlayLink]),
                child: Container(
                  height: 30.0,
                  child: Image.asset('assets/$store.png'),
                ),
              )
            : Container())
        : (StaticPageController.currentApp.appStoreLink.isNotEmpty
            ? GestureDetector(
                onTap: () => js.context.callMethod(
                    "open", [StaticPageController.currentApp.appStoreLink]),
                child: Container(
                  height: 30.0,
                  child: Image.asset('assets/$store.png'),
                ),
              )
            : Container());
  }

  Widget _buildAppGallery() {
    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: StaticPageController.currentApp.screenshots.map(
          (ss) {
            return _buildGalleryElement(ss);
          },
        ).toList(),
      ),
    );
  }

  Widget _buildGalleryElement(String ssUrl) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        child: Image.network(
          ssUrl,
        ),
      ),
    );
  }

  Widget _buildBackArrow() {
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      child: GestureDetector(
        onTap: () => StaticPageController.pageController.animateToPage(
          0,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOutQuad,
        ),
        child: Icon(
          Icons.keyboard_arrow_up,
          size: 32.0,
        ),
      ),
    );
  }
}
