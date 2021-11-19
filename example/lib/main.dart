import 'package:example/swagger_generated_code/client_index.dart';
import 'package:example/swagger_generated_code/pets_api.swagger.dart';

void main() async {
  final petsApi = PetsApi.create();

  await petsApi.petPost(
    body: Pet(
        name: 'Vovanella', status: PetStatus.available, category: Category()),
  );

  await petsApi.storeOrderPost(
    body: Order(
      complete: false,
    ),
  );
}
