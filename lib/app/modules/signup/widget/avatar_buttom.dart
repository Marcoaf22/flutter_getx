import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvatarButtom extends StatelessWidget {
  final String? url;
  final double imageSize;
  final VoidCallback onPressed;
  final bool withButton;
  const AvatarButtom({
    Key? key,
    this.imageSize = 100,
    this.url,
    required this.onPressed,
    required this.withButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(url!.length);
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  blurRadius: 20, color: Colors.black38, offset: Offset(0, 10)),
            ],
          ),
          child: ClipOval(
            child: Image.network(
              this.url ?? 'https://www.w3schools.com/howto/img_avatar.png',
              // this.url ??
              // 'https://w7.pngwing.com/pngs/223/244/png-transparent-computer-icons-avatar-user-profile-avatar-heroes-rectangle-black.png',
              width: this.imageSize,
              height: this.imageSize,
              fit: BoxFit.cover,
            ),
          ),
        ),
        withButton
            ? Positioned(
                bottom: 5,
                right: 0,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 1.5,
                      ),
                      shape: BoxShape.circle,
                      color: Colors.pink,
                    ),
                  ),
                  onPressed: this.onPressed,
                ),
              )
            : Container(),
      ],
    );
  }
}
