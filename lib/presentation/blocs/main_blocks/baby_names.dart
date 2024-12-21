import 'package:flutter/material.dart';

class BabyNames extends StatefulWidget {
  const BabyNames({super.key});

  @override
  State<BabyNames> createState() => _BabyNamesState();
}

class _BabyNamesState extends State<BabyNames> with SingleTickerProviderStateMixin {
  late AnimationController _shapeController;
  late Animation<double> _shapeAnimation;

  @override
  void initState() {
    super.initState();
    _shapeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    
    _shapeAnimation = Tween<double>(
      begin: 0,
      end: 50,
    ).animate(CurvedAnimation(
      parent: _shapeController,
      curve: Curves.easeInOut,
    ));

    // بدء الانيميشن بشكل متكرر
    _shapeController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _shapeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              'Baby Names',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            child: _buildAlphabetPath(context),
          ),
          const SizedBox(height: 20),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 1.0, end: 1.05),
            duration: const Duration(milliseconds: 1500),
            curve: Curves.easeInOut,
            builder: (context, double scale, child) {
              return Center(
                child: Transform.scale(
                  scale: scale,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 228, 100, 230),
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 3,
                      ),
                      onPressed: () {
                        debugPrint('Discover more names button pressed');
                      },
                      child: const Center(
                        child: Text(
                          'Discover More Names',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAlphabetPath(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final containerWidth = constraints.maxWidth;
        const containerHeight = 400.0; // زيادة الارتفاع قليلاً
        
        return SizedBox(
          width: double.infinity,
          height: containerHeight,
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: PathPainter(),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(seconds: 1),
                left: 0,
                top: 0,
                child: _buildLetterStation('A', Colors.pink.shade200),
              ),
              AnimatedPositioned(
                duration: const Duration(seconds: 1),
                left: (containerWidth - 100) / 2,
                top: (containerHeight - 100) / 2,
                child: _buildLetterStation('B', Colors.blue.shade200),
              ),
              AnimatedPositioned(
                duration: const Duration(seconds: 1),
                right: 0,
                bottom: 0,
                child: _buildLetterStation('C', Colors.purple.shade200),
              ),
            ],
          ),
        );
      }
    );
  }

  Widget _buildLetterStation(String letter, Color color) {
    return AnimatedBuilder(
      animation: _shapeAnimation,
      builder: (context, child) {
        return Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(_shapeAnimation.value),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 12,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              letter,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        );
      },
    );
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3 // زيادة سمك الخط
      ..strokeCap = StrokeCap.round; // إضافة نهايات مستديرة للخط

    final path = Path();
    path.moveTo(size.width / 2, 0);
    
    // Draw zigzag path
    double y = 0;
    while (y < size.height) {
      path.quadraticBezierTo(
        0, y + 60,
        size.width / 2, y + 120,
      );
      y += 120;
      if (y < size.height) {
        path.quadraticBezierTo(
          size.width, y + 60,
          size.width / 2, y + 120,
        );
        y += 120;
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}