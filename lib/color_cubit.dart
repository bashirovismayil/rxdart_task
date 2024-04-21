import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorCubit extends Cubit<Color> {
  final List<Color> colors = [Colors.blue, Colors.red, Colors.green];

  ColorCubit() : super(Colors.blue);

  void changeColor() {
    int currentIndex = colors.indexOf(state);
    int nextIndex = (currentIndex + 1) % colors.length;
    emit(colors[nextIndex]);
  }
}
