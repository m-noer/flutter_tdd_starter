import 'package:flutter/material.dart';
import 'package:flutter_tdd_starter/core/widgets/empty.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VarX'),
      ),
      body: const SafeArea(
        child: Empty(),
      ),
    );
  }
}
