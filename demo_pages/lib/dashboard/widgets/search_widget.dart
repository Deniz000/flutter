import 'package:demo_pages/dashboard/const/constants.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Use a Container with fixed height to avoid layout issues
    return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(56, 238, 238, 238)
      ),
      width: double.infinity, 
      child: const TextField(
        style: TextStyle(color: white),
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: white,),
          hintText: "Search",
          hintStyle: TextStyle(color: white),
          fillColor: Colors.transparent,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none
        ),
      ),
    );
  }
}
