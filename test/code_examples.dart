const String ref = '\$ref';
const String model_with_parameters_v3 = '''
{
 "components": {
    "schemas": {
      "SomeEnumModel" : {
        "enum" : ["one", "two"]
      },
      "trickPlayControl": {
      "type": "array",
      "items": {
        "type": "string",
        "enum": [
          "disallowFastForward",
          "disallowPause",
          "disallowPlay",
          "disallowRewind",
          "disallowSkipForward",
          "disallowSkipBackward",
          "adRestrictionOnly"
        ]
      }
    },
      "AuthorizationDetails": {
        "type": "object",
        "properties": {
          "state": {
            "type": "string",
            "format": "uuid",
            "description": "Opaque value generated. The state will be echoed back in the token response, therefore state needs to be maintained between the request and the response.",
            "example": "00001-00002-00003-00004"
          },
          "authorizationUri": {
            "type": "string",
            "format": "uri",
            "description": "URI to follow for authorization",
            "example": "https://sso.service.some.country/oidc/authorize?response_type=code&state=00001-00002-00003-00004&nonce=54345345-345345345-345345345-435345&client_id=some-client-id&redirect_uri=https%3A%2F%2Fsome-success-uri.com%2Fen_gb%2Flogin_success"
          },
          "enumValue": {
            "type": "enum",
            "enum": ["one", "two"]
          },
          "redirectUri": {
            "type": "string",
            "format": "uri",
            "description": "Redirect URI used after successful authentication",
            "example": "https%3A%2F%2Fsome-success-uri.com%2Fen_gb%2Flogin_success"
          },
          "logoutUri": {
            "type": "string",
            "format": "uri",
            "description": "URI to follow to logout"
          },
          "validityToken": {
            "type": "string",
            "description": "The validity token will contain the payload of the generated nonce and state value.",
            "example": ""
          }
        }
      },
      "CompleteAuthorizationRequest": {
        "type": "object",
        "properties": {
          "code": {
            "type": "string",
            "description": "Code value obtained for SSO authorization service"
          },
          "state": {
            "type": "string",
            "format": "uuid",
            "description": "State value obtained previously",
            "example": "00001-00002-00003-00004"
          },
          "validityToken": {
            "type": "string",
            "description": "The validity token obtained previously",
            "example": ""
          }
        }
      },
      "TokensResponse": {
        "type": "object",
        "properties": {
          "token_type": {
            "type": "string",
            "enum": [
              "bearer"
            ]
          },
          "access_token": {
            "$ref": "#/components/schemas/SvcAccessToken"
          },
          "refresh_token": {
            "$ref": "#/components/schemas/SvcRefreshToken"
          },
          "expires_in": {
            "type": "integer",
            "description": "access token expiration in seconds"
          },
          "username": {
            "type": "string",
            "description": "username of authenticated client"
          },
          "givenName": {
            "type": "string",
            "description": "first name"
          },
          "familyName": {
            "type": "string",
            "description": "family name"
          }
        }
      },
      "RefreshAuthorizationRequest": {
        "type": "object",
        "properties": {
          "svcRefreshToken": {
            "$ref": "#/components/schemas/SvcRefreshToken"
          }
        }
      },
      "DeleteAuthorizationRequest": {
        "type": "object",
        "properties": {
          "svcRefreshToken": {
            "$ref": "#/components/schemas/SvcRefreshToken"
          }
        }
      },
      "SvcRefreshToken": {
        "type": "string",
        "description": "Valid service refresh token"
      },
      "SvcAccessToken": {
        "type": "string",
        "description": "jwt service access token used as ACCESS_TOKEN with calls to services"
      }
    }
  }
}
''';

