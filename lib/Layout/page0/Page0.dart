import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/ChengPage.dart';
import '../../cubit/shared_preferance_cubit.dart';

class Page0 extends StatelessWidget {
  const Page0({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          context.read<SharedPreferanceCubit>().SaveText_LogOUT();
        },
        child: Container(
          alignment: Alignment.center,
          width: 300,
          height: 60,
          child: Text("push for logout"),
        ),
      ),
    );
  }
}
