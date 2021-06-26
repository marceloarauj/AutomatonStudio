import 'package:estudio_automato/components/ToolElement.dart';
import 'package:flutter/material.dart';

class Tools extends StatefulWidget {
  const Tools({Key? key, required this.options, required this.execute}) : super(key: key);

  final List<ToolElement> options;
  final Function execute;

  @override
  _ToolsState createState() => _ToolsState();
}

class _ToolsState extends State<Tools> {
  ScrollController scrollController = ScrollController();

  _scrollUp() {
    scrollController.animateTo(
        scrollController.offset - MediaQuery.of(context).size.width * 0.10,
        curve: Curves.linear,
        duration: Duration(milliseconds: 500));
  }

  _scrollDown() {
    scrollController.animateTo(
        scrollController.offset + MediaQuery.of(context).size.width * 0.10,
        curve: Curves.linear,
        duration: Duration(milliseconds: 500));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Material(
        child: Container(
      color: Colors.white,
      width: width * 0.10,
      child: Column(
        children: [
          Container(
            width: width * 0.10,
            height: height * 0.1,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                  Colors.white,
                  Colors.purple.shade100,
                  Colors.lightBlueAccent.shade700
                ])),
            child: OutlinedButton(
              onPressed: () => {_scrollUp()},
              child: Icon(Icons.keyboard_arrow_up),
            ),
          ),
          Container(
              height: height * 0.6,
              child: ListView(
                controller: scrollController,
                children: widget.options,
              )),
          Container(
              width: width * 0.10,
              height: height * 0.1,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                    Colors.white,
                    Colors.purple.shade100,
                    Colors.lightBlueAccent.shade700
                  ])),
              child: OutlinedButton(
                onPressed: () => {_scrollDown()},
                child: Icon(Icons.keyboard_arrow_down),
              )),
          Container(
              width: width * 0.10,
              height: height * 0.1,
                        decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Colors.white,
                Colors.purple.shade100,
              ])),
              child: OutlinedButton(
                onPressed: () => {widget.execute.call()},
                child: Icon(Icons.double_arrow, color: Colors.green.shade600),
              )),
          Container(
              width: width * 0.10,
              height: height * 0.1,
                        decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Colors.white,
                Colors.purple.shade100,
              ])),
              child: OutlinedButton(
                onPressed: () => {},
                child: Icon(Icons.stop, color: Colors.red.shade400),
              ))
        ],
      ),
    ));
  }
}
