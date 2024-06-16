import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_pages/carousel_slider/const/const_colors.dart';
import 'package:demo_pages/carousel_slider/detail_page.dart';
import 'package:demo_pages/carousel_slider/extends_class.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarouselSliderLearn extends StatefulWidget {
  const CarouselSliderLearn({super.key});

  @override
  State<CarouselSliderLearn> createState() => _CarouselSliderStateLearn();
}

class _CarouselSliderStateLearn extends StateInside {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SizedBox(
              height: 600,
              child: Image.asset(
                selectedImage,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(gradient: gradient()),
              ),
            ),
            Positioned(
              bottom: -50,
              left: 0,
              right: 0,
              child: CarouselSlider(
                  options: CarouselOptions(
                    height: 600,
                    viewportFraction: 0.70,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        selectedImage = sahabeler[index].path;
                      });
                    },
                  ),
                  items: sahabeler.map((sahabe) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(pageBuilder:
                            (context, animation, secondaryAnimation) {
                          return FadeTransition(
                            opacity: animation,
                            child: DetailPage(
                              sahabe: sahabe,
                            ),
                          );
                        }));
                      },
                      child: SingleChildScrollView(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: shadow,
                                  offset: Offset(2, 2),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                ),
                              ],
                              color: matBlack,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      offset: const Offset(5, 5),
                                      blurRadius: 15,
                                      spreadRadius: 1,
                                    ),
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.1),
                                      offset: const Offset(-5, -5),
                                      blurRadius: 15,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Hero(
                                        tag: sahabe.id,
                                        child: Image.asset(sahabe.path))),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      sahabe.name,
                                      style: GoogleFonts.alice(
                                          fontSize: 25,
                                          color: myBackground,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      sahabe.description,
                                      maxLines: 6,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.alice(
                                        fontSize: 15,
                                        color: myBackground,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList()),
            )
          ],
        ),
      ),
    );
  }

  LinearGradient gradient() {
    return LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          matBlack.withOpacity(1),
          matBlack.withOpacity(1),
          matBlack.withOpacity(1),
          matBlack.withOpacity(1),
          matBlack.withOpacity(0),
          matBlack.withOpacity(0),
          matBlack.withOpacity(0),
          matBlack.withOpacity(0),
        ]);
  }
}
