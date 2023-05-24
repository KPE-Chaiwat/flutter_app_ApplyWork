import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/ChengPage.dart';
import '../../cubit/shared_preferance_cubit.dart';
import '../page1/Page1.dart';

class Page0 extends StatelessWidget {
  const Page0({super.key});

  @override
  Widget build(BuildContext context) {
    return Page1();
  }
}
