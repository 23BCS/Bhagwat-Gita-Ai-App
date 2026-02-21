import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import 'package:app/setting_screen.dart';
import 'package:app/verse_detail_screen.dart';
import 'package:app/verse_search_screen.dart';
import 'package:app/services/bhagwat_gita_api.dart';
import 'package:app/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const BhagwatgeetaApp());
}

class BhagwatgeetaApp extends StatelessWidget {
  const BhagwatgeetaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bhagwat Gita AI',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Google Sans',
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFF9800),
          secondary: Color(0xFF4A90E2),
          surface: Color(0xFF1A1A2E),
          background: Color(0xFF0A0A0A),
          error: Color(0xFFE57373),
        ),
        cardTheme: CardThemeData(
          color: const Color(0xFF1A1A2E),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: Colors.orange.withOpacity(0.2),
              width: 1,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF1A1A2E),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.orange.withValues(alpha: 0.2),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.orange.withValues(alpha: 0.2),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xFFFF9800),
            ),
          ),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: -1.5,
          ),
          displayMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
          displaySmall: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 0,
          ),
          headlineMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.25,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            letterSpacing: 0.5,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            letterSpacing: 0.25,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF9800),
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(nextScreen: ChatScreen()),
        '/home': (context) => const HomeScreen(),
        '/verse_search': (context) => const VerseSearchScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A2E),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Bhagwat Gita AI',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () => Navigator.pushNamed(context, '/settings'),
                  ),
                ],
              ),
            ),
            // Main Content
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '🕉️',
                      style: TextStyle(fontSize: 64),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/verse_search'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                      ),
                      child: const Text('Search Verses'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// API Service for Bhagwat Gita
class BhagwatGitaAPI {
  static const String baseUrl = 'https://bhagavadgitaapi.in/slok';

  // Get random verse
  static Future<Map<String, dynamic>> getRandomVerse() async {
    try {
      final random = Random();
      final chapter = random.nextInt(18) + 1;
      final verse = random.nextInt(40) + 1; // Approximate verses per chapter

      final response = await http.get(
        Uri.parse('$baseUrl/$chapter/$verse'),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load verse');
      }
    } catch (e) {
      // Fallback data if API fails
      return _getFallbackVerse();
    }
  }

  // Get verse by chapter and verse number
  static Future<Map<String, dynamic>> getVerse(int chapter, int verse) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/$chapter/$verse'),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load verse');
      }
    } catch (e) {
      return _getFallbackVerse();
    }
  }

  static Map<String, dynamic> _getFallbackVerse() {
    final fallbackVerses = [
      {
        'chapter': 2,
        'verse': 47,
        'slok':
            'कर्मण्येवाधिकारस्ते मा फलेषु कदाचन। मा कर्मफलहेतुर्भूर्मा ते सङ्गोऽस्त्वकर्मणि॥',
        'transliteration':
            'karmaṇy-evādhikāras te mā phaleṣhu kadāchana mā karma-phala-hetur bhūr mā te saṅgo '
                '6stv akarmaṇi',
        'tej': {
          'author': 'Swami Tejomayananda',
          'ht':
              'आपका कर्म करने में अधिकार है, लेकिन कर्म के फल में कभी नहीं। आप कर्मफल के हेतु न बनें और आपकी अकर्म में भी आसक्ति न हो।'
        },
        'siva': {
          'author': 'Swami Sivananda',
          'et':
              'You have a right to perform your prescribed duty, but do not expect the fruits of action. Never consider yourself the cause of the results of your activities, and never be attached to not doing your duty.'
        }
      },
      {
        'chapter': 18,
        'verse': 66,
        'slok':
            'सर्वधर्मान्परित्यज्य मामेकं शरणं व्रज। अहं त्वां सर्वपापेभ्यो मोक्षयिष्यामि मा शुचः॥',
        'transliteration':
            'sarva-dharmān parityajya mām ekaṁ śharaṇaṁ vraja ahaṁ tvāṁ sarva-pāpebhyo mokṣhayiṣhyāmi mā śhuchaḥ',
        'tej': {
          'author': 'Swami Tejomayananda',
          'ht':
              'सभी धर्मों को त्यागकर केवल मेरी शरण में आओ। मैं तुम्हें सभी पापों से मुक्त कर दूँगा, शोक न करो।'
        },
        'siva': {
          'author': 'Swami Sivananda',
          'et':
              'Abandon all varieties of religion and just surrender unto Me. I shall deliver you from all sinful reactions. Do not fear.'
        }
      }
    ];

    final random = Random();
    return fallbackVerses[random.nextInt(fallbackVerses.length)];
  }
}

