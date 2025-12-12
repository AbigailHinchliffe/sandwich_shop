import 'package:flutter/material.dart';
import 'package:sandwich_shop/views/app_styles.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double _fontSize = AppStyles.baseFontSize;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    await AppStyles.loadFontSize();
    setState(() {
      _fontSize = AppStyles.baseFontSize;
    });
  }

  Future<void> _updateFontSize(double fontSize) async {
    await AppStyles.saveFontSize(fontSize);
    setState(() {
      _fontSize = fontSize;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: AppStyles.heading1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Font Size', style: AppStyles.heading2),
            Slider(
              value: _fontSize,
              min: 12.0,
              max: 24.0,
              divisions: 12,
              label: _fontSize.toStringAsFixed(0),
              onChanged: (double value) {
                _updateFontSize(value);
              },
            ),
            const SizedBox(height: 16),
            Text(
              'Preview Text',
              style: AppStyles.normalText,
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Back to Order', style: AppStyles.normalText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
