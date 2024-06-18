import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardListagem extends StatelessWidget {
  Widget estrutura;
  Color? color;
  bool isCardStatus;

  CardListagem(this.estrutura, {super.key, this.color, this.isCardStatus = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: context.theme.dialogBackgroundColor,
                borderRadius: BorderRadius.circular(10),
                border: isCardStatus
                    ? Border(
                    left:
                    BorderSide(color: color ?? Colors.blue, width: 10))
                    : null,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: estrutura,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
