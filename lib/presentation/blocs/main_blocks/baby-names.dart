import 'package:flutter/material.dart';

class BabyNames extends StatelessWidget {
  const BabyNames({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            'Baby Names',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _buildAlphabetPath(),
        ],
      ),
    );
  }

  Widget _buildAlphabetPath() {
    return Stack(
      children: [
        // Zigzag path
        Positioned.fill(
          child: CustomPaint(
            painter: PathPainter(),
          ),
        ),
        // Letters and steps
        Column(
          children: [
            _buildLetterStation('A', Colors.pink.shade100),
            _buildSteps(),
            _buildLetterStation('B', Colors.blue.shade100),
            _buildSteps(),
            _buildLetterStation('C', Colors.purple.shade100),
          ],
        ),
      ],
    );
  }

  Widget _buildLetterStation(String letter, Color color) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          letter,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildSteps() {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.rotate(
            angle: 0.2,
            child: Image.asset(
              'assets/images/baby-feet.png',
              height: 20,
              errorBuilder: (context, error, stackTrace) {
                print('Error loading image: $error');
                return const Icon(Icons.error);
              },
            ),
          ),
          const SizedBox(width: 20),
          Transform.rotate(
            angle: -0.2,
            child: Image.asset(
              'assets/images/baby-feet.png',
              height: 20,
              errorBuilder: (context, error, stackTrace) {
                print('Error loading image: $error');
                return const Icon(Icons.error);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

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