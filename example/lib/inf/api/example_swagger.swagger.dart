import 'example_swagger.models.swagger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'example_swagger.enums.swagger.dart' as enums;
export 'example_swagger.enums.swagger.dart';
export 'example_swagger.models.swagger.dart';

part 'example_swagger.swagger.g.dart';

@RestApi()
abstract class ExampleSwagger {
  factory ExampleSwagger(Dio dio, {String baseUrl}) = _ExampleSwagger;

  ///Add a new pet to the store
  ///@param body Pet object that needs to be added to the store
  @POST('/pet')
  Future<void> addPet({@Body() required Pet body});

  ///Update an existing pet
  ///@param body Pet object that needs to be added to the store
  @PUT('/pet')
  Future<void> updatePet({@Body() required Pet body});

  ///Finds Pets by status
  ///@param status Status values that need to be considered for filter
  @GET('/pet/findByStatus')
  Future<List<Pet>> findPetsByStatus(
      {@Query('status') required enums.PetFindByStatusGetStatus status});

  ///Finds Pets by tags
  ///@param tags Tags to filter by
  @GET('/pet/findByTags')
  Future<List<Pet>> findPetsByTags({@Query('tags') required List<String> tags});

  ///Find pet by ID
  ///@param petId ID of pet to return
  @GET('/pet/{petId}')
  Future<Pet> getPetById(
      {@Path('petId') required int petId, @Header('api_key') String? apiKey});

  ///Updates a pet in the store with form data
  ///@param petId ID of pet that needs to be updated
  ///@param name Updated name of the pet
  ///@param status Updated status of the pet
  @POST('/pet/{petId}')
  Future<void> updatePetWithForm(
      {@Path('petId') required int petId,
      @Field('name') String? name,
      @Field('status') String? status});

  ///Deletes a pet
  ///@param api_key
  ///@param petId Pet id to delete
  @DELETE('/pet/{petId}')
  Future<void> deletePet(
      {@Header('api_key') String? apiKey, @Path('petId') required int petId});

  ///uploads an image
  ///@param petId ID of pet to update
  ///@param additionalMetadata Additional data to pass to server
  ///@param file file to upload
  @POST('/pet/{petId}/uploadImage')
  Future<ApiResponse> uploadFile(
      {@Path('petId') required int petId,
      @Field('additionalMetadata') String? additionalMetadata,
      @Field('file') List<String>? file});

  ///Returns pet inventories by status
  @GET('/store/inventory')
  Future<Object> getInventory({@Header('api_key') String? apiKey});

  ///Place an order for a pet
  ///@param body order placed for purchasing the pet
  @POST('/store/order')
  Future<Order> placeOrder({@Body() required Order body});

  ///Find purchase order by ID
  ///@param orderId ID of pet that needs to be fetched
  @GET('/store/order/{orderId}')
  Future<Order> getOrderById({@Path('orderId') required int orderId});

  ///Delete purchase order by ID
  ///@param orderId ID of the order that needs to be deleted
  @DELETE('/store/order/{orderId}')
  Future<void> deleteOrder({@Path('orderId') required int orderId});

  ///Create user
  ///@param body Created user object
  @POST('/user')
  Future<void> createUser({@Body() required User body});

  ///Creates list of users with given input array
  ///@param body List of user object
  @POST('/user/createWithArray')
  Future<void> createUsersWithArrayInput({@Body() required List<User> body});

  ///Creates list of users with given input array
  ///@param body List of user object
  @POST('/user/createWithList')
  Future<void> createUsersWithListInput({@Body() required List<User> body});

  ///Logs user into the system
  ///@param username The user name for login
  ///@param password The password for login in clear text
  @GET('/user/login')
  Future<String> loginUser(
      {@Query('username') required String username,
      @Query('password') required String password});

  ///Logs out current logged in user session
  @GET('/user/logout')
  Future<void> logoutUser();

  ///Get user by user name
  ///@param username The name that needs to be fetched. Use user1 for testing.
  @GET('/user/{username}')
  Future<User> getUserByName({@Path('username') required String username});

  ///Updated user
  ///@param username name that need to be updated
  ///@param body Updated user object
  @PUT('/user/{username}')
  Future<void> updateUser(
      {@Path('username') required String username, @Body() required User body});

  ///Delete user
  ///@param username The name that needs to be deleted
  @DELETE('/user/{username}')
  Future<void> deleteUser({@Path('username') required String username});
}

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}
