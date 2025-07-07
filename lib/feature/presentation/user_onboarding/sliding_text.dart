import 'package:flutter/material.dart';

class ShiningTitle extends StatefulWidget {
  final String text;
  const ShiningTitle({required this.text});

  @override
  State<ShiningTitle> createState() => _ShiningTitleState();
}

class _ShiningTitleState extends State<ShiningTitle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) {
        return Text(
          widget.text,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white.withOpacity(_animation.value),
            shadows: [
              Shadow(
                blurRadius: 20 * _animation.value,
                //color: Colors.white.withOpacity(_animation.value),
                offset: const Offset(0, 0),
              ),
            ],
          ),
        );
      },
    );
  }
}
