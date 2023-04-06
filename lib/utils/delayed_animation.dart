// import 'dart:async';

// import 'package:flutter/material.dart';

// class DelayedAnimation extends StatefulWidget {
//   final Widget child;
//   final int delayedAnimation;
//   final double aniOffsetX;
//   final double aniOddsetY;
//   final int aniDuration;

//   const DelayedAnimation({
//     Key? key,
//     required this.child,
//     required this.delayedAnimation,
//     required this.aniOffsetX,
//     required this.aniOddsetY,
//     required this.aniDuration,
//   }) : super(key: key);

//   @override
//   _DelayedAnimationState createState() => _DelayedAnimationState();
// }

// class _DelayedAnimationState extends State<DelayedAnimation>
//     with TickerProviderStateMixin {
//   Animation<double>? _controller;
//   Animation<Offset>? _animationOffset;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: widget.aniDuration),
//     );

//     final curve =
//         CurvedAnimation(parent: _controller!, curve: Curves.decelerate);
//     _animationOffset = Tween<double>(
//       begin: widget.aniOffsetX,
//       end: 0.0,
//     ).animate(curve) as Animation<Offset>?;

//     if (widget.delayedAnimation == null) {
//       _controller.forward();
//     } else {
//       Timer(Duration(milliseconds: widget.delayedAnimation), () {
//         _controller?.forward();
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FadeTransition(opacity: _controller,
//     child: SlideTransition(position: _animationOffset, child: widget.child,),);
//   }
// }


// // SlideTransition(
// //       position: Tween<Offset>(
// //         begin: Offset(widget.aniOffsetX, widget.aniOddsetY),
// //         end: Offset.zero,
// //       ).animate(CurvedAnimation(
// //         parent: _controller!,
// //         curve: Curves.decelerate,
// //       )),
// //       child: widget.child,
// //     );