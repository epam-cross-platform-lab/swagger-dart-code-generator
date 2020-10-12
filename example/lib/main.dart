import 'dart:async';
import 'package:example/generated_code/example_swagger.enums.swagger.dart';
import 'package:example/generated_code/example_swagger.swagger.dart';

Future main() async {
  final client = ExampleSwagger.create();

  final pet = Pet(
      name: 'Boris',
      id: 11,
      photoUrls: [
        'https://i.pinimg.com/originals/de/71/bb/de71bb8a57ff473cc58ebc6af58c4858.jpg'
      ],
      category: Category(id: 1, name: 'Mops'),
      status: PetStatus.available);

  final postResult = await client.addPet(body: pet);

  if (postResult.statusCode != 200) {
    ///Some network error
  }

  final getResult = await client.getPetById(petId: 11);

  if (getResult.statusCode != 200) {
    //Some network error
  }

  print(
      'Hello, my name is ${getResult.body.name}, I am ${getResult.body.category.name}');
}
