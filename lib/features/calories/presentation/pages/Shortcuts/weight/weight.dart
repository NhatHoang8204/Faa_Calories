import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../../core/constants/app_colors.dart';

class WeightScreenDialog extends StatefulWidget {
  const WeightScreenDialog({super.key});

  @override
  State<WeightScreenDialog> createState() => _WeightScreenDialogState();
}

class _WeightScreenDialogState extends State<WeightScreenDialog> {
  final TextEditingController _weightController = TextEditingController();
  bool _showKeyboard = false;
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5), // Làm mờ nền
      body: Stack(
        children: [
          // Bấm ra ngoài để đóng Dialog
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(color: Colors.transparent),
          ),

          // 1. BẢNG NHẬP LIỆU (CARD) Ở GIỮA NHƯNG ĐẨY LÊN TRÊN
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 100.0,
              ), // Đẩy từ trên xuống 100px
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Header màu xanh lá
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      decoration: const BoxDecoration(
                        color: AppColors.colorGreen,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: const Icon(
                              CupertinoIcons.xmark,
                              color: AppColors.backgroundWhite,
                              size: 22,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                          const Text(
                            'New Entry',
                            style: TextStyle(
                              color: AppColors.backgroundWhite,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          const SizedBox(width: 48), // Spacer cân bằng
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          // Dòng nhập Weight
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              const SizedBox(
                                width: 70,
                                child: Text(
                                  'Weight',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () =>
                                      setState(() => _showKeyboard = true),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(
                                            0xFF1CB052,
                                          ), // Luôn màu xanh lá
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      _weightController.text.isEmpty
                                          ? '   ' // Khởi tạo khoảng trống thay vì '---'
                                          : _weightController.text,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.colorGreen,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 70,
                                child: Text(
                                  'kg',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          // Dòng Date
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              const SizedBox(
                                width: 70,
                                child: Text(
                                  'Date',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    // Ẩn bàn phím số nếu đang bật
                                    if (_showKeyboard) {
                                      setState(() => _showKeyboard = false);
                                    }

                                    // Hiện Cupertino Picker chọn ngày
                                    showCupertinoModalPopup(
                                      context: context,
                                      builder: (_) => Container(
                                        height: 250,
                                        color: const Color.fromARGB(
                                          255,
                                          255,
                                          255,
                                          255,
                                        ),
                                        child: Column(
                                          children: [
                                            // Thanh công cụ trên Picker
                                            Container(
                                              height: 44,
                                              color:
                                                  CupertinoColors.activeGreen,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  CupertinoButton(
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 16,
                                                        ),
                                                    onPressed: () =>
                                                        Navigator.pop(context),
                                                    child: const Text(
                                                      'Done',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // Picker
                                            Expanded(
                                              child: SafeArea(
                                                top: false,
                                                child: CupertinoDatePicker(
                                                  mode: CupertinoDatePickerMode
                                                      .date,
                                                  initialDateTime:
                                                      _selectedDate,
                                                  maximumDate: DateTime.now(),
                                                  onDateTimeChanged:
                                                      (DateTime newDate) {
                                                        setState(() {
                                                          _selectedDate =
                                                              newDate;
                                                        });
                                                      },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF1CB052),
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      alignment: Alignment.center,
                                      child: Text(
                                        _formatDate(_selectedDate),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: CupertinoColors.activeBlue,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 70),
                            ],
                          ),
                          const SizedBox(height: 40),
                          // Nút Save
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: CupertinoButton(
                              color: const Color(0xFF1CB052),
                              borderRadius: BorderRadius.circular(25),
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                'Save',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 2. BÀN PHÍM TÙY CHỈNH Ở DƯỚI
          if (_showKeyboard)
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomNumericKeyboard(
                controller: _weightController,
                onCancel: () => setState(() => _showKeyboard = false),
                onDone: () => setState(() => _showKeyboard = false),
                onWeightChanged: () => setState(() {}),
              ),
            ),
        ],
      ),
    );
  }

  // Hàm hỗ trợ format ngày sang chữ "today", "yesterday" hoặc "dd/MM/yyyy"
  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final dateToCheck = DateTime(date.year, date.month, date.day);

    if (dateToCheck == today) {
      return 'today';
    } else if (dateToCheck == yesterday) {
      return 'yesterday';
    } else {
      return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
    }
  }
}

// CLASS BÀN PHÍM CHUẨN IOS
class CustomNumericKeyboard extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onDone;
  final VoidCallback onCancel;
  final VoidCallback? onWeightChanged;

  const CustomNumericKeyboard({
    super.key,
    required this.controller,
    required this.onDone,
    required this.onCancel,
    this.onWeightChanged,
  });

  void _onKeyPressed(String value) {
    HapticFeedback.lightImpact(); // Rung nhẹ khi bấm
    if (value == '<') {
      if (controller.text.isNotEmpty) {
        controller.text = controller.text.substring(
          0,
          controller.text.length - 1,
        );
      }
    } else {
      if (value == ',' && controller.text.contains(',')) return;
      if (controller.text.length >= 5) return; // Giới hạn số
      controller.text += value;
    }
    if (onWeightChanged != null) onWeightChanged!();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFD1D5DB), // Xám iOS
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Toolbar (Cancel/Done)
          Container(
            height: 44,
            color: const Color(0xFF1CB052),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  onPressed: onCancel,
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                CupertinoButton(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  onPressed: onDone,
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Các phím số
          Padding(
            padding: const EdgeInsets.fromLTRB(6, 6, 6, 25),
            child: Column(
              children: [
                _buildRow(['1', '2', '3'], ['', 'ABC', 'DEF']),
                const SizedBox(height: 6),
                _buildRow(['4', '5', '6'], ['GHI', 'JKL', 'MNO']),
                const SizedBox(height: 6),
                _buildRow(['7', '8', '9'], ['PQRS', 'TUV', 'WXYZ']),
                const SizedBox(height: 6),
                _buildRow([',', '0', '<'], ['', '', '']),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(List<String> keys, List<String> subs) {
    return Row(
      children: List.generate(
        keys.length,
        (i) => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: _buildKey(keys[i], subs[i]),
          ),
        ),
      ),
    );
  }

  Widget _buildKey(String key, String sub) {
    bool isSpecial = key == '<' || key == ',';
    return GestureDetector(
      onTapDown: (_) => HapticFeedback.selectionClick(),
      onTap: () => _onKeyPressed(key),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: isSpecial ? const Color(0xFFBCC0C6) : Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(color: Colors.black26, offset: Offset(0, 1)),
          ],
        ),
        child: Center(
          child: key == '<'
              ? const Icon(CupertinoIcons.delete_left, color: Colors.black)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      key,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    if (sub.isNotEmpty)
                      Text(
                        sub,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}
