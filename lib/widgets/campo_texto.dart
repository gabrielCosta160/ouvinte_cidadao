import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CampoTexto extends StatelessWidget {
  TextEditingController controller;
  String titulo;
  String hint;
  Function(String)? onChanged;

  CampoTexto(this.titulo, this.hint, this.controller,{this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: context.textTheme.titleMedium,
        ),
        TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            constraints: BoxConstraints(maxHeight: 200),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey),
            labelStyle: TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            border: OutlineInputBorder(),
          ),
          maxLines: null,
        ),
      ],
    );
  }
}