const String model_with_parameters_v2 = '''
{
  "definitions": {
    "trickPlayControl": {
      "type": "array",
      "items": {
        "type": "string",
        "enum": [
          "disallowFastForward",
          "disallowPause",
          "disallowPlay",
          "disallowRewind",
          "disallowSkipForward",
          "disallowSkipBackward",
          "adRestrictionOnly"
        ]
      }
    },
    "ActiveOrderAndListSummary": {
      "type": "object",
      "required": [
        "closingTime",
        "id",
        "shoppingType",
        "slotReservationHours",
        "state"
      ],
      "properties": {
        "closingTime": {
          "type": "string",
          "format": "date-time"
        },
        "deliveryDate": {
          "originalRef": "DeliveryDto",
          "\$ref": "#/definitions/DeliveryDto"
        },
        "id": {
          "type": "integer",
          "format": "int64"
        },
        "lastSyncedDate": {
          "type": "string",
          "format": "date-time"
        },
        "enumValue": {
            "type": "enum",
            "enum": ["one", "two"]
          },
        "orderLastChangedTime": {
          "type": "string",
          "format": "date-time"
        },
        "orderedProducts": {
          "type": "array",
          "items": {
            "originalRef": "OrderedProductCard",
            "\$ref": "#/definitions/OrderedProductCard"
          }
        },
        "price": {
          "originalRef": "PriceDto",
          "\$ref": "#/definitions/PriceDto"
        },
        "shoppingListItems": {
          "type": "array",
          "items": {
            "originalRef": "Item",
            "\$ref": "#/definitions/Item"
          }
        },
        "shoppingType": {
          "type": "string",
          "enum": [
            "UNKNOWN",
            "PHYSICAL_STORE",
            "DELIVERY",
            "PICKUP_DELIVERY",
            "DELIVERY_POINT",
            "PICKUP",
            "IN_STORE_PICK",
            "SPECIALS_ONLY"
          ]
        },
        "slotReservationHours": {
          "type": "number",
          "format": "double"
        },
        "state": {
          "type": "string",
          "enum": [
            "CONFIRMED",
            "REOPENED",
            "IN_PREPARATION",
            "UNCONFIRMED",
            "DELIVERED",
            "CANCELLED",
            "PLANNED_FOR_DELIVERY",
            "OUT_FOR_DELIVERY",
            "UNKNOWN"
          ]
        }
      },
      "title": "ActiveOrderAndListSummary"
    }
  }
}
''';

const String request_with_header = '''
{
  "paths": {
    "/v2/order/summaries": {
      "get": {
        "tags": [
          "appie-order-controller-v-2"
        ],
        "summary": "Get order summaries",
        "operationId": "retrieveOrderSummariesUsingGET",
        "produces": [
          "*/*"
        ],
        "parameters": [
          {
            "name": "x-application",
            "in": "header",
            "description": "x-application",
            "required": true,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "schema": {
              "type": "array",
              "items": {
                "originalRef": "OrderSummary",
                "\$ref": "#/definitions/OrderSummary"
              }
            }
          },
          "401": {
            "description": "Unauthorized"
          },
          "403": {
            "description": "Forbidden"
          },
          "404": {
            "description": "Not Found"
          }
        },
        "security": [
          {
            "apiKey": []
          }
        ],
        "deprecated": false
      }
    }
  }
}
''';

const String request_with_enum_in_parameter = '''
{
  "paths": {
    "/v3/order/{orderId}/state": {
      "put": {
        "tags": [
          "appie-order-controller-v-3"
        ],
        "summary": "Update state of an order.",
        "operationId": "changeOrderStateUsingPUT",
        "consumes": [
          "application/json"
        ],
        "produces": [
          "*/*"
        ],
        "parameters": [
          {
            "name": "orderId",
            "in": "path",
            "description": "Id of the order",
            "required": false,
            "type": "integer",
            "format": "int64"
          },
          {
            "in": "body",
            "name": "orderStateRequest",
            "description": "Order state",
            "required": false,
            "schema": {
              "type": "string",
              "enum": [
                "SUBMITTED",
                "CANCELLED",
                "REOPENED",
                "RESET"
              ]
            }
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "schema": {
              "type": "object"
            }
          },
          "201": {
            "description": "Created"
          },
          "401": {
            "description": "Unauthorized"
          },
          "403": {
            "description": "Forbidden"
          },
          "404": {
            "description": "Not Found"
          }
        },
        "security": [
          {
            "apiKey": []
          }
        ],
        "deprecated": false
      }
    }
  }
}
''';

