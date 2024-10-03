void main() {
  tasks();
}

void tasks() async {
  task1();
  String results = await task2();
  task3(results);
}

void task1() {
  print("task 1");
}

Future<String> task2() async {
  String result = "";
  Duration duration = const Duration(seconds: 3);
  await Future.delayed(duration, () {
    result = "task 2";
    print("task 2");
  });
  return result;
}

void task3(String task2Data) {
  print("task 3 with after $task2Data");
}
