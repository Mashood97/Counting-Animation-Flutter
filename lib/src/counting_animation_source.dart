import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CountingAnimation extends StatefulWidget {
  final double beginValue;
  final double endValue;
  final int precision;
  final Curve curve;
  final Duration duration;
  final TextStyle largeValueStyle;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final Locale locale;
  final bool softWrap;
  final TextOverflow overflow;
  final double textScaleFactor;
  final int maxLines;
  final String semanticsLabel;
  final String separator;
  final String prefix;
  final TextStyle smallValueStyle;
  final String suffix;
  final Color color;

  CountingAnimation({
    Key key,
    @required this.beginValue,
    @required this.endValue,
    this.precision = 0,
    this.color,
    this.curve = Curves.linear,
    this.duration = const Duration(milliseconds: 250),
    this.largeValueStyle,
    this.textAlign,
    this.textDirection,
    this.suffix = '',
    this.smallValueStyle,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.separator,
    this.prefix = '',
  }) : super(key: key);

  @override
  _CountupState createState() => _CountupState();
}

class _CountupState extends State<CountingAnimation>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  double _latestBegin;
  double _latestEnd;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _latestBegin = widget.beginValue;
    _latestEnd = widget.endValue;
  }

  @override
  Widget build(BuildContext context) {
    CurvedAnimation curvedAnimation =
        CurvedAnimation(parent: _controller, curve: widget.curve);
    _animation = Tween<double>(begin: widget.beginValue, end: widget.endValue)
        .animate(curvedAnimation);

    if (widget.beginValue != _latestBegin || widget.endValue != _latestEnd) {
      _controller.reset();
    }

    _latestBegin = widget.beginValue;
    _latestEnd = widget.endValue;
    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();

    return _CountupAnimatedText(
      key: UniqueKey(),
      animation: _animation,
      precision: widget.precision,
      largeValueStyle: widget.largeValueStyle,
      textAlign: widget.textAlign,
      textDirection: widget.textDirection,
      locale: widget.locale,
      color: widget.color,
      smallValueStyle: widget.smallValueStyle,
      softWrap: widget.softWrap,
      overflow: widget.overflow,
      textScaleFactor: widget.textScaleFactor,
      maxLines: widget.maxLines,
      semanticsLabel: widget.semanticsLabel,
      separator: widget.separator,
      prefix: widget.prefix,
      suffix: widget.suffix,
    );
  }
}

class _CountupAnimatedText extends AnimatedWidget {
  final RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');

  final Animation<double> animation;
  final int precision;
  final TextStyle largeValueStyle;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final Locale locale;
  final bool softWrap;
  final TextOverflow overflow;
  final double textScaleFactor;
  final int maxLines;
  final String semanticsLabel;
  final String separator;
  final String prefix;
  final String suffix;
  final Color color;
  final TextStyle smallValueStyle;

  _CountupAnimatedText({
    Key key,
    @required this.animation,
    @required this.precision,
    this.largeValueStyle,
    this.suffix,
    this.smallValueStyle,
    this.color = Colors.white,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.separator,
    this.prefix,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return FittedBox(
      child: RichText(
        text: prefix != null
            ? TextSpan(
                text: prefix + animation.value.toInt().toString(),
                style: largeValueStyle != null
                    ? largeValueStyle
                    : Theme.of(context).textTheme.headline4.copyWith(
                        fontSize: mediaQuery.size.width < 350 ? 16 : 20,
                        color: color),
                children: [
                    TextSpan(
                        text: '.' +
                            animation.value
                                .toStringAsFixed(2)
                                .split('.')[1]
                                .replaceAllMapped(reg,
                                    (Match match) => '${match[1]}$separator') +
                            suffix,
                        style: smallValueStyle != null
                            ? smallValueStyle
                            : Theme.of(context).textTheme.headline4.copyWith(
                                fontSize: mediaQuery.size.width < 350 ? 12 : 14,
                                color: color)),
                  ])
            : TextSpan(
                text: animation.value.toInt().toString(),
                style: largeValueStyle != null
                    ? largeValueStyle
                    : Theme.of(context).textTheme.headline4.copyWith(
                        fontSize: mediaQuery.size.width < 350 ? 16 : 20,
                        color: color),
                children: [
                    TextSpan(
                        text: '.' +
                            animation.value
                                .toStringAsFixed(2)
                                .split('.')[1]
                                .replaceAllMapped(reg,
                                    (Match match) => '${match[1]}$separator') +
                            suffix,
                        style: smallValueStyle != null
                            ? smallValueStyle
                            : Theme.of(context).textTheme.headline4.copyWith(
                                fontSize: mediaQuery.size.width < 350 ? 12 : 14,
                                color: color)),
                  ]),
        textAlign: this.textAlign ?? TextAlign.start,
        textDirection: this.textDirection,
        locale: this.locale,
        softWrap: this.softWrap ?? true,
        overflow: this.overflow ?? TextOverflow.clip,
        textScaleFactor: this.textScaleFactor ?? 1.0,
        maxLines: this.maxLines,
      ),
    );
  }
}
