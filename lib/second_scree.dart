import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String number;
  final int index;

  const SecondScreen({Key? key, required this.number, required this.index})
      : super(key: key);

  void getBack() {}
  @override
  Widget build(BuildContext context) {
    TextEditingController textcontrol = TextEditingController();
    textcontrol.text = number;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter number"),
        leading: IconButton(
          onPressed: () {
            String text = textcontrol.text;
            Navigator.of(context).pop(text);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: textcontrol,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.red),
                    borderRadius: BorderRadius.circular(15),
                  )),
            ),
            TextButton(
                onPressed: () {
                  String text = textcontrol.text;
                  text += "_" + index.toString();
                  Navigator.of(context).pop(text);
                },
                child: const Text(
                  "Click here",
                  style: TextStyle(fontSize: 16),
                ))
          ],
        ),
      ),
    );
  }
}
