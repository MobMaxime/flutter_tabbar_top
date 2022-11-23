import 'package:flutter/material.dart';
import 'package:flutter_tabbar_page/flutter_tabbar_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PageTabItemModel> lstPages = <PageTabItemModel>[];
  final TabPageController _controller = TabPageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lstPages.add(PageTabItemModel(title: "Tab1", page: Container(color: Colors.deepOrangeAccent)));
    lstPages.add(PageTabItemModel(title: "Tab2", page: Container(color: Colors.indigoAccent)));
    lstPages.add(PageTabItemModel(title: "Tab3", page: Container(color: Colors.tealAccent)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tab Bar"),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 60,
          ),
          Flexible(
            child: TabBarPage(
              controller: _controller,
              pages: lstPages,
              isSwipable: true,
              tabBackgroundColor: Colors.yellow,
              tabitemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    _controller.onTabTap(index);
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / lstPages.length,
                    child: Center(
                      child: Text(
                        lstPages[index].title ?? "",
                        style: TextStyle(
                            color: _controller.currentIndex == index ? Colors.black : Colors.black26, fontSize: 16),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
