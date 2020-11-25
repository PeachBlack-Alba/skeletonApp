import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum AniProps { opacity, translateX }

/// Fade in animation
class FadeIn extends StatefulWidget {
  /// The widget to apply the animation on
  final Widget child;

  /// The initial delay before starting the animation
  final num delaySecs;

  /// The duration of the animation in seconds
  final num durationSecs;

  /// The opacity to start with
  final num startOpacity;

  /// The translation in x direction to do while fading in
  final num translateX;

  FadeIn(
      {this.delaySecs = 0.0,
        this.durationSecs = 0.25,
        this.startOpacity = 0.0,
        this.translateX = 100,
        @required this.child});

  @override
  _FadeInState createState() => _FadeInState(
    delaySecs: delaySecs,
    durationSecs: durationSecs,
    startOpacity: startOpacity,
    translateX: translateX,
  );
}

class _FadeInState extends State<FadeIn> {
  final num delaySecs;
  final num durationSecs;
  final num startOpacity;
  final num translateX;

  _FadeInState(
      {@required this.delaySecs, @required this.durationSecs, @required this.startOpacity, @required this.translateX});

  @override
  Widget build(BuildContext context) {

    final duration = durationSecs.toDouble().seconds;

    final tween = MultiTween<AniProps>()
      ..add(AniProps.opacity, startOpacity.toDouble().tweenTo(1.0), duration, Curves.easeOutQuad)
      ..add(AniProps.translateX, translateX.toDouble().tweenTo(0.0), duration, Curves.easeOutQuad);

    tween.curved(Curves.easeOutQuad);

    return PlayAnimation<MultiTweenValues<AniProps>>(
      delay: delaySecs.toDouble().seconds,
      duration: durationSecs.toDouble().seconds,
      tween: tween,
      child: widget.child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(AniProps.opacity),
        child: Transform.translate(
          offset: Offset(value.get(AniProps.translateX), 0),
          child: child,
        ),
      ),
    );
  }
}
