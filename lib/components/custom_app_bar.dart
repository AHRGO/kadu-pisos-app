import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar(this.title,{super.key});

  String title;
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 115);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20.0),
      color: const Color(0XFF635655),
      child: AppBar(
        backgroundColor: const Color(0XFF635655),
        leading: Container(
          padding: const EdgeInsets.only(left: 12.0),
          child: const CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('assets/images/logo.png'),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu,
              size: 35.0,
              color: Colors.white,
            ),
            onPressed: () {
              // Implement your menu functionality here
            },
          ),
        ],
        title: const Row(
          children: [
            Text(
              'kadu',
              style: TextStyle(
                color: Color(0xFF262521),
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
            ),
            SizedBox(width: 2),
            Text(
              'pisos',
              style: TextStyle(
                color: Color(0XFFF2C026),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Column(
            children: [
              Text(title,
                style: const TextStyle(
                  color: Color(0XFFF2C026),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16, top:5),
                color: Colors.grey[300],
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Pesquisar',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
