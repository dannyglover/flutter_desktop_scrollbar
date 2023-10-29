import 'package:desktop_scrollbar/desktop_scrollbar.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: MyHomePage(title: "Test"),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final ScrollController scrollController = ScrollController();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DesktopScrollbar(
        controller: widget.scrollController,
        trackVisibility: true,
        thumbVisibility: true,
        thickness: 10,
        trackColor: Colors.black,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView.builder(
            controller: widget.scrollController,
            addAutomaticKeepAlives: false,
            addRepaintBoundaries: false,
            addSemanticIndexes: false,
            itemCount: 100,
            itemExtent: 35,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text("Row: ${index + 1}"),
              );
            },
          ),
        ),
      ),
    );
  }
}
