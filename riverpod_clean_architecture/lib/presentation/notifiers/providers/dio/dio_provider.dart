import 'package:riverpod/riverpod.dart';
import 'package:riverpod_clean_architecture/application/config/network/dio_client.dart';

//RIVERPOD DPROVIDER OF DIO CLIENT (Dependency Injection)
final dioClientProvider = Provider<DioClient>((ref) => DioClient());
