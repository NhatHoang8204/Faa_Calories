import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../calories/presentation/pages/Shortcuts/shortcuts.dart';
import '../diettools/diet_tools_screen.dart';

class NaviBottom extends StatefulWidget {
  const NaviBottom({super.key});

  @override
  State<NaviBottom> createState() => _NaviBottomState();
}

class _NaviBottomState extends State<NaviBottom> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment:
          Alignment.bottomCenter, // Căn giữa theo chiều ngang ở phía dưới

      children: [
        // 1. Khung chính của App
        CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            height: 70,
            border: Border(
              top: BorderSide(
                color: CupertinoColors.systemGrey.withOpacity(
                  0.5,
                ), // Màu đường kẻ ngang
                width: 1, // Độ dày đường kẻ
              ),
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 45),
                  child: Icon(CupertinoIcons.chart_bar_alt_fill, size: 35),
                ),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: Icon(CupertinoIcons.leaf_arrow_circlepath, size: 35),
                ),
                label: 'Diet Tools',
              ),

              // Tab trống ở giữa để "nhường chỗ" cho nút Add nổi
              BottomNavigationBarItem(icon: Icon(null), label: ''),

              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: Icon(CupertinoIcons.person_2_fill, size: 35),
                ),
                label: 'Community',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: Icon(CupertinoIcons.person_crop_circle, size: 35),
                ),
                label: 'Me',
              ),
            ],
          ),
          tabBuilder: (context, index) {
            if (index == 1) {
              return const DietToolsScreen();
            }
            return CupertinoPageScaffold(
              navigationBar: const CupertinoNavigationBar(
                middle: Text('Calorie Diet'),
              ),
              child: Center(child: Text('Trang $index')),
            );
          },
        ),

        // 2. NÚT ADD BAO QUANH HÌNH TRÒN XANH
        Positioned(
          bottom: 20, // Đẩy nút lên cao hơn thanh Nav một chút
          child: GestureDetector(
            onTap: () {
              // Mở Shortcuts Bottom Sheet
              showShortcutsBottomSheet(context);
            },
            child: Container(
              width: 50, // Độ rộng vòng tròn
              height: 50, // Độ cao vòng tròn
              decoration: BoxDecoration(
                color: AppColors.colorGreen, // Màu xanh chủ đạo
                shape: BoxShape.circle, // Làm cho nó thành hình tròn
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5), // Tạo bóng đổ xuống dưới
                  ),
                ],
              ),
              child: const Icon(
                CupertinoIcons.add,
                color: CupertinoColors.white, // Dấu cộng màu trắng
                size: 35,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
