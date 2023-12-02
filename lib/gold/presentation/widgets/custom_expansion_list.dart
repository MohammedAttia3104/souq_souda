import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_colors.dart';

double _kPanelHeaderCollapsedHeight = 48.0.h;
double _kPanelHeaderExpandedHeight = 238.0.h;

class CustomExpansionPanelList extends StatelessWidget {
  const CustomExpansionPanelList({
    Key? key,
    this.children = const <ExpansionPanel>[],
    required this.expansionCallback,
    this.animationDuration = kThemeAnimationDuration,
  }) : super(key: key);

  final List<ExpansionPanel> children;

  final ExpansionPanelCallback expansionCallback;

  final Duration animationDuration;

  bool _isChildExpanded(int index) {
    return children[index].isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = <Widget>[];
    EdgeInsets kExpandedEdgeInsets = EdgeInsets.only(
      bottom: 0.0.h,
    );

    for (int index = 0; index < children.length; index += 1) {
      if (_isChildExpanded(index) &&
          index != 0 &&
          !_isChildExpanded(index - 1)) {
        items.add(
          ///ToDo :Divider1-Closed
          Divider(
            key: _SaltedKey<BuildContext, int>(context, index * 2 - 1),
            height: 18.0.h,
            thickness: 0.0,
            color: Colors.transparent,
          ),
        );
      }

      final Row header = Row(
        children: <Widget>[
          Expanded(
            child: AnimatedContainer(
              duration: animationDuration,
              curve: Curves.fastOutSlowIn,
              margin: _isChildExpanded(index)
                  ? kExpandedEdgeInsets
                  : EdgeInsets.zero,
              child: SizedBox(
                height: _kPanelHeaderCollapsedHeight,
                child: children[index].headerBuilder(
                  context,
                  children[index].isExpanded,
                ),
              ),
            ),
          ),

          ///ToDo : Icon
          ExpandIcon(
            isExpanded: _isChildExpanded(index),
            size: 35.0.r,
            color: AppColors.kWhiteColor,
            padding: EdgeInsets.all(16.0.h),
            onPressed: (bool isExpanded) {
              expansionCallback(index, isExpanded);
            },
          ),
        ],
      );

      double radiusValue = _isChildExpanded(index) ? 10.0.r : 0.0;
      Color containerBorderColorValue = _isChildExpanded(index)
          ? AppColors.kYellowNorColor
          : Colors.transparent;
      items.add(
        ///ToDo : OuterContainer
        Container(
          key: _SaltedKey<BuildContext, int>(context, index * 2),
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.5.r,
              color: containerBorderColorValue,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                radiusValue,
              ),
            ),
          ),
          child: Material(
            elevation: 2.0,
            color: AppColors.kGreyBehindColor,
            borderRadius: BorderRadius.all(
              Radius.circular(radiusValue),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                header,
                AnimatedCrossFade(
                  firstChild: Container(height: 0.0),
                  secondChild: children[index].body,
                  firstCurve:
                      const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
                  secondCurve:
                      const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
                  sizeCurve: Curves.fastOutSlowIn,
                  crossFadeState: _isChildExpanded(index)
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: animationDuration,
                ),
              ],
            ),
          ),
        ),
      );

      if (_isChildExpanded(index) && index != children.length - 1) {
        items.add(
          ///ToDo: Divider2-Opened
          Divider(
            key: _SaltedKey<BuildContext, int>(context, index * 2 + 1),
            height: 18.0,
            thickness: 0.0,
            color: Colors.transparent,
          ),
        );
      }
    }

    return Column(
      children: items,
    );
  }
}

class _SaltedKey<S, V> extends LocalKey {
  const _SaltedKey(this.salt, this.value);

  final S salt;
  final V value;

  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType) return false;
    final _SaltedKey<S, V> typedOther = other;
    return salt == typedOther.salt && value == typedOther.value;
  }

  @override
  // ignore: deprecated_member_use
  int get hashCode => hashValues(runtimeType, salt, value);

  @override
  String toString() {
    final String saltString = S == String ? '<\'$salt\'>' : '<$salt>';
    final String valueString = V == String ? '<\'$value\'>' : '<$value>';
    return '[$saltString $valueString]';
  }
}
