import 'dart:io';
import 'package:csv/csv.dart';
import 'package:tes1/helper/create_order.dart';
import 'package:tes1/model/order.dart';

void main() {
  var inputFileName = stdin.readLineSync()!.trim();
  var inputCsv = File(inputFileName).readAsStringSync();
  var inputRows = const CsvToListConverter().convert(inputCsv);
  List<Order> orders = inputRows
      .map((row) => Order((row[0]), row[1], row[2], row[3], row[4]))
      .toList();

  ///step1
  List<Product> products = getProduct(orders);

  //step2
  List<AverageQuantity> averageQuantities = getAverageProducts(products);
  List<MostPopularBrand> mostPopularBrands = getPopularBrand(products);

  var outputCsv1 = <List<dynamic>>[];
  var outputCsv2 = <List<dynamic>>[];
  var outputFileO = File('O_$inputFileName');
  var outputFile1 = File('1_$inputFileName');
  for (var averageQuantity in averageQuantities) {
    outputCsv1.add([
      averageQuantity.product,
      averageQuantity.averageQuantity.toStringAsFixed(3)
    ]);
  }
  for (var popularBrand in mostPopularBrands) {
    outputCsv2.add([popularBrand.product, popularBrand.mostPopularBrand]);
  }
  outputCsv2.add(mostPopularBrands);
  var outputO = const ListToCsvConverter().convert(outputCsv1);
  var output1 = const ListToCsvConverter().convert(outputCsv2);
//step3
  outputFileO.writeAsStringSync(outputO);
  outputFile1.writeAsStringSync(output1);
}
