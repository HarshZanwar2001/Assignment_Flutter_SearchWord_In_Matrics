import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_game/provider/grid_provider.dart';


class GridInputScreen extends StatelessWidget {
  const GridInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GridProvider>(context);
    final int rows = provider.rows;
    final int cols = provider.cols;

    return Scaffold(
      appBar: AppBar(title: const Text("Enter Alphabets in Grid")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: rows * cols,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cols,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  int row = index ~/ cols;
                  int col = index % cols;
                  return _GridCell(row: row, col: col);
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                bool allFilled = true;
                for (var row in provider.grid) {
                  if (row.contains('') || row.any((c) => c.length != 1)) {
                    allFilled = false;
                    break;
                  }
                }

                if (allFilled) {
                  Navigator.pushNamed(context, '/gridDisplay');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please fill all cells with 1 alphabet each.")),
                  );
                }
              },
              child: const Text("Proceed to Search"),
            ),
          ],
        ),
      ),
    );
  }
}

class _GridCell extends StatelessWidget {
  final int row;
  final int col;
  const _GridCell({required this.row, required this.col});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GridProvider>(context);
    final controller = TextEditingController(text: provider.grid[row][col]);

    return TextField(
      controller: controller,
      maxLength: 1,
      textAlign: TextAlign.center,
      onChanged: (value) {
        if (value.isNotEmpty) {
          provider.updateLetter(row, col, value.toUpperCase());
        }
      },
      decoration: InputDecoration(
        counterText: '',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
