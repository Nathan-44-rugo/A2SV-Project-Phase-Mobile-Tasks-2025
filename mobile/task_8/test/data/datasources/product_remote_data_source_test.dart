import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../lib/features/product/data/datasources/product_remote_datasource.dart';
import '../../../lib/features/product/data/models/product_model.dart';

import '../../mocks.mocks.dart';

void main() {
  late ProductRemoteDataSourceImpl productRemoteDataSource;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    productRemoteDataSource = ProductRemoteDataSourceImpl(client: mockClient);
  });

  group('ProductRemoteDataSourceImpl', () {
    test('should return a list of products when fetchProducts() is called', () async {
      // Arrange
      final productList = [
        const ProductModel(id: '1', name: 'Product 1', description: 'Description 1', price: 10.0, imageUrl: 'url1'),
        const ProductModel(id: '2', name: 'Product 2', description: 'Description 2', price: 20.0, imageUrl: 'url2'),
      ];

      when(mockClient.get(Uri.parse('https://fakestoreapi.com/products')))
          .thenAnswer((_) async => http.Response(jsonEncode(productList.map((e) => e.toJson()).toList()), 200));

      // Act
      final result = await productRemoteDataSource.fetchProducts();

      // Assert
      expect(result, isA<List<ProductModel>>());
      expect(result.length, 2);
    });
  });
}
