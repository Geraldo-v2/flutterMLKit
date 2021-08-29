import 'package:flutter/material.dart';
class MenuItem extends StatelessWidget {
  final String picture,text;
  final Color backColor;
  final Widget screen;

  MenuItem(this.picture, this.text, this.backColor, this.screen);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return screen;
          }),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(250),
          color: backColor,
        ),
        height: 220,
        width: 250,
        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Image(
                image: AssetImage(picture),
              ),
            ),
            Flexible(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


