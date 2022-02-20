import 'package:flutter/material.dart';

class DrawNavigation extends StatelessWidget {
  const DrawNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: <Widget>[
              TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Icon(
                          Icons.home_outlined,
                          size: 18,
                        ),
                      ),
                      const Text(
                        "Home",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  )),
              FlatButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Icon(
                          Icons.messenger_outline_sharp,
                          size: 18,
                        ),
                      ),
                      Text(
                        "Chat",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  )),
              FlatButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Icon(
                          Icons.person_outline,
                          size: 18,
                        ),
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  )),
              FlatButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Icon(
                          Icons.phone_outlined,
                          size: 18,
                        ),
                      ),
                      Text(
                        "Contact us",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
