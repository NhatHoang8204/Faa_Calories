import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MyDiet/my_diet_screen.dart';

class DietToolsScreen extends StatelessWidget {
  const DietToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFF1CB052,
      ), // Green color matching the image for top status bar
      body: SafeArea(
        bottom: false,
        child: Container(
          color: const Color(0xFFF4F6F8), // Light grey background
          child: Column(
            children: [
              // Custom AppBar
              Container(
                color: const Color(0xFF1CB052),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        CupertinoIcons.bars,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    const Expanded(
                      child: Text(
                        'Diet Tools',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(
                          0xFFFF9800,
                        ), // Orange Go Premium button
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Go Premium',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Body Content
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 16.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Card 1: My Diet
                        _buildSingleCard(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: const Duration(
                                  milliseconds: 300,
                                ),
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const MyDietScreen(), // 👈 màn hình bạn muốn chuyển tới

                                transitionsBuilder:
                                    (
                                      context,
                                      animation,
                                      secondaryAnimation,
                                      child,
                                    ) {
                                      const begin = Offset(
                                        0.0,
                                        1.0,
                                      ); // từ dưới lên
                                      const end = Offset.zero;
                                      const curve = Curves.easeOutCubic;

                                      final tween = Tween(
                                        begin: begin,
                                        end: end,
                                      ).chain(CurveTween(curve: curve));

                                      return SlideTransition(
                                        position: animation.drive(tween),
                                        child: child,
                                      );
                                    },
                              ),
                            );
                          },
                          icon: CupertinoIcons.flame_fill,
                          iconColor: Colors.white,
                          iconSize: 18, // Bạn thay đổi cỡ icon lửa ở đây
                          iconBoxSize:
                              36, // Bạn thay đổi cỡ vòng tròn bao quanh icon ở đây
                          iconBgColor: const Color(
                            0xFFFFB300,
                          ), // Amber/Orange solid
                          title: 'My Diet',
                          titleStyle: const TextStyle(
                            fontSize: 14, // Thay đổi kích thước My Diet ở đây
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2C3E50),
                          ),
                          subtitle: 'Find a diet that fits your lifestyle',
                          subtitleStyle: TextStyle(
                            fontSize:
                                12, // Thay đổi kích thước Find a diet... ở đây
                            color: Colors.grey[600],
                            height: 1.2,
                          ),
                          trailing: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1CB052),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Select',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),

                        // Card Block 2: Premium features
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.03),
                                blurRadius: 10,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              _buildListTile(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Đã bấm vào trang Premium Recipes & Meals!',
                                      ),
                                      duration: Duration(seconds: 2),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                },
                                icon: Icons.restaurant,
                                iconColor: Colors.white,
                                iconSize: 18,
                                iconBoxSize: 36,
                                iconBgColor: const Color(0xFFFFB300),
                                title: 'Premium Recipes & Meals',
                                titleStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2C3E50),
                                ),
                                subtitle:
                                    'Crafted by our Registered Dietitians',
                                subtitleStyle: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                  height: 1.2,
                                ),
                              ),
                              _buildDivider(),
                              _buildListTile(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Đã bấm vào trang Premium Menus!',
                                      ),
                                      duration: Duration(seconds: 2),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                },
                                icon: Icons.menu_book,
                                iconColor: Colors.white,
                                iconSize: 18,
                                iconBoxSize: 36,
                                iconBgColor: const Color(0xFFFFB300),
                                title: 'Premium Menus',
                                titleStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2C3E50),
                                ),
                                subtitle:
                                    'Nutritious meal ideas from our dietitians',
                                subtitleStyle: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                  height: 1.2,
                                ),
                              ),
                              _buildDivider(),
                              _buildListTile(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Đã bấm vào trang Meal Planner!',
                                      ),
                                      duration: Duration(seconds: 2),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                },
                                icon: Icons.pending_actions,
                                iconColor: Colors.white,
                                iconSize: 18,
                                iconBoxSize: 36,
                                iconBgColor: const Color(0xFFFFB300),
                                title: 'Meal Planner',
                                titleStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2C3E50),
                                ),
                                subtitle: 'Plan your week\'s meals in advance',
                                subtitleStyle: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                  height: 1.2,
                                ),
                              ),
                              _buildDivider(),
                              _buildListTile(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Đã bấm vào trang Restaurant Menu AI Scan!',
                                      ),
                                      duration: Duration(seconds: 2),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                },
                                icon: CupertinoIcons.viewfinder,
                                iconColor: Colors.white,
                                iconSize: 18,
                                iconBoxSize: 36,
                                iconBgColor: const Color(0xFF9E86E1),
                                title: 'Restaurant Menu AI Scan',
                                titleStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2C3E50),
                                ),
                                subtitle: 'Personalized dish recommendations',
                                subtitleStyle: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Card 3: Intermittent Fasting
                        _buildSingleCard(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Đã bấm vào trang Intermittent Fasting!',
                                ),
                                duration: Duration(seconds: 2),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          },
                          icon: CupertinoIcons.timer,
                          iconColor: Colors.white,
                          iconSize: 18,
                          iconBoxSize: 36,
                          iconBgColor: const Color(0xFF1CB052),
                          title: 'Intermittent Fasting',
                          titleStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2C3E50),
                          ),
                          subtitle:
                              'Enable fasting timer and configure fasting tools',
                          subtitleStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Banner Card: Mediterranean Recipes
                        Container(
                          width: double.infinity,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80', // A salad bowl image
                              ),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                colors: [
                                  const Color(
                                    0xFF1A6B8F,
                                  ).withOpacity(0.9), // Teal-ish blue
                                  const Color(0xFF1A6B8F).withOpacity(0.6),
                                  Colors.transparent,
                                ],
                                stops: const [0.0, 0.4, 1.0],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                              vertical: 20.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Mediterranean\nRecipes',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: const [
                                    Text(
                                      'BROWSE',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(
                                      CupertinoIcons.chevron_right,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 28),

                        // Section: My Diet Trends
                        const Text(
                          'My Diet Trends',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2C3E50),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Card 4: Diet Trends Details
                        _buildSingleCard(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Đã bấm vào trang My Diet Trends!',
                                ),
                                duration: Duration(seconds: 2),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          },
                          icon: CupertinoIcons.checkmark_seal_fill,
                          iconColor: Colors.white,
                          iconSize: 18,
                          iconBoxSize: 36,
                          iconBgColor: const Color(0xFF1CB052),
                          subtitleWidget: RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 13,
                                height: 1.4,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      "You've maintained weight during last week, your food & exercise log predicts weight loss. See ",
                                ),
                                TextSpan(
                                  text: "all trends.",
                                  style: TextStyle(
                                    color: Color(0xFF1CB052),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 28),

                        // Section: Analysis & Insights
                        const Text(
                          'Analysis & Insights',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2C3E50),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Card Block 5: Analysis & Insights features
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.03),
                                blurRadius: 10,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildListTile(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Đã bấm vào trang AI Coach!',
                                      ),
                                      duration: Duration(seconds: 2),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                },
                                icon: Icons.auto_awesome,
                                iconColor: Colors.white,
                                iconSize: 18,
                                iconBoxSize: 36,
                                iconBgColor: const Color(
                                  0xFF29B6F6,
                                ), // Light blue as stand-in for gradient
                                title: 'AI Coach',
                                subtitle:
                                    'A personal coach that knows your diet, helps you daily, and keeps you on track',
                              ),
                              _buildListTile(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Đã bấm vào trang My Analysis!',
                                      ),
                                      duration: Duration(seconds: 2),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                },
                                icon: Icons.biotech,
                                iconColor: Colors.white,
                                iconSize: 20,
                                iconBoxSize: 36,
                                iconBgColor: const Color(0xFF4FC3F7),
                                title: 'My Analysis',
                              ),
                              _buildListTile(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Đã bấm vào trang Nutrient Analysis!',
                                      ),
                                      duration: Duration(seconds: 2),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                },
                                icon: Icons.local_florist, // grapes-ish
                                iconColor: Colors.white,
                                iconSize: 20,
                                iconBoxSize: 36,
                                iconBgColor: const Color(0xFFB39DDB),
                                title: 'Nutrient Analysis',
                                subtitle:
                                    'In-depth analysis: top meals, foods, goals, and statistics',
                              ),
                              _buildListTile(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Đã bấm vào trang Charts!'),
                                      duration: Duration(seconds: 2),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                },
                                icon: Icons.bar_chart,
                                iconColor: Colors.white,
                                iconSize: 20,
                                iconBoxSize: 36,
                                iconBgColor: const Color(0xFF4DD0E1),
                                title: 'Charts',
                              ),
                              _buildListTile(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Đã bấm vào trang Reports & Summary Emails!',
                                      ),
                                      duration: Duration(seconds: 2),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                },
                                icon: Icons.feed_outlined,
                                iconColor: Colors.white,
                                iconSize: 20,
                                iconBoxSize: 36,
                                iconBgColor: const Color(0xFF4DB6AC),
                                title: 'Reports & Summary Emails',
                              ),
                              _buildListTile(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Đã bấm vào trang Weekly Averages!',
                                      ),
                                      duration: Duration(seconds: 2),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                },
                                icon: Icons.grid_view,
                                iconColor: Colors.white,
                                iconSize: 20,
                                iconBoxSize: 36,
                                iconBgColor: const Color(0xFF64B5F6),
                                title: 'Weekly Averages',
                              ),
                              _buildListTile(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Đã bấm vào trang Advice History & Favorites!',
                                      ),
                                      duration: Duration(seconds: 2),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                },
                                icon: Icons.lightbulb_outline,
                                iconColor: Colors.white,
                                iconSize: 20,
                                iconBoxSize: 36,
                                iconBgColor: const Color(0xFFFFD54F),
                                title: 'Advice History & Favorites',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 28),

                        // Section: Learning
                        const Text(
                          'Learning',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2C3E50),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Card Block 6: Learning features
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.03),
                                blurRadius: 10,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildListTile(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Đã bấm vào trang Diabetes App Guide!',
                                      ),
                                      duration: Duration(seconds: 2),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                },
                                icon: Icons.navigation_outlined,
                                iconColor: Colors.white,
                                iconSize: 20,
                                iconBoxSize: 36,
                                iconBgColor: const Color(0xFF81C784),
                                title: 'Diabetes App Guide',
                              ),
                              _buildListTile(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Đã bấm vào trang Dietitian Blog!',
                                      ),
                                      duration: Duration(seconds: 2),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                },
                                icon: Icons.border_color, // Edit icon roughly
                                iconColor: Colors.white,
                                iconSize: 20,
                                iconBoxSize: 36,
                                iconBgColor: const Color(0xFF4DB6AC),
                                title: 'Dietitian Blog',
                              ),
                              _buildListTile(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Đã bấm vào trang Diet Library!',
                                      ),
                                      duration: Duration(seconds: 2),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                },
                                icon: Icons.menu_book,
                                iconColor: Colors.white,
                                iconSize: 20,
                                iconBoxSize: 36,
                                iconBgColor: const Color(0xFF81C784),
                                title: 'Diet Library',
                              ),
                              _buildListTile(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Đã bấm vào trang Advice Library!',
                                      ),
                                      duration: Duration(seconds: 2),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                },
                                icon: Icons.chrome_reader_mode,
                                iconColor: Colors.white,
                                iconSize: 20,
                                iconBoxSize: 36,
                                iconBgColor: const Color(0xFFFFD54F),
                                title: 'Advice Library',
                              ),
                              _buildListTile(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Đã bấm vào trang How-to Videos!',
                                      ),
                                      duration: Duration(seconds: 2),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                },
                                icon: Icons.play_arrow,
                                iconColor: Colors.white,
                                iconSize: 20,
                                iconBoxSize: 36,
                                iconBgColor: const Color(0xFFE57373),
                                title: 'How-to Videos',
                              ),
                              _buildListTile(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Đã bấm vào trang Tips & Tricks!',
                                      ),
                                      duration: Duration(seconds: 2),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                },
                                icon: Icons.lightbulb_outline,
                                iconColor: Colors.white,
                                iconSize: 20,
                                iconBoxSize: 36,
                                iconBgColor: const Color(0xFFFFD54F),
                                title: 'Tips & Tricks',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 80), // Bottom padding
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSingleCard({
    required IconData icon,
    required Color iconColor,
    double? iconSize,
    double? iconBoxSize,
    Color? iconBgColor,
    Color? iconBorderColor,
    String? title,
    TextStyle? titleStyle,
    String? subtitle,
    TextStyle? subtitleStyle,
    Widget? subtitleWidget,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: _buildListTile(
            icon: icon,
            iconColor: iconColor,
            iconSize: iconSize,
            iconBoxSize: iconBoxSize,
            iconBgColor: iconBgColor,
            iconBorderColor: iconBorderColor,
            title: title,
            titleStyle: titleStyle,
            subtitle: subtitle,
            subtitleStyle: subtitleStyle,
            subtitleWidget: subtitleWidget,
            trailing: trailing,
            onTap: null, // Avoid double tap layers
          ),
        ),
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required Color iconColor,
    double? iconSize,
    double? iconBoxSize,
    Color? iconBgColor,
    Color? iconBorderColor,
    String? title,
    TextStyle? titleStyle,
    String? subtitle,
    TextStyle? subtitleStyle,
    Widget? subtitleWidget,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    Widget content = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon Box
          Container(
            width: iconBoxSize ?? 40,
            height: iconBoxSize ?? 40,
            decoration: BoxDecoration(
              color: iconBgColor ?? Colors.white,
              shape: BoxShape.circle,
              border: iconBorderColor != null
                  ? Border.all(color: iconBorderColor, width: 1.5)
                  : null,
            ),
            child: Icon(icon, color: iconColor, size: iconSize ?? 24),
          ),
          const SizedBox(width: 16),
          // Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (title != null && title.isNotEmpty) ...[
                  Text(
                    title,
                    style:
                        titleStyle ??
                        const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2C3E50),
                        ),
                  ),
                  const SizedBox(height: 4),
                ],
                if (subtitleWidget != null)
                  subtitleWidget
                else if (subtitle != null)
                  Text(
                    subtitle,
                    style:
                        subtitleStyle ??
                        TextStyle(
                          fontSize: 13,
                          color: Colors.grey[600],
                          height: 1.2,
                        ),
                  ),
              ],
            ),
          ),
          // Trailing
          if (trailing != null) ...[const SizedBox(width: 12), trailing],
        ],
      ),
    );

    if (onTap != null) {
      return Material(
        color: Colors.transparent,
        child: InkWell(onTap: onTap, child: content),
      );
    }

    return content;
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey[200],
      indent: 76, // 16 (padding) + 44 (icon width) + 16 (spacing)
      endIndent: 0,
    );
  }
}
