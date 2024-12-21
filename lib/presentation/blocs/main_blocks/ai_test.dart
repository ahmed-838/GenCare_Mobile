import 'package:flutter/material.dart';

// import '../../animations/button_animations.dart';

class AiTest extends StatefulWidget {
  const AiTest({super.key});

  @override
  State<AiTest> createState() => _AiTestState();
}

class _AiTestState extends State<AiTest> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        textDirection: TextDirection.ltr,
        children: [
          const Text(
            'AI Intelligence Test',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 500,
            child: Stack(
              children: [
                // المستطيل الأول (أعلى اليسار)
                Positioned(
                  left: 0,
                  top: 0,
                  child: _buildTestCard(
                    header: 'First Step',
                    body: 'Sonographic Image',
                    color: Colors.blue.shade100,
                  ),
                ),
                // المستطيل الثاني (المنتصف)
                Positioned(
                  left: 60,
                  top: 180,
                  child: _buildTestCard(
                    header: 'Second Step',
                    body: 'Upload Image',
                    color: Colors.blue.shade200,
                  ),
                ),
                // المستطيل الثالث (أسفل اليمين)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: _buildTestCard(
                    header: 'Third Step',
                    body: 'AI Analysis',
                    color: Colors.blue.shade300,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // زر اختبار الذكاء الاصطناعي
          Center(
            child: GestureDetector(
              onTapDown: (_) => setState(() => _isPressed = true),
              onTapUp: (_) => setState(() => _isPressed = false),
              onTapCancel: () => setState(() => _isPressed = false),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _isPressed ? 0.95 : 1.0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue.shade400,
                            Colors.blue.shade600,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Start AI Test',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 12),
                          RotationTransition(
                            turns: _controller,
                            child: Icon(
                              Icons.refresh,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

Widget _buildTestCard({
  required String header,
  required String body,
  required Color color,
}) {
  return Card(
    elevation: 8,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
      side: BorderSide(
        color: Colors.blue.shade300.withOpacity(0.3),
        width: 1,
      ),
    ),
    child: Container(
      width: 220,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color,
            color.withOpacity(0.8),
          ],
        ),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                header,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                body,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue.shade900,
                  height: 1.3,
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
