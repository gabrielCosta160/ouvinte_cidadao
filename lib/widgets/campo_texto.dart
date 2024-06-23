import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CampoTexto extends StatelessWidget {
  TextEditingController controller;
  String titulo;
  String hint;

  CampoTexto(this.titulo, this.hint, this.controller);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: context.textTheme.titleMedium,
          ),
          TextField(
            controller: controller,
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
      ),
    );
  }
}
