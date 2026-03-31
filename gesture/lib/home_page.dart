import 'package:flutter/material.dart';
import 'pages/tap_page.dart';
import 'pages/drag_page.dart';
import 'pages/scale_page.dart';
import 'pages/playground_page.dart';

class HomePage extends StatelessWidget {
  final menus = [
    {"title": "Tap Interaction", "page": TapPage()},
    {"title": "Drag Movement", "page": DragPage()},
    {"title": "Scale & Zoom", "page": ScalePage()},
    {"title": "Gesture Playground", "page": PlaygroundPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F172A),
      appBar: AppBar(
        title: Text("Gesture Lab", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Master your touch interactions",
              style: TextStyle(color: Colors.blueAccent, fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                itemCount: menus.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (_, i) {
                  return MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => menus[i]["page"] as Widget),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: i % 2 == 0 
                              ? [Color(0xFF3B82F6), Color(0xFF8B5CF6)] 
                              : [Color(0xFFEC4899), Color(0xFFF43F5E)],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: (i % 2 == 0 ? Color(0xFF3B82F6) : Color(0xFFEC4899)).withOpacity(0.3),
                              blurRadius: 15,
                              offset: Offset(0, 8),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Stack(
                            children: [
                              Positioned(
                                right: -20,
                                top: -20,
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      _getIconForTitle(menus[i]["title"] as String),
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      menus[i]["title"] as String,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForTitle(String title) {
    if (title.contains("Tap")) return Icons.touch_app;
    if (title.contains("Drag")) return Icons.move_to_inbox;
    if (title.contains("Scale")) return Icons.zoom_in;
    return Icons.rocket_launch;
  }
}
