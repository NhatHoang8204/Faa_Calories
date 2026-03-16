import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'water/water.dart';
import 'weight/weight.dart';

// Hàm mở Bottom Sheet danh sách Shortcuts
void showShortcutsBottomSheet(BuildContext context) {
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) {
      return const ShortcutsBottomSheet();
    },
  );
}

class ShortcutsBottomSheet extends StatelessWidget {
  const ShortcutsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        // Thêm SafeArea để tránh đè lên home bar của iPhone
        child: Column(
          mainAxisSize: MainAxisSize
              .min, // Để bottom sheet chỉ cao bằng nội dung bên trong
          children: [
            const SizedBox(height: 12),
            // Thanh gạt (Drag handle) nhỏ bằng xám ở trên
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 12),

            // Header (Có chữ Shortcuts ở giữa và icon Setting bên phải)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 24,
                  ), // Spacer cân bằng với icon bên phải
                  const Text(
                    'Shortcuts',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const Icon(
                    CupertinoIcons.gear_alt,
                    color: CupertinoColors.activeGreen,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Các Shortcuts Tròn
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildRoundShortcut(
                  CupertinoIcons.search,
                  'Search',
                  Colors.lightBlue,
                ),
                _buildRoundShortcut(
                  CupertinoIcons.barcode_viewfinder,
                  'Barcode',
                  CupertinoColors.activeGreen,
                ),
                _buildRoundShortcut(
                  CupertinoIcons.qrcode_viewfinder,
                  'Meal Scan',
                  Colors.purpleAccent,
                ),
                _buildRoundShortcut(
                  CupertinoIcons.drop,
                  'Insulin',
                  Colors.lightBlueAccent,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Các Shortcuts Vuông
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildRectShortcut(
                          Icons.local_drink_outlined,
                          'Water',
                          CupertinoColors.activeGreen,
                          onTap: () {
                            // Đóng bottom sheet hiện tại
                            Navigator.pop(context);
                            // Mở màn hình Water như một dialog đè lên
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (context, _, __) =>
                                    const WaterScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildRectShortcut(
                          Icons.fitness_center_outlined,
                          'Exercise',
                          Colors.tealAccent.shade700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildRectShortcut(
                          Icons.monitor_weight_outlined,
                          'Weight',
                          Colors.blueAccent,
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (context, _, __) =>
                                    const WeightScreenDialog(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildRectShortcut(
                          Icons.local_fire_department_outlined,
                          'Calories',
                          Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40), // Căn dưới
          ],
        ),
      ),
    );
  }

  // Hàm tạo Shortcut Tròn
  Widget _buildRoundShortcut(IconData icon, String label, Color iconColor) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade200, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.05),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Icon(icon, color: iconColor, size: 30),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Color(0xFF444444)),
        ),
      ],
    );
  }

  // Hàm tạo Shortcut vuông bo góc
  Widget _buildRectShortcut(
    IconData icon,
    String label,
    Color iconColor, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200, width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 28),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF444444),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
