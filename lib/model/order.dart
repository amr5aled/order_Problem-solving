class Order {
  String id;
  String area;
  String product;
  int quantity;
  String brand;

  Order(this.id, this.area, this.product, this.quantity, this.brand);
}

class Product {
  String name;
  List<Order>? orders;

  Product(this.name) {
    orders = [];
  }
}

class AverageQuantity {
  String product;
  double averageQuantity;

  AverageQuantity(this.product, this.averageQuantity);
}

class MostPopularBrand {
  String product;
  String mostPopularBrand;

  MostPopularBrand(this.product, this.mostPopularBrand);
}