const String request_with_list_of_enum_in_parameter = '''
{
  "paths": {
    "/v3/order/{orderId}/state": {
      "put": {
        "tags": [
          "appie-order-controller-v-3"
        ],
        "summary": "Update state of an order.",
        "operationId": "changeOrderStateUsingPUT",
        "consumes": [
          "application/json"
        ],
        "produces": [
          "*/*"
        ],
        "parameters": [
          {
            "name": "orderId",
            "in": "path",
            "description": "Id of the order",
            "required": false,
            "type": "integer",
            "format": "int64"
          },
          {
            "in": "body",
            "name": "orderStateRequest",
            "description": "Order state",
            "required": false,
            "items": {
              "type": "string",
              "enum": [
                "SUBMITTED",
                "CANCELLED",
                "REOPENED",
                "RESET"
              ]
            }
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "schema": {
              "type": "object"
            }
          },
          "201": {
            "description": "Created"
          },
          "401": {
            "description": "Unauthorized"
          },
          "403": {
            "description": "Forbidden"
          },
          "404": {
            "description": "Not Found"
          }
        },
        "security": [
          {
            "apiKey": []
          }
        ],
        "deprecated": false
      }
    }
  }
}
''';

const String request_with_array_string = '''
{
  "paths": {
    "/v1/{pboSortType}": {
      "get": {
        "tags": [
          "purchase-controller"
        ],
        "summary": "getPreviousPurchases",
        "operationId": "getPreviousPurchasesUsingGET",
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "name": "applications",
            "in": "query",
            "description": "applications",
            "required": false,
            "type": "array",
            "items": {
              "type": "string"
            },
            "collectionFormat": "multi"
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "schema": {
              "originalRef": "PagedResponseOfProductCard",
              "\$ref": "#/definitions/PagedResponseOfProductCard"
            }
          }
        }
      }
    }
  },
  "securityDefinitions": {
    "apiKey": {
      "type": "apiKey",
      "name": "x-authorization",
      "in": "header"
    }
  }
}
''';

const String request_with_array_order_summary = '''
{
  "paths": {
    "/v2/order/summaries": {
      "get": {
        "tags": [
          "appie-order-controller-v-2"
        ],
        "summary": "Get order summaries",
        "operationId": "retrieveOrderSummariesUsingGET",
        "produces": [
          "*/*"
        ],
        "parameters": [
          {
            "name": "x-application",
            "in": "header",
            "description": "x-application",
            "required": true,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "schema": {
              "type": "array",
              "items": {
                "originalRef": "OrderSummary",
                "\$ref": "#/definitions/OrderSummary"
              }
            }
          },
          "401": {
            "description": "Unauthorized"
          },
          "403": {
            "description": "Forbidden"
          },
          "404": {
            "description": "Not Found"
          }
        },
        "security": [
          {
            "apiKey": []
          }
        ],
        "deprecated": false
      }
    }
  }
}
''';

const String request_with_list_string_return_type = '''
{
  "paths": {
    "/v1/suggestions": {
      "get": {
        "tags": [
          "search-controller-v-1"
        ],
        "summary": "product-search-suggestions",
        "description": "Search suggestions",
        "operationId": "findSuggestionsUsingGET",
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "name": "amount",
            "in": "query",
            "description": "Amount of suggestions",
            "required": true,
            "type": "integer",
            "default": 10,
            "format": "int32",
            "allowEmptyValue": false
          },
          {
            "name": "query",
            "in": "query",
            "description": "Term to find suggestions for",
            "required": true,
            "type": "string",
            "allowEmptyValue": false
          },
          {
            "name": "x-application",
            "in": "header",
            "description": "x-application",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "schema": {
              "type": "array",
              "items": {
                "type": "string"
              }
            }
          },
          "401": {
            "description": "Unauthorized"
          },
          "403": {
            "description": "Forbidden"
          },
          "404": {
            "description": "Not Found"
          }
        },
        "security": [
          {
            "apiKey": []
          }
        ],
        "deprecated": false
      }
    }
  }
}
''';

