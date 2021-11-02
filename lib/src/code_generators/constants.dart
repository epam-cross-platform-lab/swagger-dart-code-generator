const List<String> successResponseCodes = [
  '200',
  '201',
];

const List<String> kKeyClasses = ['Response', 'Request'];
const kBasicTypes = [
  'string',
  'int',
  'integer',
  'double',
  'float',
  'bool',
  'boolean',
  'num',
];

const kChopperService = 'ChopperService';
const kChopperApi = 'ChopperApi';
const kResponse = 'Response';
const kFutureResponse = 'Future<chopper.Response>';
const kString = 'string';
const kUndefinedParameter = 'undefinedParameter';

const kResponses = '/responses/';

//Request types
const kPath = 'path';
const kOptionalBody = 'optionalBody';
const kFormData = 'formData';

const kDefaultBodyParameter = 'Object';
const kField = 'Field';
const kRequestTypeOptions = 'options';

const successDescriptions = ['Success', 'OK', 'default response'];

const kBasicTypesMap = <String, String>{
  'integer': 'int',
  'int': 'int',
  'int32': 'int',
  'int64': 'int',
  'boolean': 'bool',
  'bool': 'bool',
  'string': 'String',
  'file': 'List<String>',
  'number': 'num',
  'object': 'Object',
};

const kObject = 'object';
const kBinary = 'binary';
const kHeader = 'header';
const kCookie = 'cookie';
const kArray = 'array';
const kEnum = 'enum';
const kBody = 'body';

const kDynamic = 'dynamic';

const supportedRequestTypes = ['get', 'post', 'put', 'delete', 'head', 'patch'];

const kServiceHeader = '''
// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************
  ''';
