import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home, color: Colors.white),
            onPressed: () {
              // أضف هنا وظيفة عند الضغط على الأيقونة
            },
          ),
          Text(
            'Footer',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          IconButton(
            icon: Icon(Icons.contact_mail, color: Colors.white),
            onPressed: () {
              // أضف هنا وظيفة عند الضغط على الأيقونة
            },
          ),
        ],
      ),
    );
  }
}