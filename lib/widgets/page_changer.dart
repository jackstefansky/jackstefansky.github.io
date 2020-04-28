import 'package:flutter/material.dart';
import 'package:portfolio/main_page.dart';
import 'package:portfolio/widgets/custom_text.dart';

class PageChanger extends StatefulWidget {
  PageChanger({@required this.children, this.onElementChange})
      : assert(children != null && children.length == 3);
  final List<PageChangerElement> children;
  final Function(int) onElementChange;

  @override
  _PageChangerState createState() => _PageChangerState();
}

class _PageChangerState extends State<PageChanger> {
  Alignment _currentAlignment = Alignment.centerLeft;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          _buildCurrentPageChangerElement(),
          _buildPageChangerElements()
        ],
      ),
    );
  }

  Widget _buildCurrentPageChangerElement() {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        width: _determinePageChangerWidth(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: AnimatedAlign( 
            duration: Duration(milliseconds: 400),
            curve: Curves.fastLinearToSlowEaseIn,
            alignment: _currentAlignment,
            child: Container(
              width: _determineElementWidth(),
              height: 30.0,
              decoration: BoxDecoration(
                color: Color(0XFF000DFF),
                borderRadius: BorderRadius.all(
                  Radius.circular(99.0),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  double _determinePageChangerWidth() {
    print(SiteConfig.width);
    if (SiteConfig.width > 798) {
      return 435.0;
    } else
      return SiteConfig.width;
  }

  double _determineElementWidth() {
    if (SiteConfig.width == double.infinity) {
      return 135.0;
    } else {
      return (SiteConfig.width / 3) - 10;
    }
  }

  Widget _buildPageChangerElements() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: widget.children.map((e) {
        return GestureDetector(onTap: () => _selectElement(e), child: e);
      }).toList(),
    );
  }

  void _selectElement(PageChangerElement element) {
    int position = widget.children.indexOf(element);

    widget.onElementChange(position);

    switch (position) {
      case 0:
        _setAlignment(Alignment.centerLeft);
        break;
      case 1:
        _setAlignment(Alignment.center);
        break;
      case 2:
        _setAlignment(Alignment.centerRight);
        break;
    }
  }

  void _setAlignment(Alignment alignment) {
    setState(() {
      _currentAlignment = alignment;
    });
  }
}

class PageChangerElement extends StatelessWidget {
  PageChangerElement(this.title);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        width: _determineElementWidth(),
        height: 30.0,
        child: Center(
          child: CustomText(
            title,
            weight: FontWeight.w600,
            color: Colors.white,
            size: 12.0,
          ),
        ),
      ),
    );
  }

  double _determineElementWidth() {
    if (SiteConfig.width == double.infinity) {
      return 135.0;
    } else {
      return (SiteConfig.width / 3) - 10;
    }
  }
}
