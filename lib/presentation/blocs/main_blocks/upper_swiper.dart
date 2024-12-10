
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class UpperSwiper extends StatelessWidget {
  const UpperSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> slides = [
      {
        'title': 'Baby Names',
        'description': 'Discover beautiful baby names and their meanings',
        'color': Colors.pink,
        'icon': Icons.child_care,
        'onTap': () {
          Scrollable.ensureVisible(
            GlobalKey(debugLabel: 'baby-names').currentContext!,
            duration: const Duration(milliseconds: 500),
          );
        },
      },
      {
        'title': 'IQ Test',
        'description': 'Test your child\'s intelligence in a fun way',
        'color': Colors.blue,
        'icon': Icons.psychology,
        'onTap': () {
          Scrollable.ensureVisible(
            GlobalKey(debugLabel: 'ai-test').currentContext!,
            duration: const Duration(milliseconds: 500),
          );
        },
      },
      {
        'title': 'Common Diseases',
        'description': 'Learn about common diseases and their treatments',
        'color': Colors.purple,
        'icon': Icons.medical_services,
        'onTap': () {
          Scrollable.ensureVisible(
            GlobalKey(debugLabel: 'diseases').currentContext!,
            duration: const Duration(milliseconds: 500),
          );
        },
      },
    ];

    return Container(
      height: 250,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: slides[index]['onTap'] as void Function(),
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    (slides[index]['color'] as Color).withOpacity(0.7),
                    slides[index]['color'] as Color,
                  ],
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: -30,
                    bottom: -30,
                    child: Icon(
                      slides[index]['icon'] as IconData,
                      size: 150,
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          slides[index]['title'] as String,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          slides[index]['description'] as String,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: slides[index]['onTap'] as void Function(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: slides[index]['color'] as Color,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                          ),
                          child: const Text('Discover More'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: slides.length,
        pagination: const SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            activeColor: Colors.white,
            color: Colors.white54,
          ),
        ),
        control: const SwiperControl(
          color: Colors.white,
        ),
        autoplay: true,
        autoplayDelay: 5000,
        scrollDirection: Axis.horizontal,
        loop: true,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}