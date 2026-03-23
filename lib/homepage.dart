import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const Color _primary = Color(0xFF5C3D2E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // ── Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/6.jpg',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: _primary,
                child: const Center(
                  child: Icon(Icons.image_not_supported, color: Colors.white),
                ),
              ),
            ),
          ),

          // ── Overlay
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),

          // ── Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo / Title
                  const Icon(Icons.factory, size: 60, color: Colors.white),
                  const SizedBox(height: 20),

                  const Text(
                    'Kimbub Factory',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'ระบบบริหารจัดการโรงงานเสื้อผ้า\nครบวงจรในที่เดียว',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // ── ปุ่มเข้าแอป
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: _primary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/kimbub');
                    },
                    child: const Text(
                      'เข้าสู่ระบบ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