// AI Response Generator
class GitaAI {
  static final List<String> _spiritualEmojis = [
    '🕉️',
    '📿',
    '🪔',
    '🙏',
    '✨',
    '🌺',
    '🔱',
    '⚡',
    '🌸',
    '🪬',
    '🎭',
    '🏹',
    '🛡️',
    '⭐',
    '🌟',
    '💫',
    '🌙',
    '☀️',
    '🦚',
    '🐚'
  ];

  static final List<String> _responses = [
    "श्रीकृष्ण's divine wisdom speaks to your question: '{wisdom}'",
    "In the Bhagavad Gita, this verse resonates with your query: '{wisdom}'",
    "Your question reminds me of this sacred teaching: '{wisdom}'",
    "The Gita offers this profound insight: '{wisdom}'",
    "Krishna's eternal wisdom addresses this through: '{wisdom}'"
  ];

  static String _getRandomEmoji() {
    return _spiritualEmojis[Random().nextInt(_spiritualEmojis.length)];
  }

  static Future<String> generateResponse(String userMessage) async {
    try {
      // Get a random verse
      final verse = await BhagwatGitaAPI.getRandomVerse();
      final emoji = _getRandomEmoji();

      // Extract wisdom from verse
      String wisdom = verse['siva']?['et'] ??
          verse['tej']?['ht'] ??
          'The path of dharma leads to eternal peace and liberation.';

      // Create base response
      final template = _responses[Random().nextInt(_responses.length)];
      final baseResponse = template.replaceAll('{wisdom}', wisdom);

      // Build full response with proper formatting
      final StringBuffer response = StringBuffer();

      response.writeln('$emoji $baseResponse');
      response.writeln();
      response
          .writeln('📖 Chapter ${verse['chapter']}, Verse ${verse['verse']}');
      response.writeln();

      if (verse['slok'] != null && verse['slok'].isNotEmpty) {
        response.writeln('🕉️ Sanskrit:');
        response.writeln(verse['slok']);
        response.writeln();
      }

      if (verse['transliteration'] != null &&
          verse['transliteration'].isNotEmpty) {
        response.writeln('✨ Transliteration:');
        response.writeln(verse['transliteration']);
        response.writeln();
      }

      if (verse['siva']?['et'] != null) {
        response.writeln('🌸 English Translation:');
        response.writeln(verse['siva']['et']);
        response.writeln();
      }

      if (verse['tej']?['ht'] != null) {
        response.writeln('🪔 Hindi Translation:');
        response.writeln(verse['tej']['ht']);
        response.writeln();
      }

      response.writeln('💫 May this divine wisdom illuminate your path. 🙏');

      return response.toString();
    } catch (e) {
      return '''${_getRandomEmoji()} Namaste! While I'm unable to access the specific verse at this moment, 
remember that the Gita teaches us that wisdom resides within. 
Take a moment to reflect on your question with a peaceful mind. 🙏''';
    }
  }

  static String getWelcomeMessage() {
    return '''🙏 नमस्ते! I'm your Bhagwat Gita AI companion, here to share the timeless wisdom of श्रीकृष्ण and the sacred Bhagavad Gita.

✨ Ask me about:
• Dharma and righteous living 🕉️
• Karma and its effects 📿
• Meditation and spiritual practices 🪔
• Life's purpose and meaning 🌸
• Overcoming challenges 🏹
• Understanding the self 🌺
• Devotion and surrender 💫
• The nature of reality 🔱

How can the eternal wisdom of the Gita guide you today? Feel free to ask any question, and I'll share relevant verses and teachings. 🌟''';
  }

  static List<String> getSuggestedQuestions() {
    return [
      "🕉️ What is the meaning of dharma?",
      "🙏 How to practice true devotion?",
      "⚡ What is the power of karma?",
      "🪔 How to find inner peace?",
      "📿 What is the path to liberation?",
      "✨ How to achieve self-realization?",
      "🌺 What is pure consciousness?",
      "🔱 Explain the three gunas",
      "🌸 How to overcome attachments?",
      "🪬 What is the eternal truth?",
      "🎭 How to transcend ego?",
      "🏹 What is Arjuna's dilemma?",
      "💫 How to overcome maya?",
      "🌟 What is the immortal soul?",
      "🙇‍♂️ How to surrender to Krishna?",
      "🧘‍♀️ Guide me about meditation",
      "⭐ What is true knowledge?",
      "🌊 How to face difficulties?"
    ];
  }
}

class Message {
  final String text;
  final bool isUser;
  final DateTime timestamp;
  final bool isVerse;

