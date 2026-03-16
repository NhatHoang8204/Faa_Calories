import 'package:flutter/cupertino.dart';
import 'features/screens/NaviBottom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      // Đổi màu chủ đạo cho toàn app sang màu xanh Green của bạn
      theme: CupertinoThemeData(primaryColor: CupertinoColors.activeGreen),
      home: NaviBottom(),
    );
  }
}
