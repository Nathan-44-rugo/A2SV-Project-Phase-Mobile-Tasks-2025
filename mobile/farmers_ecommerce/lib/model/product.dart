class Product{
  late String productName;
  late int productPrice;
  late String productCategory;
  late String productDescription;

  Product(String productName, int productPrice, String productCategory, String productDescription){
    this.productName = productName;
    this.productPrice = productPrice;
    this.productCategory = productCategory;
    this.productDescription = productDescription;
  }

  // Retrieve to JSON file
  Product.fromJson(Map<String, dynamic> json){
    productName = json['productName'];
    productPrice = json['productPrice'];
    productCategory = json['productCategory'];
    productDescription = json['productDescription'];
  }

  // Save to JSON file
  Map<String, dynamic> toJson() => {
    'productName': productName,
    'productPrice': productPrice,
    'productCategory': productCategory,
    'productDescription': productDescription,
  };

}

