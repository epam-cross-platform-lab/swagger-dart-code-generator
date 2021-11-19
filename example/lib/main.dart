import 'package:example/swagger_generated_code/client_index.dart';
import 'package:example/swagger_generated_code/pets_api.swagger.dart';

void main() async {
  final api = PetsApi.create();

  final items =
      await api.petFindByStatusGet(status: PetFindByStatusGetStatus.available);

  print(items);
}
