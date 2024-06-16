import 'package:demo_pages/carousel_slider/const/const_colors.dart';
import 'package:demo_pages/carousel_slider/model/sahabe.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.sahabe,
  });
  final Sahabe sahabe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: matBlack,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: 500,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                    tag: sahabe.id,
                    child: Image.asset(
                      sahabe.path,
                      fit: BoxFit.cover,
                      height: 500,
                    )),
              ),
            ),
            SliverToBoxAdapter(
              
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sahabe.name,
                      style: GoogleFonts.alice(
                          fontSize: 40,
                          color: myBackground,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      sahabe.description,
                      style: GoogleFonts.alice(
                        fontSize: 20,
                        color: myBackground,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )

        // Column(
        //   children: [
        //     GestureDetector(
        //       onTap: () {
        //         Navigator.of(context).pop();
        //       },
        //       child: Hero(tag: path, child: Image.asset(path, fit: BoxFit.cover,height: 500,)),
        //     ),
        //   ],
        // ),
        );
  }
}
