import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/controller/base_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BaseController _baseController = Get.put(BaseController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        try {
          _baseController = Get.find<BaseController>();
        } catch (e) {
          _baseController = Get.put(BaseController());
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Sorting Array',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                const Text(
                  'Base Array',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _baseController.tecBaseArr,
                  decoration: const InputDecoration(
                    hintText: '1, 2, 3, 4, 5,...',
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'List Unique Number',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _baseController.tecSortByArr,
                  decoration: const InputDecoration(
                    hintText: '1, 2, 3, 4, 5,...',
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => sortArray(),
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    minimumSize: const Size(double.infinity, 56),
                    shadowColor: Colors.transparent,
                  ),
                  child: const Text("Sort Array"),
                ),
                const SizedBox(height: 16),
                const Text('Result : '),
                Text(
                  _baseController.resultArr.value,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  sortArray() {
    var baseArr = _baseController.stringToListInt(_baseController.tecBaseArr.text);
    var sortByArr = _baseController.stringToListInt(_baseController.tecSortByArr.text);

    _baseController.resultArr.value = _baseController.sortArrByArr(baseArr, sortByArr).toString();
  }
}
