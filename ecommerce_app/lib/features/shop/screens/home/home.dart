import 'package:ecommerce_app/common/widgets/custom_shapes/containers/t_primary_header_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
