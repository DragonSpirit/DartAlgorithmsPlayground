import "package:test/test.dart";
main() {
 test('check bubble sort', () {
   List<int> data = [5, 1, 2, 3, 5];
   expect(bubbleSort(data), [1, 2, 3, 5, 5]);
 });
}

List<int> bubbleSort(List<int> input) {
 for (var i = 0; i < input.length; i++) {
   for (var j = 0; j < input.length - 1; j++) {
     if (input[j] > input[j+1]) {
        var tmp = input[j];
        input[j] = input[j+1];
        input[j+1] = tmp;
     }
   }
 }
 return input;
}