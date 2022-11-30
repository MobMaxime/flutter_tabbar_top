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
    super.initState();
    lstPages.add(PageTabItemModel(
        title: "Tab1", page: const Center(child: Text("Item 1"))));
    lstPages.add(PageTabItemModel(
        title: "Tab2", page: const Center(child: Text("Item 2"))));
    lstPages.add(PageTabItemModel(
        title: "Tab3", page: const Center(child: Text("Item 3"))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sample"),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: TabBarPage(
              controller: _controller,
              pages: lstPages,
              isSwipable: true,
              tabBackgroundColor: Colors.white,
              tabitemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    _controller.onTabTap(index);
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / lstPages.length,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Center(
                          child: Text(
                            lstPages[index].title ?? "",
                            style: TextStyle(
                                fontWeight: _controller.currentIndex == index
                                    ? FontWeight.w700
                                    : FontWeight.w400,
                                color: _controller.currentIndex == index
                                    ? Colors.indigoAccent
                                    : Colors.black26,
                                fontSize: 16),
                          ),
                        ),
                        Container(
                            height: 3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: _controller.currentIndex == index
                                    ? Colors.indigoAccent
                                    : Colors.transparent)),
                      ],
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
