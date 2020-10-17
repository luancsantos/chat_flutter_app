import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

  ChatMessage(this.data);
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    print(data);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.only(right: 16),
              child: CircleAvatar(
                backgroundImage: NetworkImage(data['senderPhotoUrl']),
              ),
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  data['imgUrl'] != null ?
                      Image.network(data['imgUrl']) :
                  Text(
                    data['text'],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(
                      data['senderName'],
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500
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
