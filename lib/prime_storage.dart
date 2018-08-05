import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:collection';


class PrimeStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/primeList.txt');
  }

  Future<File> updatePrimeList(HashSet<int> primeSet) async {
    final file = await _localFile;
    String outputContent = "";
    primeSet.forEach((element) => outputContent = outputContent + element.toString() + ",");
    file.writeAsString(outputContent);
    return file;
  }

  Future<List<String>> readPrimeList() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      List<String> primeList = contents.split(",");
      return primeList;
    } catch (e) {
      print ("Caught exception: " + e);
      return new List<String>();
    }
  }
}