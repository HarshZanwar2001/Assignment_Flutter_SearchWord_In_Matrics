import 'package:flutter/material.dart';

class GridProvider extends ChangeNotifier {
  int _rows = 0;
  int _cols = 0;
  List<List<String>> _grid = [];

  int get rows => _rows;
  int get cols => _cols;
  List<List<String>> get grid => _grid;

  void initializeGrid(int rows, int cols) {
    _rows = rows;
    _cols = cols;
    _grid = List.generate(rows, (_) => List.filled(cols, ''));
    notifyListeners();
  }

  void updateLetter(int row, int col, String value) {
    _grid[row][col] = value;
    notifyListeners();
  }

  void reset() {
    _rows = 0;
    _cols = 0;
    _grid = [];
    notifyListeners();
  }
}
