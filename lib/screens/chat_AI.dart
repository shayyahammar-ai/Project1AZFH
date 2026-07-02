
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_azfh/controller/chat_AI_controller.dart';
import 'package:project_azfh/sample/api_service_sample.dart';

class ChatAi extends StatelessWidget {
  // حقن المتحكم
  final ChatController controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/—Pngtree—ai nurse revolutionizing healthcare_20358481.png'),
            ),
            SizedBox(width: 10),
            Text('Chat AI', style: TextStyle(color: Colors.white)),
          ],
        ),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            // Obx تستمع لتحديثات قائمة الرسائل
            child: Obx(() => ListView.builder(
                  reverse: true,
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final message = controller.messages[index];
                    return _buildMessageBubble(message);
                  },
                )),
          ),
          // Obx تستمع لتحديثات حالة التحميل
         Obx(() => controller.chatStatus.value == ControllerStatus.loading
    ? Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircularProgressIndicator(color: Colors.teal),
      )
    : SizedBox.shrink()), // SizedBox.shrink() تعني عدم عرض أي شيء
          _buildMessageInput(),
        ],
      ),
    );
  }

  // تصميم فقاعة الرسالة
  Widget _buildMessageBubble(ChatMessage message) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: message.isUser ? Colors.teal[100] : Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          message.text,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  // تصميم حقل الإدخال
  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller.textController,
              decoration: InputDecoration(
                hintText: 'اشرح ماذا يؤلمك أو الأعراض التي تشعر بها...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.teal),
            onPressed: () => controller.sendMessage(controller.textController.text),
          ),
        ],
      ),
    );
  }
}