const String schemas_responses_with_response = '''
{
  "openapi": "3.0.1",
  "info": {
    "title": "Some service",
    "version": "1.0"
  },
  "components": {
    "responses": {
      "SpaResponse": {
        "description": "Success",
        "content": {
          "application/json": {
            "schema": {
              "required": [
                "showPageAvailable"
              ],
              "properties": {
                "id": {
                  "type": "string",
                  "description": "Some description"
                },
                "showPageAvailable": {
                  "type": "boolean",
                  "description": "Flag indicating showPage availability"
                }
              }
            }
          }
        }
      }
    }
  }
}
''';

const String schemas_responses_with_response_and_schemas = '''
{
  "openapi": "3.0.1",
  "info": {
    "title": "Some service",
    "version": "1.0"
  },
  "components": {
    "responses": {
      "SpaResponse": {
        "description": "Success",
        "content": {
          "application/json": {
            "schema": {
              "required": [
                "showPageAvailable"
              ],
              "properties": {
                "id": {
                  "type": "string",
                  "description": "Some description"
                },
                "showPageAvailable": {
                  "type": "boolean",
                  "description": "Flag indicating showPage availability"
                }
              }
            }
          }
        }
      }
    },
    "schemas": {
      "SpaSchema": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "description": "Some description"
          },
          "showPageAvailable": {
            "type": "boolean",
            "description": "Flag indicating showPage availability"
          }
        }
      }
    }
  }
}
''';

const String enum_as_definition_v2 = '''
{
  "openapi": "2.0.1",
  "definitions": {
      "SpaResponse": {
        "description": "Success",
        "enum": [
          "one",
          "two"
        ]
    }
  }
}
''';

const String schemas_with_enums_in_properties = '''
{
  "openapi": "3.0.1",
  "info": {
    "title": "Some service",
    "version": "1.0"
  },
  "components": {
    "schemas": {
      "SpaSchema": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "description": "Some description"
          },
          "showPageAvailable": {
            "type": "boolean",
            "description": "Flag indicating showPage availability"
          },
          "successValues": {
            "items": {
              "enum": [
                "one, two"
              ]
            }
          }
        }
      }
    },
    "responses": {
      "SpaResponse": {
        "description": "Success",
        "content": {
          "application/json": {
            "schema": {
              "enum": [
                "one",
                "two"
              ]
            }
          }
        }
      },
      "SpaEnumResponse": {
        "description": "Success",
        "content": {
          "application/json": {
            "schema": {
              "properties": {
                "failedValued": {
                  "items": {
                    "enum": [
                      "one",
                      "two"
                    ]
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
''';

const String request_with_return_type_injected = '''
{
  "paths": {
    "/model/items": {
      "get": {
        "summary": "Some test request",
        "operationId": "getModelItems",
        "parameters": [
          {
            "name": "testName",
            "in": "query",
            "description": "test name",
            "required": false,
            "type": "array",
            "items": {
              "type": "string"
            },
            "collectionFormat": "multi"
          }
        ],
        "responses": {
          "200": {
            "schema": {
              "type": "object",
              "properties": {
                "id": {
                  "type": "integer",
                  "format": "int64"
                },
                "petId": {
                  "type": "integer",
                  "format": "int64"
                }
              }
            }
          }
        }
      }
    }
  }
}
''';

