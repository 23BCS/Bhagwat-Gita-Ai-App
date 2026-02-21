import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerseDetailScreen extends StatefulWidget {
  final Map<String, dynamic> verse;
  
  const VerseDetailScreen({super.key, required this.verse});

  @override
  State<VerseDetailScreen> createState() => _VerseDetailScreenState();
}

class _VerseDetailScreenState extends State<VerseDetailScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  bool _showTranslation = true;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
    );
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 8),
            Text('Copied to clipboard! 📿'),
          ],
        ),
        backgroundColor: const Color(0xFF1A1A2E),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _shareVerse() {
    final verseText = '''
🕉️ Bhagavad Gita - Chapter ${widget.verse['chapter']}, Verse ${widget.verse['verse']}

Sanskrit:
${widget.verse['slok'] ?? ''}

Transliteration:
${widget.verse['transliteration'] ?? ''}

Meaning:
${widget.verse['siva']?['et'] ?? widget.verse['tej']?['ht'] ?? ''}

Shared from Bhagwat Gita AI 📿
    ''';
    
    // In a real app, you would use share_plus package
    _copyToClipboard(verseText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
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
        child: CustomScrollView(
          slivers: [
            _buildAppBar(),
            SliverToBoxAdapter(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildChapterInfo(),
                      const SizedBox(height: 30),
                      _buildSanskritVerse(),
                      const SizedBox(height: 30),
                      _buildTransliteration(),
                      const SizedBox(height: 30),
                      _buildTranslationToggle(),
                      const SizedBox(height: 20),
                      if (_showTranslation) _buildTranslations(),
                      const SizedBox(height: 30),
                      _buildActionButtons(),
                      const SizedBox(height: 30),
                      _buildSpritualInsight(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 200,
      floating: false,
      pinned: true,
      backgroundColor: const Color(0xFF1A1A2E),
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          'Sacred Verse 🪔',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF1A1A2E),
                Color(0xFF16213E),
                Color(0xFF0F3460),
              ],
            ),
          ),
          child: Stack(
            children: [
              // Background pattern
              Positioned.fill(
                child: Opacity(
                  opacity: 0.1,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/mandala_pattern.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const Center(
                child: Text(
                  '🕉️',
                  style: TextStyle(
                    fontSize: 80,
                    color: Colors.orange,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.share, color: Colors.orange),
          onPressed: _shareVerse,
        ),
        IconButton(
          icon: const Icon(Icons.favorite_border, color: Colors.orange),
          onPressed: () {
            // Add to favorites functionality
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Added to favorites! ❤️')),
            );
          },
        ),
      ],
    );
  }

  Widget _buildChapterInfo() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF1A1A2E),
            Color(0xFF16213E),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.orange.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFF9800), Color(0xFFFF5722)],
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFF9800).withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Text(
                '${widget.verse['chapter']}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chapter ${widget.verse['chapter']}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Verse ${widget.verse['verse']} 📿',
                  style: TextStyle(
                    color: Colors.orange.shade300,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSanskritVerse() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF1A1A2E).withOpacity(0.8),
            const Color(0xFF16213E).withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.orange.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('🕉️', style: TextStyle(fontSize: 24)),
              const SizedBox(width: 12),
              const Text(
                'Sanskrit Verse',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.copy, color: Colors.orange, size: 20),
                onPressed: () => _copyToClipboard(widget.verse['slok'] ?? ''),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            widget.verse['slok'] ?? 'Sanskrit text not available',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              height: 1.8,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTransliteration() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF16213E).withOpacity(0.6),
            const Color(0xFF0F3460).withOpacity(0.6),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('🌸', style: TextStyle(fontSize: 20)),
              const SizedBox(width: 8),
              const Text(
                'Transliteration',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.copy, color: Colors.blue, size: 18),
                onPressed: () => _copyToClipboard(widget.verse['transliteration'] ?? ''),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            widget.verse['transliteration'] ?? 'Transliteration not available',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              height: 1.6,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTranslationToggle() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SwitchListTile(
        title: const Text(
          'Show Translations',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        subtitle: const Text(
          'Toggle between different commentaries',
          style: TextStyle(color: Colors.white70, fontSize: 12),
        ),
        value: _showTranslation,
        onChanged: (value) {
          setState(() {
            _showTranslation = value;
          });
        },
        activeColor: Colors.orange,
        secondary: const Text('📖', style: TextStyle(fontSize: 24)),
      ),
    );
  }

  Widget _buildTranslations() {
    return Column(
      children: [
        if (widget.verse['siva']?['et'] != null) _buildTranslationCard(
          '🧘‍♀️ Swami Sivananda',
          widget.verse['siva']['et'],
          Colors.purple,
        ),
        if (widget.verse['tej']?['ht'] != null) const SizedBox(height: 20),
        if (widget.verse['tej']?['ht'] != null) _buildTranslationCard(
          '🕉️ स्वामी तेजोमयानन्द',
          widget.verse['tej']['ht'],
          Colors.green,
        ),
      ],
    );
  }

  Widget _buildTranslationCard(String author, String meaning, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.1),
            color.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            author,
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            meaning,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.copy, color: color, size: 20),
              onPressed: () => _copyToClipboard(meaning),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              // Navigate to meditation/reflection mode
            },
            icon: const Text('🧘‍♀️', style: TextStyle(fontSize: 20)),
            label: const Text('Meditate'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF673AB7),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              // Ask AI about this verse
              Navigator.pop(context, 'Ask about this verse: Chapter ${widget.verse['chapter']}, Verse ${widget.verse['verse']}');
            },
            icon: const Text('🤖', style: TextStyle(fontSize: 20)),
            label: const Text('Ask AI'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF9800),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSpritualInsight() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF1A1A2E),
            Color(0xFF16213E),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.orange.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text('✨', style: TextStyle(fontSize: 24)),
              SizedBox(width: 12),
              Text(
                'Spiritual Insight',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'This verse teaches us about the fundamental principle of karma yoga - performing our duties without attachment to results. It emphasizes the importance of action while surrendering the outcomes to the divine will.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: [
                Text('💡', style: TextStyle(fontSize: 20)),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Reflect on how you can apply this wisdom in your daily life',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}