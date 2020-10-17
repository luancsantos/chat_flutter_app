import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextComposer extends StatefulWidget {

  TextComposer(this.sendMessage);
  final Function({String text, File imgFile}) sendMessage;

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {

  bool _isComposing = false;
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: () async {
                final File imgFile =await ImagePicker.pickImage(source: ImageSource.camera);
                if(imgFile == null ) return;
                widget.sendMessage(imgFile: imgFile);
              }
          ),
          Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration.collapsed(hintText: 'Enviar uma mensagem'),
                onChanged: (text){
                  setState(() {
                    _isComposing = text.isNotEmpty;
                  });
                },
                onSubmitted: (text){
                  widget.sendMessage(text: text);
                  _controller.clear();
                  _reset();
                },
              ),
          ),
          IconButton(
              icon: Icon(Icons.send),
              onPressed: _isComposing ? (){
                widget.sendMessage(text: _controller.text);
                _controller.clear();
                _reset();
              } : null,
          ),
        ],
      ),
    );
  }

  //metodo para resetar apos submit
  void _reset(){
    setState(() {
      _isComposing = false;
    });
  }
}