const String request_with_ref_response = '''
{
  "components": {
    "schemes": {
      "MyCoolDefinition": {
        "type": "object",
        "properties": {
          "startTime": {
            "type": "string",
            "format": "date"
          },
          "endTime": {
            "type": "string",
            "format": "date"
          },
          "imageUrl": {
            "type": "string"
          }
        },
        "title": "MyCoolDefinition"
      }
    },
    "responses": {
      "SpaSingleResponse": {
        "description": "Success",
        "content": {
          "application/json": {
            "schema": {
              "enum": [
                "one",
                "two"
              ]
            }
          }
        }
      },
      "SpaResponse": {
        "description": "Success",
        "content": {
          "application/json(1)": {
            "schema": {
              "enum": [
                "one",
                "two"
              ]
            }
          },
          "application/json(2)": {
            "schema": {
              "enum": [
                "one",
                "two"
              ]
            }
          }
        }
      }
    }
  },
  "paths": {
    "/model/items": {
      "get": {
        "summary": "Some test request",
        "operationId": "someOperationId",
        "parameters": [
          {
            "name": "headerParameter",
            "in": "header",
            "required": true,
            "type": "string"
          }
        ],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "type": "array",
                "items": {
                  "\$ref": "#/components/responses/SpaResponse"
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "OK",
            "\$ref": "#/responses/SpaResponse"
          }
        }
      }
    }
  }
}
''';



const String request_with_array_item_summary = '''
{
  "paths": {
    "/model/items": {
      "get": {
        "summary": "Some test request",
        "operationId": "getModelItems",
        "parameters": [
          {
            "name": "testName",
            "in": "query",
            "description": "test name",
            "required": false,
            "type": "array",
            "items": {
              "type": "string"
            },
            "collectionFormat": "multi"
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "schema": {
              "type": "array",
              "items": {
                "originalRef": "ItemSummary",
                "\$ref": "#/definitions/ItemSummary"
              }
            }
          }
        }
      }
    }
  }
}
''';

const String request_with_list_test_item_return_type = '''
{
  "paths": {
    "/model/items": {
      "get": {
        "summary": "Some test request",
        "operationId": "getModelItems",
        "parameters": [
          {
            "name": "testName",
            "in": "query",
            "description": "test name",
            "required": false,
            "type": "array",
            "items": {
              "type": "string"
            },
            "collectionFormat": "multi"
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "schema": {
              "type": "array",
              "items": {
                "originalRef": "TestItem",
                "\$ref": "#/definitions/TestItem"
              }
            }
          }
        }
      }
    }
  }
}
''';

const String request_with_object_ref_response = '''
{
  "paths": {
    "/model/items": {
      "get": {
        "summary": "Some test request",
        "operationId": "getModelItems",
        "parameters": [
          {
            "name": "testName",
            "in": "query",
            "description": "test name",
            "required": false,
            "type": "array",
            "items": {
              "type": "string"
            },
            "collectionFormat": "multi"
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "schema": {
              "\$ref" : "MyObject"
            }
          }
        }
      }
    }
  }
}
''';

const String request_with_original_ref_return_type = '''
{
  "paths": {
    "/model/items": {
      "get": {
        "summary": "Some test request",
        "operationId": "getModelItems",
        "responses": {
          "200": {
            "description": "OK",
            "schema": {
              "originalRef": "TestItem"
            }
          }
        }
      }
    }
  }
}
''';

const String request_with_content_first_response_type = '''
{
  "paths": {
    "/model/items": {
      "get": {
        "summary": "Some test request",
        "operationId": "getModelItems",
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "applicacion/json": {
                "schema" : {
                  "type" : "String"
                }
              }
            }
          }
        }
      }
    }
  }
}
''';

const String request_with_content_first_response_ref = '''
{
  "paths": {
    "/model/items": {
      "get": {
        "summary": "Some test request",
        "operationId": "getModelItems",
        "responses": {
          "200": {
            "description": "OK",
            "schema": {
              "type" : "testType",
              "items" : {
                "\$ref" : "#definitions/TestItem"
              }
            }
          }
        }
      }
    }
  }
}
''';

