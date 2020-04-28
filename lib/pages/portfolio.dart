import 'package:flutter/material.dart';
import 'package:portfolio/data/app_dataset.dart';
import 'package:portfolio/models/app.dart';
import 'package:portfolio/pages/app_preview.dart';
import 'package:portfolio/widgets/custom_text.dart';
import 'package:portfolio/widgets/footer.dart';

class StaticPageController {
  static PageController pageController = PageController();
  static App currentApp;
}

class PortfolioPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PortfolioPageState();
  }
}

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            controller: StaticPageController.pageController,
            children: <Widget>[
              _buildAllApps(),
              AppPreview(),
            ],
          ),
        ),
        Footer(),
      ],
    );
  }

  Widget _buildAllApps() {
    return Container(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildHeader(),
            _buildApps(),
            _buildBottomText(),
            Container(height: 20.0,)
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CustomText(
            "Our precious work for our amazing clients",
            weight: FontWeight.w600,
            size: 27.0,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 5.0,
          ),
          CustomText(
            "Click to get more info",
            weight: FontWeight.w200,
            size: 19.0,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildApps() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      child: Wrap(
        spacing: 30.0,
        runSpacing: 30.0,
        children: AppDataset.apps.map((app) {
          return _buildAppIcon(app);
        }).toList(),
      ),
    );
  }

  Widget _buildAppIcon(App app) {
    return Container(
      child: GestureDetector(
        onTap: () {
          _setCurrentApp(app);
          StaticPageController.pageController.nextPage(
            duration: Duration(seconds: 1),
            curve: Curves.easeInOutQuad,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            image: DecorationImage(
              image: AssetImage(
                'assets/app_icons/${app.iconName}',
              ),
            ),
          ),
          height: 160.0,
          width: 160.0,
        ),
      ),
    );
  }

  Widget _buildBottomText() {
    return Container();
  }

  void _setCurrentApp(App app) {
    setState(() {
      StaticPageController.currentApp = app;
    });
  }
}
