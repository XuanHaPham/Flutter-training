import 'package:flutter/material.dart';

class TextWithLine extends StatelessWidget {
  final String text;

  const TextWithLine({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildLine(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            this.text,
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        _buildLine(),
      ],
    );
  }

  Widget _buildLine() {
    return Expanded(
      child: Divider(
        color: Colors.grey[400],
        thickness: 2,
      ),
    );
  }
}
