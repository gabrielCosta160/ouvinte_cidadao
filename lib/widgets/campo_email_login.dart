import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouvinte_cidadao/infra/theme.dart';

class CampoEmailLogin extends StatefulWidget {
  TextEditingController controller;
  Function(String)? onChanged;


  CampoEmailLogin(
    this.controller, {
    this.onChanged,
  });

  @override
  _CampoEmailLoginState createState() => _CampoEmailLoginState();
}

class _CampoEmailLoginState extends State<CampoEmailLogin> {
  bool obscureText = true;
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 8),
          child: Text('E-mail',
              style: context.textTheme.bodyMedium!
                  .copyWith(color: Colors.black54, fontWeight: FontWeight.w600)),
        ),
        TextField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            hintText: 'Digite seu e-mail',
            hintStyle:
                context.textTheme.bodySmall!.copyWith(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: verde),
            ),
            border: OutlineInputBorder(),
          ),
          maxLines: 1,
        ),
      ],
    );
  }
}
