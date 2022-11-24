<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

![Flutter Custom TabBar Page](ic_banner.png)

## Features

- Smooth animations and gestures
- Scrollable tabs
- Fully Customized TabBar Cell
- Highly customizable

## Installation

Add dependency to `pubspec.yaml`
    
```dart
dependencies:
    flutter_tabbar_page : 0.0.1
```
Import the packages

```dart
import 'package:flutter_tabbar_page/flutter_tabbar_page.dart';
```

## Usage

To start using TabBarPage you have to create first page list and create instance of TabPageController.

```dart
List<PageTabItemModel> lstPages = <PageTabItemModel>[];
final TabPageController _controller = TabPageController();

@override
void initState() {
super.initState();
  lstPages.add(PageTabItemModel(title: "Tab1", page: const Center(child: Text("Item 1"))));
  lstPages.add(PageTabItemModel(title: "Tab2", page: const Center(child: Text("Item 2"))));
  lstPages.add(PageTabItemModel(title: "Tab3", page: const Center(child: Text("Item 3"))));
}
```

After that add TabBarPage Widget

```dart
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
                              fontWeight: _controller.currentIndex == index ? FontWeight.w700 : FontWeight.w400,
                              color: _controller.currentIndex == index ? Colors.indigoAccent : Colors.black26,
                              fontSize: 16),
                        ),
                      ),
                      Container(
                          height: 3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: _controller.currentIndex == index ? Colors.indigoAccent : Colors.transparent)),
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
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `pages`      | `List<PageTabItemModel>` | **Required**. List of title and page widgets |
| `tabitemBuilder` | `IndexedWidgetBuilder` | **Required**. Builder for tab widget |
| `controller` | `TabPageController` | **Required**. Get and Update Current Index of Tab |
| `isSwipable` | `bool` | Default : false  |
| `tabHeight` | `double` | Default : 50  |
| `distributeTabEvenly` | `bool` | Default : true, Manages the tab assigning to full width or to left/right by providing `tabAlignment` |
| `tabBackgroundColor` | `Color` | Default : White  |
| `tabAlignment` | `Alignment` | Default :  Alignment.center  |

## Preview

![The example app running in iOS](https://raw.githubusercontent.com/viralp2196/flutter_tabbar_page/master/tab_demo.gif)

## License

[MIT](https://github.com/MobMaxime/flutter_tabbar_top/blob/master/LICENSE.md)
