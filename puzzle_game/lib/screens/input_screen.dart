import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_game/provider/grid_provider.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController _rowsController = TextEditingController();
  final TextEditingController _colsController = TextEditingController();

  void _proceed() {
    final int? rows = int.tryParse(_rowsController.text.trim());
    final int? cols = int.tryParse(_colsController.text.trim());

    if (rows == null || cols == null || rows <= 0 || cols <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter valid positive numbers.")),
      );
      return;
    }

    // Update state in Provider
    Provider.of<GridProvider>(context, listen: false).initializeGrid(rows, cols);

    Navigator.pushNamed(context, '/gridInput');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Enter Grid Size")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _rowsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Enter number of rows (m)"),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _colsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Enter number of columns (n)"),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _proceed,
              child: const Text("Proceed to Grid Input"),
            ),
          ],
        ),
      ),
    );
  }
}
