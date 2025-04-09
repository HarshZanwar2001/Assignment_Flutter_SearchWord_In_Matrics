import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_game/provider/grid_provider.dart';

class GridDisplayScreen extends StatefulWidget {
  const GridDisplayScreen({super.key});

  @override
  State<GridDisplayScreen> createState() => _GridDisplayScreenState();
}

class _GridDisplayScreenState extends State<GridDisplayScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<List<bool>> highlightMatrix = [];

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<GridProvider>(context, listen: false);
    highlightMatrix =
        List.generate(provider.rows, (_) => List.generate(provider.cols, (_) => false));
  }

  void _resetHighlights() {
    final provider = Provider.of<GridProvider>(context, listen: false);
    setState(() {
      highlightMatrix =
          List.generate(provider.rows, (_) => List.generate(provider.cols, (_) => false));
    });
  }

  void _searchWord() {
    final provider = Provider.of<GridProvider>(context, listen: false);
    final grid = provider.grid;
    final word = _searchController.text.toUpperCase();
    _resetHighlights();

    for (int i = 0; i < provider.rows; i++) {
      for (int j = 0; j < provider.cols; j++) {
        if (_searchFrom(grid, word, i, j, 0, 1)) return; // East
        if (_searchFrom(grid, word, i, j, 1, 0)) return; // South
        if (_searchFrom(grid, word, i, j, 1, 1)) return; // South-East
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Word not found.")),
    );
  }

  bool _searchFrom(List<List<String>> grid, String word, int row, int col, int dr, int dc) {
    int r = row, c = col;
    int rows = grid.length, cols = grid[0].length;

    for (int i = 0; i < word.length; i++) {
      if (r >= rows || c >= cols || grid[r][c] != word[i]) return false;
      r += dr;
      c += dc;
    }

    // If found, highlight
    r = row;
    c = col;
    for (int i = 0; i < word.length; i++) {
      highlightMatrix[r][c] = true;
      r += dr;
      c += dc;
    }

    setState(() {});
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GridProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search in Grid"),
        actions: [
          IconButton(
            icon: const Icon(Icons.restart_alt),
            onPressed: () {
              provider.reset();
              Navigator.pushNamedAndRemoveUntil(context, '/input', (route) => false);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Enter word to search",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _searchWord,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: provider.rows * provider.cols,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: provider.cols,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                ),
                itemBuilder: (context, index) {
                  int row = index ~/ provider.cols;
                  int col = index % provider.cols;
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: highlightMatrix[row][col] ? Colors.greenAccent : Colors.white,
                    ),
                    child: Text(
                      provider.grid[row][col],
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
