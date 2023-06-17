
import 'dart:async';

import 'package:example/swagger_generated_code/devlesgenies.swagger.dart';

import 'package:chopper/chopper.dart';
void main() async {

  Iterable<dynamic> interceptors= [RequestInter("")];


  final devLesGeneis =  Devlesgenies.create(interceptors: interceptors);


  // final json =   Login(email: "Talha@gmail.com", password: "123123").toJson();
  //
  //   final constractget  = await   devLesGeneis.authenticationLoginPost(data:json);
  //  devLesGeneis.childChildIdPut(data: data, id: id)
  final constractget  = await   devLesGeneis.contractsInscriptionGet();
  print(constractget.body);

 // final petsApi = PetServiceYaml.create();

  // final postResult = await petsApi.petPost(
  //   body: Pet(
  //     name: 'Vovanella',
  //     photoUrls: [
  //       'https://i.ytimg.com/vi/hO6G8jxV-YU/maxresdefault.jpg',
  //       'https://i.ytimg.com/vi/5u3iv8AT8G8/maxresdefault.jpg'
  //     ],
  //     status: PetStatus.available,
  //     category: Category(),
  //   ),
  // );
  //
  // final pet = Pet.fromJson(postResult.body as Map<String, dynamic>);

  //print('Created pet id: ${pet.id}');
}

class RequestInter implements RequestInterceptor {
  final String apiKey;

  RequestInter(this.apiKey);

  @override
  FutureOr<Request> onRequest(Request request) {
    final modifiedRequestData = request.copyWith(
            headers: {...request.headers, 'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3MiOiJhY2Nlc3MiLCJleHAiOjE2ODY3NzIzNTQsImlhdCI6MTY4Njc2ODgxNCwianRpIjoiMmE3ZGI2ODVkYzZmNDZiMjlhNDYyMDlhNTIwYmJlYTUiLCJ1c2VyX2lkIjoyfQ.xLeg525gSB_0Jh9-NwTIJs45qkjTI3a51UDfye0mhMw'},
            // Add or modify other request properties
          );
  return modifiedRequestData;
  }



}