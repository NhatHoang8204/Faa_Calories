import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_colors.dart';

class WaterScreen extends StatefulWidget {
  const WaterScreen({super.key});

  @override
  State<WaterScreen> createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> {
  int currentWater = 0; // ml
  final int waterGoal = 2000; // Mục tiêu 2 lít
  DateTime currentDate = DateTime.now();

  void _addWater(int amount) {
    setState(() {
      currentWater += amount;
    });
  }

  void _changeDate(int days) {
    setState(() {
      currentDate = currentDate.add(Duration(days: days));
    });
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  String _formatDate(DateTime date) {
    String day = date.day.toString().padLeft(2, '0');
    String month = date.month.toString().padLeft(2, '0');
    String year = date.year.toString();
    return "$day/$month/$year";
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:
          Colors.transparent, // Nền trong suốt để hiển thị overlay ở Shortcuts
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: screenHeight * 0.96, // Hở 1 tí trên top
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Phần trên top "Water" background màu xanh
              Container(
                color: const Color(0xFF1CB052), // Đã đổi sang xanh Green
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.pop(context),
                      child: const Icon(
                        CupertinoIcons.xmark,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 42,
                      ), // Cách đều tất cả các phía 10px
                      child: const Text(
                        'Water',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: CupertinoColors.activeOrange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Go Premium',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // 2. Phần dưới ngày tháng background trắng
              Container(color: Colors.white, child: _buildDateSelector()),

              // Phần Cuộn được
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      // 2. Hiển thị số lượng nước hiện tại
                      Center(
                        child: Column(
                          children: [
                            Text(
                              '$currentWater ml',
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1CB052),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'about ${(currentWater / 250).floor()} glasses',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),

                      // 3. Thanh tiến trình (Progress Bar)
                      _buildProgressBar(),

                      const SizedBox(height: 20),

                      // 4. Toggle Day/7 Days
                      _buildToggleSwitch(),

                      const SizedBox(height: 20),

                      // 5. Khu vực biểu đồ (Mock)
                      _buildChartArea(),

                      const SizedBox(height: 30),

                      // 6. Phần Log Water (Các nút thêm nhanh)
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Log Water',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.colorBlack,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildLogButtonsRow(),

                      const SizedBox(height: 30),

                      // 7. Phần danh sách Water Check
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Water Check',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.textGrey,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ), // Khoảng cách trước khi tới chân trang
                      // 8. PHẦN CHÂN TRANG (EDIT & SETTINGS) - Sẽ hiện ra khi kéo xuống hết
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 24,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(top: BorderSide(color: Colors.white)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildFooterLink(
                              CupertinoIcons.pencil_outline,
                              'Edit Entries',
                            ),
                            const SizedBox(height: 25),
                            _buildFooterLink(
                              CupertinoIcons.gear_alt,
                              'Settings',
                            ),
                            const SizedBox(height: 25),
                            _buildFooterLink(
                              CupertinoIcons.question_circle,
                              'Helps & Tips',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ), // Khoảng hở cuối cùng để không bị sát mép
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- CÁC WIDGET CON ĐỂ CODE GỌN GÀNG HƠN ---

  Widget _buildDateSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade100)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => _changeDate(-1),
            child: const Icon(
              CupertinoIcons.chevron_left,
              color: Color(0xFF1CB052),
              size: 20,
            ),
          ),
          Row(
            children: [
              const Icon(
                CupertinoIcons.calendar,
                color: Color(0xFF1CB052),
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                _isToday(currentDate) ? 'Today' : _formatDate(currentDate),
                style: const TextStyle(
                  color: Color(0xFF1CB052),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => _changeDate(1),
            child: const Icon(
              CupertinoIcons.chevron_right,
              color: Color(0xFF1CB052),
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            'Set Goal',
            style: TextStyle(color: Color(0xFF1CB052), fontSize: 14),
          ),
          const SizedBox(height: 8),
          Container(
            height: 10,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Stack(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    double progressWidth =
                        (currentWater / waterGoal) * constraints.maxWidth;
                    return Container(
                      width: progressWidth > constraints.maxWidth
                          ? constraints.maxWidth
                          : progressWidth,
                      height: 10,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1CB052),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleSwitch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                _buildToggleButton('Day', true),
                _buildToggleButton('7 Days', false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        boxShadow: isActive
            ? const [BoxShadow(color: Colors.black12, blurRadius: 2)]
            : [],
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: isActive ? Colors.black : AppColors.textGrey,
        ),
      ),
    );
  }

  Widget _buildChartArea() {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(height: 1, color: Colors.grey.shade300),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('08:00', style: TextStyle(color: Colors.grey, fontSize: 12)),
              Text('12:00', style: TextStyle(color: Colors.grey, fontSize: 12)),
              Text('16:00', style: TextStyle(color: Colors.grey, fontSize: 12)),
              Text('20:00', style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLogButtonsRow() {
    return Padding(
      // Bọc Padding ra ngoài Row để thụt vào so với lề màn hình
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Căn tất cả sang trái
        children: [
          _buildLogButton(CupertinoIcons.drop, '½ glass', 125),
          const SizedBox(width: 20), // Tạo khoảng hở 20px giữa nút 1 và 2
          _buildLogButton(Icons.local_drink, 'Glass', 250),
          const SizedBox(width: 20), // Tạo khoảng hở 20px giữa nút 2 và 3
          _buildLogButton(Icons.water_drop_outlined, 'Bottle', 500),
        ],
      ),
    );
  }

  Widget _buildLogButton(IconData icon, String label, int amount) {
    return GestureDetector(
      onTap: () => _addWater(amount),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF1CB052).withOpacity(0.1),
              border: Border.all(color: const Color(0xFF1CB052), width: 1),
            ),
            child: Icon(icon, color: const Color(0xFF1CB052), size: 18),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildFooterLink(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF1CB052), size: 24),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF1CB052),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
