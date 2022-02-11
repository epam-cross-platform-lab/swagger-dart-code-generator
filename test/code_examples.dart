const String ref = '\$ref';
const String modelWithParametersV3 = '''
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

const String modelWithParametersV2 = '''
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

const String requestWithRnumInParameter = '''
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

const String requestWithListOfEnumInParameter = '''
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

const String schemasResponsesWithResponse = '''
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

const String schemasResponsesWithResponseAndSchemas = '''
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

const String enumAsDefinitionV2 = '''
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

const String schemasWithEnumsInProperties = '''
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

const String requestWithReturnTypeInjected = '''
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

const requestWithEnum = '''
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
