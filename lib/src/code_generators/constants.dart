const List<String> successResponseCodes = [
  '200',
  '201',
  '202',
];

const List<String> kKeyClasses = [
  'Response',
  'Request',
  'Type',
  'Query',
  'Body',
  'Method',
  'Uri',
];

const kBasicTypes = [
  'string',
  'int',
  'integer',
  'double',
  'float',
  'bool',
  'boolean',
  'num',
  'Object',
  'String',
  kMap,
];

const kBasicSwaggerTypes = [
  ...kBasicTypes,
  'number',
];

const kMap = 'Map';
const kMapStringDynamic = 'Map<String,dynamic>';
const kRequired = 'required';

const kChopperService = 'ChopperService';
const kChopperApi = 'ChopperApi';
const kResponse = 'Response';
const kRequestBody = 'RequestBody';
const kFutureResponse = 'Future<chopper.Response>';
const kString = 'string';
const kInteger = 'integer';
const kInt64 = 'int64';
const kNum = 'num';
const kUndefinedParameter = 'undefinedParameter';

const kIntegerTypes = [kInteger, kInt64, kNum];

const kResponses = '/responses/';

//Request types
const kPath = 'path';
const kOptionalBody = 'optionalBody';
const kFormData = 'formData';
const kMultipart = 'multipart';

const kDefaultBodyParameter = 'Object';
const kField = 'Field';
const kRequestTypeOptions = 'options';
const kAdditionalProperties = 'additionalProperties';

const successDescriptions = ['Success', 'OK', 'default response'];

const kBasicTypesMap = <String, String>{
  'integer': 'int',
  'int': 'int',
  'int32': 'int',
  'int64': 'num',
  'boolean': 'bool',
  'bool': 'bool',
  'string': 'String',
  'file': 'List<int>',
  'number': 'num',
  'object': 'Object',
  'num': 'num',
};

const kObject = 'object';
const kBinary = 'binary';
const kHeader = 'header';
const kCookie = 'cookie';
const kArray = 'array';
const kEnum = 'enum';
const kBody = 'body';
const kPartFile = 'partFile';
const kPart = 'part';

const kDynamic = 'dynamic';

const supportedRequestTypes = ['get', 'post', 'put', 'delete', 'head', 'patch'];

const kEnumNames = 'x-enumNames';
const kEnumVarnames = 'x-enum-varnames';
const kIsNullable = 'x-nullable';
const kNullable = 'nullable';

const kServiceHeader = '''
// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************
  ''';