const String model_with_inheritance = '''
{
  "openapi": "3.0.0",
  "components": {
    "schemas": {
      "BasicErrorModel": {
        "type": "object",
        "required": [
          "message",
          "code"
        ],
        "properties": {
          "message": {
            "type": "string"
          },
          "code": {
            "type": "integer",
            "minimum": 100,
            "maximum": 600
          }
        }
      },
      "ExtendedErrorModel": {
        "allOf": [
          {
            "\$ref": "#/components/schemas/BasicErrorModel"
          },
          {
            "type": "object",
            "required": [
              "rootCause"
            ],
            "properties": {
              "rootCause": {
                "type": "string"
              }
            }
          }
        ]
      }
    }
  }
}
''';

const String model_with_enum = '''
{
   "openapi":"3.0.0",
   "components":{
      "schemas":{
         "BasicErrorModel":{
            "enum":[
               "message",
               "code"
            ]
         }
      }
   }
}
''';

const String model_with_inheritance_3_levels = '''
{
  "openapi": "3.0.0",
  "components": {
    "schemas": {
      "BasicErrorModel": {
        "type": "object",
        "required": [
          "message",
          "code"
        ],
        "properties": {
          "message": {
            "type": "string"
          },
          "code": {
            "type": "integer",
            "minimum": 100,
            "maximum": 600
          }
        }
      },
      "ExtendedErrorModel": {
        "allOf": [
          {
            "\$ref": "#/components/schemas/BasicErrorModel"
          },
          {
            "type": "object",
            "required": [
              "rootCause"
            ],
            "properties": {
              "rootCause": {
                "type": "string"
              }
            }
          }
        ]
      },
      "ErrorModelWithBadAllof": {
        "allOf": [
          {
            "\$ref": "#/components/schemas/NotExistingError"
          },
          {
            "type": "object",
            "required": [
              "rootCause"
            ]
          }
        ]
      },
      "MostExtendedErrorModel": {
        "allOf": [
          {
            "\$ref": "#/components/schemas/ExtendedErrorModel"
          },
          {
            "type": "object",
            "required": [
              "rootCause"
            ],
            "properties": {
              "phone": {
                "type": "string"
              }
            }
          }
        ]
      }
    }
  }
}
''';

const request_with_enum = '''
{
  "paths": {
    "/pets/{petId}/items": {
      "get": {
        "summary": "Some summary",
        "tags": [
          "Bookmarks"
        ],
        "parameters": [
          {
            "name": "contentType",
            "in": "query",
            "description": "content source type",
            "type": "string",
            "schema": {
              "enum": [
              "vod",
              "replay",
              "network-recording",
              "local-recording"
            ]
            }
          }
        ],
        "responses": {
          "200": {
            "description": "Bookmarks for given profile and content is returned.",
            "schema": {
              "\$ref": "#/definitions/Pet"
            }
          }
        }
      }
    }
  }
}
''';

const request_with_enum_request_body = '''
{
  "openapi": "3.0.1",
  "info": {
    "title": "Test service",
    "version": "0.18.0"
  },
  "paths": {
    "/v3/customers/{customerId}/status": {
      "put": {
        "description": "Test request",
        "parameters": [
          {
            "name": "customerId",
            "in": "path",
            "description": "Test desc",
            "required": true,
            "schema": {
              "type": "string"
            }
          }
        ],
        "requestBody": {
          "description": "Test desc",
          "content": {
            "application/json": {
              "schema": {
                "\$ref": "#/components/schemas/CustomerStatus"
              }
            }
          },
          "required": true
        },
        "responses": {
          "204": {
            "description": "Customer Status was changed."
          }
        }
      }
    }
  },
  "components": {
    "schemas": {
      "CustomerStatus": {
        "title": "Customer Status",
        "type": "string",
        "enum": [
          "active",
          "inactive",
          "deleted"
        ]
      }
    }
  }
}
''';
