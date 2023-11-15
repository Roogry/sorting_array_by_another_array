import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  final TextEditingController tecBaseArr = TextEditingController(text: '2,3,1,3,2,4,6,7,9,2,19');
  final TextEditingController tecSortByArr = TextEditingController(text: '2,1,4,3,9,6');
  var resultArr = '[]'.obs;

  // Merging two array input
  // @Input arr1 = [2,3,1,3,2,4,6,7,9,2,19], arr2 = [2,1,4,3,9,6]
  // @Output [2,2,2,1,4,3,3,9,6,7,19]
  List<int> sortArrByArr(List<int> baseArr, List<int> sortByArr) {
    List<int> result = [];
    List<int> includedIndexes = [];
    List<int> nonIncludedIndexes = [];

    // make sure sortByArr is unique
    sortByArr = sortByArr.toSet().toList();

    // classified baseArr by sortByArr
    for (final sortBy in sortByArr) {
      for (final (index, baseNum) in baseArr.indexed) {
        if (sortBy == baseNum) {
          includedIndexes.add(index);
        } else {
          nonIncludedIndexes.add(index);
        }
      }
    }

    // combine includedIndexes and nonIncludedIndexes
    includedIndexes.addAll(nonIncludedIndexes);

    // Remove duplicate index
    includedIndexes = includedIndexes.toSet().toList();

    // mapping index to value
    for (final includedIndex in includedIndexes) {
      result.add(baseArr[includedIndex]);
    }

    return result;
  }

  List<int> stringToListInt(String str) {
    return str.replaceAll(' ', '').split(',').map(int.parse).toList();
  }
}