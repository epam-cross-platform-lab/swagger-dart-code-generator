import 'package:chopper/chopper.dart';
import 'package:example/swagger_generated_code/pet_service_json.swagger.dart';

class PetServiceJson1 extends PetServiceJson {
  PetServiceJson1([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  Future<Response<dynamic>> petPost({
    required Pet? body,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/pet');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  // TODO: implement definitionType
  Type get definitionType => throw UnimplementedError();
}