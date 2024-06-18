import 'package:gopher_eye/model/list_view.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.cyan[300],
        shadowColor: Colors.black, toolbarHeight: 80,
        elevation: 3,
        title: const SafeArea(
          minimum: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: Text(
            "Preview Results",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_horiz_outlined))
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 0.0),
        child: Expanded(child: DiagnosisListView()),
      ),
    );
  }
}
