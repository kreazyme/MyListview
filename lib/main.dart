import 'package:flutter/material.dart';
import 'package:my_list_view/draw_screen.dart';
import 'package:my_list_view/second_scree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        value: "1",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.value,
  }) : super(key: key);

  final String value;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  List<String> listitem = ["0"];

  void addListItem() {
    setState(() {
      listitem.add((listitem.length + 1).toString());
    });
  }

  void removeLastItem() {
    setState(() {
      listitem.removeLast();
    });
  }

  String goToSecondScreen(context, index) {
    var result = Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => SecondScreen(
            number: listitem[index],
            index: index,
          ),
        ));
    return result.toString();
  }

  @override
  Widget build(BuildContext context) {
    TabController controller = TabController(length: 4, vsync: this);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child:
                IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined)),
          )
        ],
        title: const Text("My Listview Page"),
        bottom: TabBar(
          indicatorColor: Colors.black,
          controller: controller,
          tabs: [
            const Tab(
              icon: Icon(Icons.home_outlined),
              text: "Home",
            ),
            const Tab(
              icon: Icon(Icons.message_outlined),
              text: "Message",
            ),
            const Tab(
              icon: Icon(Icons.person_outline),
              text: "Profile",
            ),
            const Tab(
              icon: Icon(Icons.phone_outlined),
              text: "Contact",
            ),
          ],
        ),
      ),
      drawer: const DrawNavigation(),
      body: ListView.builder(
          itemCount: listitem.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () async {
                  final result =
                      await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SecondScreen(
                                number: listitem[index],
                                index: index,
                              )));
                  List<String> ls = result.toString().split("_");
                  setState(() {
                    int indet = int.parse(ls[1]);
                    listitem[indet] = ls[0];
                  });
                },
                title: Text(listitem[index]),
              ),
            );
          }),
      floatingActionButton: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 32, bottom: 12),
              child: FloatingActionButton(
                onPressed: () {
                  removeLastItem();
                },
                backgroundColor: Colors.red,
                child: const Icon(Icons.remove),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: FloatingActionButton(
                onPressed: () {
                  addListItem();
                },
                child: const Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}