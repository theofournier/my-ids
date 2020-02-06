import 'dart:math';
import 'package:flare_dart/math/mat2d.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';

class SmileController extends FlareController {
  FlutterActorArtboard _artboard;
  ActorAnimation _smileAnimation;

  final List<FlareAnimationLayer> _baseAnimations = [];

  ///our overall smile fill
  double _smile = 0.00;

  ///current amount of smile
  double _currentSmile = 0;

  ///time used to smooth the fill line movement
  double _smoothTime = 5;

  void initialize(FlutterActorArtboard artboard) {
    //get the reference here on start to our animations and artboard
    _artboard = artboard;
    _smileAnimation = artboard.getAnimation("Smile");
  }

  void setViewTransform(Mat2D viewTransform) { }

  bool advance(FlutterActorArtboard artboard, double elapsed) {
    //we need this separate from our generic mixing animations,
    // b/c the animation duration is needed in this calculation
    if (artboard.name == "Artboard") {
      _currentSmile += (_smile - _currentSmile) * min(1, elapsed *
          _smoothTime);
      _smileAnimation.apply(
          _currentSmile * _smileAnimation.duration, artboard, 1);
    }
    int len = _baseAnimations.length - 1;
    for (int i = len; i >= 0; i--) {
      FlareAnimationLayer layer = _baseAnimations[i];
      layer.time += elapsed;
      layer.mix = min(1.0, layer.time / 0.01);
      layer.apply(_artboard);
      if (layer.isDone) {
        _baseAnimations.removeAt(i);
      }
    }
    return true;
  }

  ///called from the 'tracking_input'
  void playAnimation(String animName){
    ActorAnimation animation = _artboard.getAnimation(animName);
    if (animation != null) {
      _baseAnimations.add(FlareAnimationLayer()
        ..name = animName
        ..animation = animation
      );
    }
  }
  ///called from the 'tracking_input'
  ///updates the water fill line
  void updateSmilePercent(double amt){
    _smile = amt;
  }
}