  Message({
    required this.text,
    required this.isUser,
    required this.timestamp,
    this.isVerse = false,
  });
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Message> _messages = [];
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _addWelcomeMessage();
  }

  void _addWelcomeMessage() {
    setState(() {
      _messages.add(Message(
        text: GitaAI.getWelcomeMessage(),
        isUser: false,
        timestamp: DateTime.now(),
      ));
    });
  }

  void _sendMessage() async {
    if (_textController.text.trim().isEmpty) return;

    final userMessage = _textController.text.trim();
    setState(() {
      _messages.add(Message(
        text: userMessage,
        isUser: true,
        timestamp: DateTime.now(),
      ));
      _isTyping = true;
    });

    _textController.clear();
    _scrollToBottom();

    try {
      final response = await GitaAI.generateResponse(userMessage);
      if (!mounted) return;

      setState(() {
        _messages.add(Message(
          text: response,
          isUser: false,
          timestamp: DateTime.now(),
          isVerse: true,
        ));
        _isTyping = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _messages.add(Message(
          text:
              "🙏 I apologize for the delay. The divine wisdom flows through patience. Please try again, and may Krishna's teachings guide you.",
          isUser: false,
          timestamp: DateTime.now(),
        ));
        _isTyping = false;
      });
    }

    _scrollToBottom();
  }

  void _sendSuggestedQuestion(String question) {
    _textController.text = question
        .replaceAll(
            RegExp(r'[🕉️📿🙏✨🌺🔱⚡🌸🪬🎭🏹🛡️⭐🌟💫🌙☀️🦚🐚🦁🧘‍♀️🤝🔥]'), '')
        .trim();
    _sendMessage();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(
        child: Stack(
          children: [
            // Background Pattern Layer
            Positioned.fill(
              child: CustomPaint(
                painter: BackgroundPatternPainter(),
              ),
            ),
            // Gradient Overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xFF0A0A0A).withOpacity(0.97),
                      const Color(0xFF1A1A2E).withOpacity(0.95),
                      const Color(0xFF16213E).withOpacity(0.93),
                      const Color(0xFF0F3460).withOpacity(0.97),
                    ],
                  ),
                ),
              ),
            ),
            // Main Content
            Column(
              children: [
                _buildCustomNavBar(),
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    itemCount: _messages.length + (_isTyping ? 1 : 0) + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return _buildSuggestionSection();
                      }
                      index -= 1;
                      if (index == _messages.length && _isTyping) {
                        return _buildTypingIndicator();
                      }
                      return _buildMessageBubble(_messages[index]);
                    },
                  ),
                ),
                _buildInputArea(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF1A1A2E).withOpacity(0.95),
            const Color(0xFF16213E).withOpacity(0.95),
          ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Om Logo with Search
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const VerseSearchScreen(),
                ),
              );
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFF9800),
                    Color(0xFFFF5722),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFF9800).withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  '🕉️',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          // Center Title
          const Text(
            'Bhagwat Gita AI',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          // Action Buttons
          Row(
            children: [
              _buildNavBarButton(
                icon: '📖',
                onTap: () async {
                  try {
                    final verse = await BhagwatGitaAPI.getRandomVerse();
                    if (mounted) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerseDetailScreen(verse: verse),
                        ),
                      );
                    }
                  } catch (e) {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Unable to fetch verse. Please try again later.'),
                          backgroundColor: Color(0xFF1A1A2E),
                        ),
                      );
                    }
                  }
                },
                tooltip: 'Random Verse',
              ),
              const SizedBox(width: 8),
              _buildNavBarButton(
                icon: '⚙️',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(),
                    ),
                  );
                },
                tooltip: 'Settings',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavBarButton({
    required String icon,
    required VoidCallback onTap,
    required String tooltip,
  }) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.1),
              border: Border.all(
                color: Colors.white.withOpacity(0.1),
              ),
            ),
            child: Center(
              child: Text(
                icon,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageBubble(Message message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            message.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isUser) ...[
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFFFF9800).withOpacity(0.9),
                    const Color(0xFFFF5722).withOpacity(0.9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFF9800).withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Center(
                child: Text('🕉️', style: TextStyle(fontSize: 14)),
              ),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                gradient: message.isUser
                    ? LinearGradient(
                        colors: [
                          const Color(0xFF4A90E2).withOpacity(0.9),
                          const Color(0xFF357ABD).withOpacity(0.9),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : LinearGradient(
                        colors: [
                          const Color(0xFF1A1A2E).withOpacity(0.85),
                          const Color(0xFF16213E).withOpacity(0.85),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                  bottomLeft: Radius.circular(message.isUser ? 20 : 4),
                  bottomRight: Radius.circular(message.isUser ? 4 : 20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
                border: Border.all(
                  color: message.isUser
                      ? const Color(0xFF4A90E2).withOpacity(0.3)
                      : Colors.orange.withOpacity(0.3),
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.text,
                    style: TextStyle(
                      color: message.isUser
                          ? Colors.white
                          : Colors.white.withOpacity(0.95),
                      fontSize: 15,
                      height: 1.4,
                    ),
                  ),
                  if (message.isVerse) ...[
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.white.withOpacity(0.1),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Bhagavad Gita Verse',
                      style: TextStyle(
                        color: Colors.orange.shade300,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          if (message.isUser) ...[
            const SizedBox(width: 8),
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF4A90E2).withOpacity(0.9),
                    const Color(0xFF357ABD).withOpacity(0.9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF4A90E2).withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 16,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF1A1A2E).withOpacity(0.95),
            const Color(0xFF16213E).withOpacity(0.95),
          ],
        ),
        border: Border(
          top: BorderSide(color: Colors.orange.withOpacity(0.1), width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A2E),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.orange.withOpacity(0.2)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: _textController,
                style: const TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                  hintText: 'Ask about dharma, karma...',
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 15,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.mic,
                      color: Colors.orange.withOpacity(0.5),
                      size: 20,
                    ),
                    onPressed: () {
                      // TODO: Implement voice input
                    },
                  ),
                ),
                onSubmitted: (_) => _sendMessage(),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFFF9800),
                  Color(0xFFFF5722),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFF9800).withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: _sendMessage,
                child: const Center(
                  child: Icon(Icons.send, color: Colors.white, size: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypingIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFFF9800),
                  Color(0xFFFF5722),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Center(
              child: Text('🕉️', style: TextStyle(fontSize: 10)),
            ),
          ),
          const SizedBox(width: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            constraints: const BoxConstraints(maxWidth: 50),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF1A1A2E).withOpacity(0.8),
                  const Color(0xFF16213E).withOpacity(0.8),
                ],
              ),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.orange.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: const SizedBox(
              width: 24,
              height: 12,
              child: TypingAnimation(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionSection() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              '✨ Explore Sacred Wisdom',
              style: TextStyle(
                color: Colors.orange.shade300,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ),
          Container(
            height: 160, // Fixed height for 2 rows
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: GitaAI.getSuggestedQuestions().take(8).map((question) {
                return ActionChip(
                  label: Text(
                    question,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  backgroundColor: const Color(0xFF1A1A2E),
                  side: BorderSide(
                    color: Colors.orange.withOpacity(0.3),
                  ),
                  shadowColor: Colors.orange.withOpacity(0.1),
                  elevation: 2,
                  pressElevation: 4,
                  onPressed: () => _sendSuggestedQuestion(question),
                );
              }).toList(),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: const Color(0xFF1A1A2E),
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (context) => _buildAllSuggestionsSheet(),
                );
              },
              child: Text(
                'View All Suggestions 🔮',
                style: TextStyle(
                  color: Colors.orange.shade300,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAllSuggestionsSheet() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '🕉️ Sacred Questions',
            style: TextStyle(
              color: Colors.orange.shade300,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Flexible(
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: GitaAI.getSuggestedQuestions().map((question) {
                  return ActionChip(
                    label: Text(
                      question,
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: const Color(0xFF16213E),
                    side: BorderSide(
                      color: Colors.orange.withOpacity(0.3),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      _sendSuggestedQuestion(question);
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TypingAnimation extends StatefulWidget {
  const TypingAnimation({super.key});

  @override
  State<TypingAnimation> createState() => _TypingAnimationState();
}

class _TypingAnimationState extends State<TypingAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return Container(
              width: 4,
              height: 4,
              margin: const EdgeInsets.symmetric(horizontal: 1),
              decoration: BoxDecoration(
                color: Color.lerp(
                  Colors.orange.withOpacity(0.3),
                  Colors.orange,
                  ((_animation.value + index * 0.3) % 1.0),
                ),
                shape: BoxShape.circle,
              ),
            );
          }),
        );
      },
    );
  }
}

class BackgroundPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFF9800).withOpacity(0.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    // Draw Om symbols pattern
    final omSymbolPath = Path();
    const symbolSize = 40.0;
    const spacing = 60.0;

    for (double x = 0; x < size.width + symbolSize; x += spacing) {
      for (double y = 0; y < size.height + symbolSize; y += spacing) {
        // Draw stylized Om symbol
        final centerX = x + symbolSize / 2;
        final centerY = y + symbolSize / 2;

        // Circle
        canvas.drawCircle(
          Offset(centerX, centerY),
          symbolSize / 3,
          paint,
        );

        // Curved line
        final curvePath = Path()
          ..moveTo(centerX - symbolSize / 4, centerY)
          ..quadraticBezierTo(
            centerX,
            centerY - symbolSize / 3,
            centerX + symbolSize / 4,
            centerY,
          );
        canvas.drawPath(curvePath, paint);

        // Dot
        canvas.drawCircle(
          Offset(centerX, centerY - symbolSize / 6),
          2,
          paint..style = PaintingStyle.fill,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
