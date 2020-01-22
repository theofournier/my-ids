import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;

  SearchWidget({this.title, this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: title,
                  prefixIcon: Icon(Icons.search),
                ),
                textInputAction: TextInputAction.search,
              ),
            ),
            IconButton(
              icon: Icon(Icons.clear, color: Colors.black.withOpacity(0.5),),
              onPressed: () => controller.clear(),
            )
          ],
        ),
      ),
    );
  }
}
