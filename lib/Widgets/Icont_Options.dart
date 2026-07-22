import 'package:flutter/material.dart';

class IcontOptions extends StatefulWidget {
  const IcontOptions({super.key});

  @override
  State<IcontOptions> createState() => _IcontOptionsState();
}

class _IcontOptionsState extends State<IcontOptions>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  void animateIcon() {

    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }

  }


  @override
  Widget build(BuildContext context) {

    return IconButton(


      onPressed: animateIcon,

      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: _controller,
        color: Colors.white,
        size: 30,
      ),

    );
  }
}