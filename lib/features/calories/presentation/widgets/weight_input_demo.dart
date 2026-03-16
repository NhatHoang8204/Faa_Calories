import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewEntryDemo extends StatefulWidget {
  const NewEntryDemo({super.key});

  @override
  State<NewEntryDemo> createState() => _NewEntryDemoState();
}

class _NewEntryDemoState extends State<NewEntryDemo> {
  final TextEditingController _weightController = TextEditingController();

  void _showCustomKeyboard() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return CustomNumericKeyboard(
          controller: _weightController,
          onDone: () {
            Navigator.pop(context);
          },
          onCancel: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.close, color: Colors.green),
                            onPressed: () => Navigator.pop(context),
                          ),
                          const Text(
                            'New Entry',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 48), // Spacer
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Text('Weight', style: TextStyle(fontSize: 16)),
                          const SizedBox(width: 20),
                          Expanded(
                            child: TextField(
                              controller: _weightController,
                              readOnly: true, // Prevent native keyboard
                              onTap: _showCustomKeyboard,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'kg',
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                            'Save',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          child: const Text('Show New Entry'),
        ),
      ),
    );
  }
}

class CustomNumericKeyboard extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onDone;
  final VoidCallback onCancel;

  const CustomNumericKeyboard({
    super.key,
    required this.controller,
    required this.onDone,
    required this.onCancel,
  });

  void _onKeyPressed(String value) {
    if (value == '<') {
      if (controller.text.isNotEmpty) {
        controller.text =
            controller.text.substring(0, controller.text.length - 1);
      }
    } else {
      controller.text += value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFD1D5DB), // Light grey background like iOS
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Toolbar (Cancel and Done)
          Container(
            height: 44,
            color: const Color(0xFF1CB052), // Green bar
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  onPressed: onCancel,
                  child: const Text('Cancel',
                      style: TextStyle(color: Colors.white)),
                ),
                CupertinoButton(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  onPressed: onDone,
                  child:
                      const Text('Done', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          // Number Pad
          Container(
            padding: const EdgeInsets.all(6),
            child: Column(
              children: [
                _buildRow(['1', '2', '3']),
                const SizedBox(height: 6),
                _buildRow(['4', '5', '6']),
                const SizedBox(height: 6),
                _buildRow(['7', '8', '9']),
                const SizedBox(height: 6),
                _buildRow([',', '0', '<']),
              ],
            ),
          ),
          // SafeArea bottom padding
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }

  Widget _buildRow(List<String> keys) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: keys.map((key) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: _buildKey(key),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildKey(String key) {
    if (key == '<') {
      return GestureDetector(
        onTap: () => _onKeyPressed('<'),
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFBCC0C6),
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 1),
                blurRadius: 0,
              )
            ],
          ),
          child: const Center(
            child: Icon(Icons.backspace_outlined, color: Colors.black),
          ),
        ),
      );
    }
    return GestureDetector(
      onTap: () => _onKeyPressed(key),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 1),
              blurRadius: 0,
            )
          ],
        ),
        child: Center(
          child: Text(
            key,
            style: const TextStyle(fontSize: 24, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
