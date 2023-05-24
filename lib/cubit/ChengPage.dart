import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Layout/MainPage.dart';
import '../Layout/page0/Page0.dart';

class ChengePage_Cubit extends Cubit<Widget> {
  /// {@macro brightness_cubit}
  ChengePage_Cubit() : super(Page0());

  /// Toggles the current brightness between light and dark.
  Future<void> changePage(Widget page) async {
    Widget output = page;
    emit(output);
  }
}
