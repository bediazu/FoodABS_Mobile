import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: Colors.white70, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: <Widget>[
            Container(
              child: TextField(),
              width: double.infinity,
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
