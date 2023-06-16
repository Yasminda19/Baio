import 'dart:convert' as convert;
import 'dart:io';

import 'package:baio/constants/exceptions.dart';
import 'package:baio/core/baio.dart';
import 'package:baio/core/in_memory_store.dart';
import 'package:baio/features/authentication/domain/auth.dart';
import 'package:baio/features/authentication/domain/user.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

abstract class AuthRepository {
  Future<Either<BaioClient, BaioException>> authenticate(
      String username, String password);

  Future<void> signOut();

  Future<Either<User, BaioException>> getCurrentUser();
}

class BaioAuthRepository implements AuthRepository {
  final _client = InMemoryStore<BaioClient?>(null);

  Stream<BaioClient?> authStateChanges() => _client.stream;
  BaioClient? get client => _client.value;

  static final loginEndpoint =
      Uri.parse('http://localhost:5000/api/v1/auth/login');

  static final currentUserEndpoint =
      Uri.parse('http://localhost:5000/api/v1/auth');

  @override
  Future<Either<User, BaioException>> getCurrentUser() async {
    if (client == null) {
      return right(const BaioException(
          status: HttpStatus.unauthorized, message: "Client not initialized"));
    }

    try {
      var response = await client!.get(currentUserEndpoint);
      var json = convert.jsonDecode(response.body);

      if (response.statusCode != HttpStatus.ok) {
        var exc = BaioException.fromJson(json);
        return right(exc);
      }

      var res = User.fromJson(json);
      return left(res);
    } finally {
      client!.close();
    }
  }

  @override
  Future<Either<BaioClient, BaioException>> authenticate(
      String username, String password) async {
    var response = await http.post(loginEndpoint,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: convert.jsonEncode({
          "username": username,
          "password": password,
        }));
    var json = convert.jsonDecode(response.body);

    if (response.statusCode != HttpStatus.ok) {
      var exc = BaioException.fromJson(json);
      return right(exc);
    }

    var res = AuthLoginResult.fromJson(json);
    var baioClient = BaioClient(res.accessToken, http.Client());
    _client.value = baioClient;
    return left(baioClient);
  }

  @override
  Future<void> signOut() async {
    _client.value = null;
  }
}

@Riverpod(keepAlive: true)
BaioAuthRepository authRepository(AuthRepositoryRef ref) {
  return BaioAuthRepository();
}

final authStateChangesProvider = StreamProvider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});
