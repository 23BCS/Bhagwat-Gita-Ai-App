import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = true;
  bool _notifications = true;
  bool _dailyVerse = true;
  bool _sanskritFirst = false;
  bool _vibration = true;
  double _fontSize = 16.0;
  String _selectedLanguage = 'English';
  String _selectedVoice = 'Sanskrit';

  final List<String> _languages = ['English', 'Hindi', 'Sanskrit', 'Tamil', 'Telugu', 'Bengali'];
  final List<String> _voices = ['Sanskrit', 'English', 'Hindi'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0A0A0A),
              Color(0xFF1A1A2E),
              Color(0xFF16213E),
              Color(0xFF0F3460),
            ],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // Theme Section
            _buildSectionTitle('Theme & Display'),
            _buildSwitchTile(
              'Dark Mode',
              'Use dark theme',
              _darkMode,
              (value) => setState(() => _darkMode = value),
              Icons.dark_mode,
            ),
            _buildSliderTile(
              'Font Size',
              'Adjust text size',
              _fontSize,
              10.0,
              24.0,
              (value) => setState(() => _fontSize = value),
              Icons.text_fields,
            ),
            
            const SizedBox(height: 24),
            
            // Language Section
            _buildSectionTitle('Language & Voice'),
            _buildDropdownTile(
              'Language',
              'Select app language',
              _selectedLanguage,
              _languages,
              (value) => setState(() => _selectedLanguage = value!),
              Icons.language,
            ),
            _buildDropdownTile(
              'Voice',
              'Select reading voice',
              _selectedVoice,
              _voices,
              (value) => setState(() => _selectedVoice = value!),
              Icons.record_voice_over,
            ),
            _buildSwitchTile(
              'Sanskrit First',
              'Show Sanskrit text first',
              _sanskritFirst,
              (value) => setState(() => _sanskritFirst = value),
              Icons.translate,
            ),
            
            const SizedBox(height: 24),
            
            // Notifications Section
            _buildSectionTitle('Notifications'),
            _buildSwitchTile(
              'Notifications',
              'Enable app notifications',
              _notifications,
              (value) => setState(() => _notifications = value),
              Icons.notifications,
            ),
            _buildSwitchTile(
              'Daily Verse',
              'Get daily verse notifications',
              _dailyVerse,
              (value) => setState(() => _dailyVerse = value),
              Icons.today,
            ),
            _buildSwitchTile(
              'Vibration',
              'Enable haptic feedback',
              _vibration,
              (value) => setState(() => _vibration = value),
              Icons.vibration,
            ),
            
            const SizedBox(height: 32),
            
            // About Section
            _buildSectionTitle('About'),
            _buildInfoTile(
              'Version',
              '1.0.0',
              Icons.info_outline,
            ),
            _buildInfoTile(
              'Developer',
              'Anand Ranjan',
              Icons.code,
            ),
            
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF4A90E2),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSwitchTile(
    String title,
    String subtitle,
    bool value,
    ValueChanged<bool> onChanged,
    IconData icon,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: const Color(0xFF4A90E2),
          size: 24,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 14,
          ),
        ),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF4A90E2),
          activeTrackColor: const Color(0xFF4A90E2).withOpacity(0.3),
          inactiveThumbColor: Colors.grey,
          inactiveTrackColor: Colors.grey.withOpacity(0.3),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }

  Widget _buildSliderTile(
    String title,
    String subtitle,
    double value,
    double min,
    double max,
    ValueChanged<double> onChanged,
    IconData icon,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: const Color(0xFF4A90E2),
                  size: 24,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${value.round()}',
                  style: const TextStyle(
                    color: Color(0xFF4A90E2),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: const Color(0xFF4A90E2),
                inactiveTrackColor: Colors.grey.withOpacity(0.3),
                thumbColor: const Color(0xFF4A90E2),
                overlayColor: const Color(0xFF4A90E2).withOpacity(0.2),
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
                trackHeight: 4,
              ),
              child: Slider(
                value: value,
                min: min,
                max: max,
                divisions: (max - min).round(),
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownTile(
    String title,
    String subtitle,
    String value,
    List<String> items,
    ValueChanged<String?> onChanged,
    IconData icon,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: const Color(0xFF4A90E2),
          size: 24,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 14,
          ),
        ),
        trailing: DropdownButton<String>(
          value: value,
          onChanged: onChanged,
          dropdownColor: const Color(0xFF1A1A2E),
          style: const TextStyle(color: Colors.white),
          underline: Container(),
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Color(0xFF4A90E2),
          ),
          items: items.map<DropdownMenuItem<String>>((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(color: Colors.white),
              ),
            );
          }).toList(),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }

  Widget _buildInfoTile(
    String title,
    String value,
    IconData icon,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: const Color(0xFF4A90E2),
          size: 24,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Text(
          value,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 14,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}