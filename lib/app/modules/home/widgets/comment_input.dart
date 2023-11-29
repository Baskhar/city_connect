import 'package:flutter/material.dart';

class CommentInput extends StatefulWidget {
  final Function(String) onCommentAdded;

  const CommentInput({Key? key, required this.onCommentAdded})
      : super(key: key);

  @override
  _CommentInputState createState() => _CommentInputState();
}

class _CommentInputState extends State<CommentInput> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _textEditingController,
            decoration: InputDecoration(
              hintText: 'Digite um comentário...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        IconButton(
          onPressed: () {
            widget.onCommentAdded(_textEditingController.text);
            _textEditingController.clear();
          },
          icon: Icon(Icons.send),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
