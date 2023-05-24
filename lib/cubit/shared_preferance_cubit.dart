import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../global/dataGlobal.dart';

class SharedPreferanceCubit extends Cubit<String> {
  SharedPreferanceCubit() : super('');
  void SaveText(List<String> datatext) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String text = datatext; //_textController.text;
    List<String> dataForSave = datatext;
    //await prefs.setString(keySharedPreferance, text);
    await prefs.setStringList(keySharedPreferance, dataForSave);
    emit("SomeThing Not Wrong");
  }

  void LoadText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String savedText = prefs.getString(keySharedPreferance) ?? '';
    List<String>? savedText = prefs.getStringList(keySharedPreferance);

    if (savedText != null) {
      print('LoadText1');

      if (savedText.length == 2) {
        print('LoadText2');
        if (savedText[0] == Data.email || savedText[1] == Data.password) {
          emit("SomeThing Not Wr0ng");
          print('LoadText3');
        } else {
          emit("SomeThing Wrong");
        }
      } else {
        print('LoadText5');
        emit("SomeThing Wrong");
      }
    } else {
      print('LoadText6');
      emit("SomeThing Wrong");
    }
    // setState(() {
    //   _textController.text = savedText;
    // });

    // emit(savedText);
  }

  void SaveText_LogOUT() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String text = datatext; //_textController.text;
    List<String> dataForSave = [];
    //await prefs.setString(keySharedPreferance, text);
    await prefs.setStringList(keySharedPreferance, dataForSave);
    print('SaveText_Log');
    emit("SomeThing Wrong");
  }
}
