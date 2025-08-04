import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class RoomChatScreen extends StatefulWidget {
  const RoomChatScreen({super.key});

  @override
  State<RoomChatScreen> createState() => _RoomChatScreenState();
}

class _RoomChatScreenState extends State<RoomChatScreen> {
  final TextEditingController _controller = TextEditingController();

  final List<Map<String, dynamic>> messages = [
    {'fromMe': false, 'sender': 'Brooke', 'text': 'Hey Lucas!'},
    {'fromMe': false, 'sender': 'Brooke', 'text': 'How’s your project going?'},
    {'fromMe': true, 'sender': 'Lucas', 'text': 'Hi Brooke!'},
    {'fromMe': true, 'sender': 'Lucas', 'text': 'It’s going well. Thanks for asking!'},
    {'fromMe': false, 'sender': 'Brooke', 'text': 'No worries. Let me know if you need any help 😉'},
  ];

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        messages.add({'fromMe': true, 'sender': 'Lucas', 'text': text});
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Brooke Davis',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.blue, size: 18),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.lightBlueBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.person, size: 20, color: AppColors.lightestblue),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final isMe = msg['fromMe'];
                final sender = msg['sender'] ?? '';

                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    decoration: BoxDecoration(
                      color: isMe ? AppColors.blue : AppColors.lightBlueBg,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(20),
                        topRight: const Radius.circular(20),
                        bottomLeft: Radius.circular(isMe ? 20 : 0),
                        bottomRight: Radius.circular(isMe ? 0 : 20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment:
                          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      children: [
                        Text(
                          sender,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: isMe ? AppColors.lightBlueBg : AppColors.lightGrey,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          msg['text'],
                          style: TextStyle(
                            color: isMe ? Colors.white : Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Input
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.add, color: AppColors.blue),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      hintStyle: const TextStyle(fontFamily: 'Inter'),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      filled: true,
                      fillColor: AppColors.lightBlueBg,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: _sendMessage,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.blue,
                    ),
                    child: const Icon(Icons.send, color: Colors.white, size: 18),
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
