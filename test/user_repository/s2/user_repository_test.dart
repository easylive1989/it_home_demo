import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';

import 'user.dart';
import 'user_repository.dart';

main() {
  test("get user ok from api", () async {
    var stubClient = StubClient(Response("{\"id\":1, \"name\": \"Tom\"}", 200));

    var userRepository = UserRepository.create(stubClient);

    var user = await userRepository.get(1);

    expect(user, const User(id: 1, name: "Tom"));
  });
}

class StubClient implements Client {
  final Response response;

  StubClient(this.response);

  @override
  Future<Response> get(Uri url, {Map<String, String>? headers}) async {
    return response;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {}
}