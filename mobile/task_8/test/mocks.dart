import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

import '../lib/features/product/data/datasources/product_remote_datasource.dart';

// Add this annotation to generate the mock
@GenerateMocks([ProductRemoteDataSource, http.Client])
void main() {}
