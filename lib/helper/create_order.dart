import '../model/order.dart';

//products
List<Product> getProduct(List<Order> orders) {
  List<Product> products = [];
  for (var order in orders) {
    var product = products.firstWhere(
      (p) => p.name == order.product,
      orElse: () {
        var product = Product(order.product);
        products.add(product);
        return product;
      },
    );

    product.orders!.add(order);
  }
  return products;
}

List<AverageQuantity> getAverageProducts(List<Product> products) {
  List<AverageQuantity> averageQuantities = products.map((product) {
    var totalQuantity =
        product.orders!.map((order) => order.quantity).reduce((a, b) => a + b);

    var averageQuantity = totalQuantity / product.orders!.length;
    return AverageQuantity(product.name, averageQuantity);
  }).toList();
  return averageQuantities;
}

List<MostPopularBrand> getPopularBrand(List<Product> products) {
  List<MostPopularBrand> mostPopularBrands = products.map((product) {
    var brandCounts = <String, int>{};
    for (var order in product.orders!) {
      brandCounts[order.brand] = (brandCounts[order.brand] ?? 0) + 1;
    }
    String mostPopularBrand = brandCounts.keys
        .reduce((a, b) => brandCounts[a]! > brandCounts[b]! ? a : b);
    return MostPopularBrand(product.name, mostPopularBrand);
  }).toList();
  return mostPopularBrands;
}
