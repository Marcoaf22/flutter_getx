import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final double size;

  const IconContainer({Key? key, required this.size})
      : assert(size > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      padding: EdgeInsets.all(this.size * 0.15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(this.size * 0.16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 25,
            offset: Offset(0, 15),
          )
        ],
      ),
      child: Center(child: Image.asset('assets/flutter_logo.png')),
    );
  }
}
