const ref = '\$ref';

const carsService = '''
{
    "openapi": "3.0.0",
    "info": {
        "title": "Swagger title",
        "description": "Swagger description",
        "version": "1.0.0"
    },
    "paths": {
        "/cars": {
            "put": {
                "summary": "Sends car to server",
                "requestBody": {
                    "description": "Car model",
                    "required": true,
                    "content": {
                        "application/json": {
                            "schema": {
                                "$ref": "#/components/schemas/CarModel"
                            }
                        }
                    }
                },
                "responses": {
                    "200": {
                        "description": "Car successfuly loaded1",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/CarModel"
                                }
                            }
                        }
                    }
                }
            },
            "post": {
                "summary": "Sends car to server",
                "requestBody": {
                    "description": "Car model",
                    "required": true,
                    "$ref": "#/components/schemas/CarModel"
                },
                "responses": {
                    "200": {
                        "description": "Car successfuly loaded2",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/CarModel"
                                }
                            }
                        }
                    }
                }
            },
            "get": {
                "summary": "Get car by id and type",
                "parameters": [
                    {
                        "name": "id",
                        "type": "String",
                        "in": "header",
                        "required": true,
                        "description": "This parameter is needed to set id of car"
                    },
                    {
                        "name": "type",
                        "type": "enum",
                        "in": "query",
                        "items": {
                            "type": "string"
                        },
                        "required": true,
                        "description": "This parameter is needed to set type of car"
                    }
                ],
                "responses": {
                    "200": {
                        "description": "Car received",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/CarModel"
                                }
                            }
                        }
                    }
                }
            }
        },
        "/cars/additional": {
            "get": {
                "summary": "Sends binary to server",
                "parameters": [
                    {
                        "name": "id",
                        "type": "String",
                        "in": "header",
                        "required": true
                    },
                    {
                        "name": "carEnumType",
                        "in": "query",
                        "type": "object",
                        "schema": {
                            "$ref": "#/components/schemas/CarType"
                        }
                    },
                    {
                        "name": "timestamp",
                        "type": "String",
                        "in": "query",
                        "required": false
                    }
                ],
                "responses": {
                    "200": {
                        "description": "Car successfuly loaded3",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/CarModel"
                                }
                            }
                        }
                    }
                }
            },
            "put": {
                "summary": "Sends binary to server",
                "requestBody": {
                    "description": "Car model",
                    "required": true,
                    "content": {
                        "application/json": {
                            "schema": {
                                "format": "binary"
                            }
                        }
                    }
                },
                "responses": {
                    "200": {
                        "description": "Car successfuly loaded4",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/CarModel"
                                }
                            }
                        }
                    }
                }
            },
            "post": {
                "summary": "Sends list of cars to server",
                "requestBody": {
                    "description": "Car model",
                    "required": true,
                    "content": {
                        "application/json": {
                            "schema": {
                                "type": "array",
                                "items": {
                                    "$ref": "#/components/schemas/CarModel"
                                }
                            }
                        }
                    }
                },
                "responses": {
                    "200": {
                        "description": "Car successfuly loaded5",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/CarModel"
                                }
                            }
                        }
                    }
                }
            }
        },
        "/cars/optionalBody": {
            "post": {
                "summary": "Its needed to test optionalBody",
                "responses": {
                    "200": {
                        "description": "Car successfuly loaded6",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/CarModel"
                                }
                            }
                        }
                    }
                }
            },
            "put": {
                "summary": "Its needed to test cases with form data and body in parameter",
                "requestBody": {
                    "description": "Car model",
                    "required": true,
                    "content": {
                        "application/json": {
                            "schema": {
                                "type": "array",
                                "items": {
                                    "$ref": "#/components/schemas/CarType"
                                }
                            }
                        }
                    }
                },
                "parameters": [
                    {
                        "name": "body",
                        "type": "String",
                        "in": "body",
                        "schema": {
                            "$ref": "#/components/schemas/CarType"
                        }
                    },
                    {
                        "name": "formData",
                        "in": "formData",
                        "type": "object",
                        "schema": {
                            "$ref": "#/components/schemas/CarType"
                        }
                    },
                    {
                        "name": "someEnumParameter",
                        "in": "query",
                        "items": {
                            "enum": [
                                "one",
                                "two",
                                "three"
                            ]
                        }
                    },
                    {
                        "name": "someEnumParameterRef",
                        "in": "query",
                        "items": {
                            "$ref": "#/components/schemas/CarType"
                        }
                    },
                    {
                        "name": "someNotEnumParameter",
                        "in": "query",
                        "items": {
                            "$ref": "#/components/schemas/CarModel"
                        }
                    },
                    {
                        "name": "parameterWithSchemaItemsRef",
                        "in": "query",
                        "schema": {
                            "items": {
                                "$ref": "#/components/schemas/CarModel"
                            }
                        }
                    },
                    {
                        "name": "parameterWithSchemaItemsEnumRef",
                        "in": "query",
                        "schema": {
                            "items": {
                                "$ref": "#/components/schemas/CarType"
                            }
                        }
                    },
                    {
                        "name": "parameterWithSchemaRefNotEnum",
                        "in": "query",
                        "schema": {
                            "$ref": "#/components/schemas/CarModel"
                        }
                    },
                    {
                        "name": "parameterWithSchemaRefArray",
                        "in": "query",
                        "schema": {
                            "type": "array",
                            "$ref": "#/components/schemas/CarModel"
                        }
                    },
                    {
                        "name": "parameterWithSchemaTypeArray",
                        "in": "query",
                        "schema": {
                            "type": "array",
                            "items": {
                                "type": "string"
                            }
                        }
                    },
                    {
                        "name": "parameterWithSchemaAnyOf",
                        "in": "query",
                        "schema": {
                            "anyOf": [
                                {
                                    "type": "string"
                                }
                            ]
                        }
                    },
                    {
                        "name": "somethingReallyBad",
                        "in": "query"
                    }
                ],
                "responses": {
                    "200": {
                        "description": "Car successfuly loaded7",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/CarModel"
                                }
                            }
                        }
                    }
                }
            }
        },
        "/cars/postCarExamples": {
            "post": {
                "summary": "Its needed to test optionalBody",
                "requestBody": {
                    "description": "Car model",
                    "required": true,
                    "content": {
                        "application/json": {
                            "schema": {
                                "type": "object",
                                "items": {
                                    "$ref": "#/components/schemas/CarType"
                                }
                            }
                        }
                    }
                },
                "responses": {
                    "200": {
                        "description": "Car successfuly loaded8",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/CarModel"
                                }
                            }
                        }
                    }
                }
            }
        },
        "/cars/schemaRefBody": {
            "get": {
                "summary": "Overwritten response",
                "responses": {
                    "202": {
                        "description": "Success",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/CarType"
                                }
                            }
                        }
                    }
                }
            },
            "post": {
                "summary": "Its needed to test optionalBody",
                "requestBody": {
                    "description": "Car model",
                    "required": true,
                    "content": {
                        "application/json": {
                            "schema": {
                                "$ref": "#/components/schemas/CarType"
                            }
                        }
                    }
                },
                "responses": {
                    "200": {
                        "description": "Car successfuly loaded9",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/CarModel"
                                }
                            }
                        }
                    }
                }
            },
            "put": {
                "summary": "Its needed to test optionalBody",
                "requestBody": {
                    "description": "Car model",
                    "required": true,
                    "content": {
                        "application/json": {
                            "schema": {
                                "$ref": "#/components/schemas/CarType"
                            }
                        }
                    }
                },
                "responses": {
                    "202": {
                        "description": "Success",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/CarType"
                                }
                            }
                        }
                    }
                }
            }
        },
        "/cars/returnTypeTests": {
            "get": {
                "summary": "Overwritten response",
                "responses": {
                    "202": {
                        "description": "Success",
                        "schema": {
                            "type": "object",
                            "properties": {
                                "id": {
                                    "type": "string"
                                },
                                "type": {
                                    "type": "enum",
                                    "name": "String",
                                    "items": {
                                        "type": "string"
                                    }
                                }
                            }
                        }
                    }
                }
            },
            "post": {
                "summary": "Overwritten response POST",
                "responses": {
                    "200": {
                        "description": "Success",
                        "schema": {
                            "type": "array",
                            "items": {
                                "$ref": "#/components/schemas/CarType"
                            }
                        }
                    }
                }
            },
            "put": {
                "summary": "Overwritten response POST",
                "responses": {
                    "200": {
                        "description": "Success",
                        "schema": {
                            "type": "String"
                        }
                    }
                }
            }
        },
        "/cars/returnTypeSchema": {
            "get": {
                "summary": "Return type schema",
                "responses": {
                    "200": {
                        "description": "Success",
                        "schema": {
                            "items": {
                                "$ref": "#/components/schemas/CarModel"
                            }
                        }
                    }
                }
            },
            "post": {
                "summary": "Return type schema",
                "responses": {
                    "200": {
                        "description": "Success",
                        "schema": {
                            "$ref": "#/components/responses/CarModelResponse"
                        }
                    }
                }
            },
            "put": {
                "summary": "Return type schema",
                "responses": {
                    "200": {
                        "description": "Success",
                        "schema": {
                            "$ref": "#/components/responses/CarModel"
                        }
                    }
                }
            }
        },
        "/cars/returnTypeOriginalRef": {
            "get": {
                "summary": "Return type originalRef",
                "responses": {
                    "200": {
                        "description": "Success",
                        "schema": {
                            "originalRef": "CarModel"
                        }
                    }
                }
            }
        },
        "/cars/returnTypeByContent": {
            "get": {
                "summary": "Return type by content",
                "responses": {
                    "200": {
                        "description": "Success",
                        "content": {
                            "application/json": {
                                "$ref": "#/components/responses/CarModel"
                            }
                        }
                    }
                }
            },
            "put": {
                "summary": "Return type by content",
                "responses": {
                    "200": {
                        "description": "Success",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ListOfCars"
                                }
                            }
                        }
                    }
                }
            },
            "post": {
                "summary": "Return type by content",
                "responses": {
                    "200": {
                        "description": "Success with original ref",
                        "schema": {
                            "items": {
                                "originalRef": "CarModel"
                            }
                        },
                        "content": {
                            "application/json": {
                                "responseType": "array"
                            }
                        }
                    }
                }
            }
        },
        "/cars/returnTypeContentItemsRef": {
            "get": {
                "summary": "Return type by content",
                "responses": {
                    "200": {
                        "description": "Success",
                        "content": {
                            "application/json": {
                                "items": {
                                    "$ref": "#/components/responses/CarModel"
                                }
                            }
                        }
                    }
                }
            },
            "put": {
                "summary": "Return type by content",
                "responses": {
                    "200": {
                        "description": "Success",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "items": {
                                        "$ref": "#/components/responses/CarModel"
                                    }
                                }
                            }
                        }
                    }
                }
            },
            "post": {
                "summary": "Return type by content",
                "responses": {
                    "200": {
                        "description": "Success",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        }
                    }
                }
            }
        },
        "/cars/veryBadResponse": {
            "get": {
                "summary": "Return type by content",
                "responses": {
                    "200": {
                        "description": "Success",
                        "content": {
                            "application/json": {}
                        }
                    }
                }
            },
            "put": {
                "summary": "Return type by content",
                "responses": {
                    "200": {
                        "description": "Success",
                        "content": {
                            "application/json": {
                                "responseType": "string"
                            }
                        }
                    }
                }
            }
        },
        "/cars/responseWithAbsendRef": {
            "put": {
                "summary": "Sends car to server not existing ref",
                "requestBody": {
                    "description": "Car model",
                    "required": true,
                    "content": {
                        "application/json": {
                            "schema": {
                                "$ref": "#/components/schemas/CarModel"
                            }
                        }
                    }
                },
                "responses": {
                    "200": {
                        "description": "Car successfuly loaded1",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/CarMNotExistingCarModelodel"
                                }
                            }
                        }
                    }
                }
            },
            "post": {
                "summary": "Request body with default type",
                "requestBody": {
                    "description": "Car model",
                    "required": true,
                    "content": {
                        "application/json": {
                            "schema": {
                                "type": "array",
                                "items": {
                                    "$ref": "#/components/schemas/CarModelSimple"
                                }
                            }
                        }
                    }
                },
                "responses": {
                    "200": {
                        "description": "Success",
                        "schema": {
                            "$ref": "#/components/responses/CarType"
                        }
                    }
                }
            }
        },
        "/cars/oneMoreRequestBody": {
            "put": {
                "summary": "Sends car to server",
                "requestBody": {
                    "description": "Car model",
                    "required": true,
                    "content": {
                        "application/json": {
                            "schema": {
                                "$ref": "#/components/schemas/CarModelSimple"
                            }
                        }
                    }
                },
                "responses": {
                    "200": {
                        "description": "Success",
                        "schema": {
                            "$ref": "#/components/responses/NotExistingCarResponse"
                        }
                    }
                }
            }
        }
    },
    "components": {
        "schemas": {
            "CarModelSimple": {
                "type": "string"
            },
            "CarModel": {
                "type": "object",
                "properties": {
                    "id": {
                        "type": "string"
                    },
                    "type": {
                        "type": "enum",
                        "name": "String",
                        "items": {
                            "type": "string"
                        }
                    }
                }
            },
            "ListOfCars": {
                "type": "array",
                "items": {
                    "type": "String"
                }
            },
            "CarType": {
                "type": "string",
                "enum": [
                    "one",
                    "two",
                    "three"
                ]
            }
        },
        "requestBodies": {
            "CarModel": {
                "type": "object",
                "content": {
                    "application/json": {
                        "schema": {
                            "$ref": "#/components/schemas/CarModel"
                        }
                    }
                }
            }
        },
        "responses": {
            "CarModelResponse": {
                "content": {
                    "application/json": {
                        "schema": {
                            "$ref": "#/components/schemas/CarModel"
                        }
                    }
                }
            }
        }
    }
}
''';

const aaa = '''
{
  "x-generator": "NSwag v13.15.5.0 (NJsonSchema v10.6.6.0 (Newtonsoft.Json v12.0.0.0))",
  "openapi": "3.0.0",
  "info": {
    "title": "Cafe Analog CoffeeCard API",
    "description": "ASP.NET Core WebAPI for Cafe Analog",
    "contact": {
      "name": "AnalogIO",
      "url": "https://github.com/analogio",
      "email": "support@analogio.dk"
    },
    "license": {
      "name": "Use under MIT",
      "url": "https://github.com/AnalogIO/analog-core/blob/master/LICENSE"
    },
    "version": "v2"
  },
  "servers": [
    {
      "url": "https://beta-v2.analogio.dk/coffeecard"
    }
  ],
  "paths": {
    "/api/v2/appconfig": {
      "get": {
        "tags": [
          "AppConfig"
        ],
        "summary": "Get app configuration",
        "operationId": "AppConfig_Get",
        "responses": {
          "200": {
            "description": "Successful request",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/AppConfig"
                }
              }
            }
          }
        }
      }
    },
    "/api/v2/mobilepay/webhook": {
      "post": {
        "tags": [
          "MobilePay"
        ],
        "summary": "Webhook to be invoked by MobilePay backend",
        "operationId": "MobilePay_Webhook",
        "requestBody": {
          "x-name": "request",
          "description": "Webhook request",
          "content": {
            "application/json": {
              "schema": {
                "$ref": "#/components/schemas/MobilePayWebhook"
              }
            }
          },
          "required": true,
          "x-position": 1
        },
        "responses": {
          "200": {
            "description": "Webhook processed"
          }
        }
      }
    },
    "/api/v2/purchases": {
      "get": {
        "tags": [
          "Purchases"
        ],
        "summary": "Get all purchases",
        "operationId": "Purchases_GetAllPurchases",
        "responses": {
          "200": {
            "description": "Successful request",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "$ref": "#/components/schemas/Purchase"
                  }
                }
              }
            }
          },
          "401": {
            "description": "Invalid credentials"
          }
        },
        "security": [
          {
            "Bearer": []
          }
        ]
      },
      "post": {
        "tags": [
          "Purchases"
        ],
        "summary": "Initiate a new payment.",
        "operationId": "Purchases_InitiatePurchase",
        "requestBody": {
          "x-name": "initiateRequest",
          "content": {
            "application/json": {
              "schema": {
                "$ref": "#/components/schemas/InitatePurchaseRequest"
              }
            }
          },
          "required": true,
          "x-position": 1
        },
        "responses": {
          "201": {
            "description": "Purchased initiated",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/InitiatePurchaseResponse"
                }
              }
            }
          },
          "401": {
            "description": "Invalid credentials"
          }
        },
        "security": [
          {
            "Bearer": []
          }
        ]
      }
    },
    "/api/v2/purchases/{id}": {
      "get": {
        "tags": [
          "Purchases"
        ],
        "summary": "Get purchase",
        "operationId": "Purchases_GetPurchase",
        "parameters": [
          {
            "name": "id",
            "x-originalName": "purchaseId",
            "in": "path",
            "required": true,
            "description": "Purchase Id",
            "schema": {
              "type": "string"
            },
            "x-position": 1
          }
        ],
        "responses": {
          "200": {
            "description": "Successful request",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/Purchase"
                }
              }
            }
          },
          "401": {
            "description": "Invalid credentials"
          },
          "404": {
            "description": "No purchase found with purchase-id",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/MessageResponseDto"
                }
              }
            }
          }
        },
        "security": [
          {
            "Bearer": []
          }
        ]
      }
    }
  },
  "components": {
    "schemas": {
      "AppConfig": {
        "type": "object",
        "description": "App Configuration",
        "example": {
          "environmentType": "Production"
        },
        "additionalProperties": false,
        "required": [
          "environmentType"
        ],
        "properties": {
          "environmentType": {
            "description": "Environment type for indicating production or test system",
            "example": "Production",
            "oneOf": [
              {
                "$ref": "#/components/schemas/EnvironmentType"
              }
            ]
          }
        }
      },
      "EnvironmentType": {
        "type": "string",
        "description": "",
        "x-enumNames": [
          "Production",
          "Test"
        ],
        "enum": [
          "Production",
          "Test"
        ]
      },
      "MobilePayWebhook": {
        "type": "object",
        "description": "MobilePay webhook invocation request mmCode documentation based on MobilePay Developer: Webhooks",
        "example": {
          "notificationId": "c85f42aa-0a81-4838-8e87-72236a348d08",
          "eventType": "payment.reserved",
          "eventDate": "2021-10-15T15:30:31Z",
          "data": {
            "id": "ceb351ac-9d20-4300-b5ad-e05851d5a3b7",
            "type": "payment"
          }
        },
        "additionalProperties": false,
        "properties": {
          "notificationId": {
            "type": "string",
            "description": "Internal MobilePay Id for Webhook invocation",
            "example": "c85f42aa-0a81-4838-8e87-72236a348d08"
          },
          "eventType": {
            "type": "string",
            "description": "Type of eventmmmm    mm        payment.reservedmm        Published when payment has been approved by MobilePay user and is ready to be capturedmm    mm    mm        payment.cancelled_by_usermm        Published when payment has been cancelled by user insinde Mobilepay appmm    mm           payment.expired        Published when either initiated payment didn't have any user interactions for 5-10 minutes or payment was reserved, but 7 days have passed and the reservation has expiredn    ",
            "example": "payment.expired"
          },
          "eventDate": {
            "type": "string",
            "description": "Date time of event dispatch",
            "format": "date-time"
          },
          "data": {
            "description": "Event data, e.g. payment id",
            "oneOf": [
              {
                "$ref": "#/components/schemas/EventData"
              }
            ]
          }
        }
      },
      "EventData": {
        "type": "object",
        "description": "Event Data",
        "example": {
          "id": "ceb351ac-9d20-4300-b5ad-e05851d5a3b7",
          "type": "payment"
        },
        "additionalProperties": false,
        "properties": {
          "id": {
            "type": "string",
            "description": "MobilePay payment id",
            "example": "ceb351ac-9d20-4300-b5ad-e05851d5a3b7"
          },
          "type": {
            "type": "string",
            "description": "Internal MobilePay representation of a type.",
            "example": "payment"
          }
        }
      },
      "Purchase": {
        "type": "object",
        "description": "Represents a purchase",
        "example": {
          "id": 22,
          "dateCreated": "2022-01-09T21:03:52.2283208Z",
          "productId": 1,
          "totalAmount": 300,
          "purchaseStatus": "Completed"
        },
        "additionalProperties": false,
        "required": [
          "id",
          "dateCreated",
          "productId",
          "totalAmount",
          "purchaseStatus"
        ],
        "properties": {
          "id": {
            "type": "integer",
            "description": "Id of purchase",
            "format": "int32",
            "example": 1371
          },
          "dateCreated": {
            "type": "string",
            "description": "Date time for purchase in Utc format",
            "format": "date-time",
            "minLength": 1,
            "example": "2022-01-09T21:03:52.2283208Z"
          },
          "productId": {
            "type": "integer",
            "description": "Id of purchased product",
            "format": "int32",
            "example": 1
          },
          "totalAmount": {
            "type": "integer",
            "description": "Total purchase price in Danish Kroner (kr)",
            "format": "int32",
            "example": 300
          },
          "purchaseStatus": {
            "description": "Status of the purchase",
            "example": "Completed",
            "oneOf": [
              {
                "$ref": "#/components/schemas/PurchaseStatus"
              }
            ]
          }
        }
      },
      "PurchaseStatus": {
        "type": "string",
        "description": "Status of purchase",
        "x-enumNames": [
          "Completed",
          "Cancelled",
          "PendingPayment",
          "Refunded"
        ],
        "enum": [
          "Completed",
          "Cancelled",
          "PendingPayment",
          "Refunded"
        ]
      },
      "MessageResponseDto": {
        "type": "object",
        "description": "Simple response class with a string message",
        "example": {
          "message": "Successful completion"
        },
        "additionalProperties": false,
        "properties": {
          "message": {
            "type": "string",
            "description": "Message with API response",
            "example": "Successful completion"
          }
        }
      },
      "InitiatePurchaseResponse": {
        "type": "object",
        "description": "Response object to a purchase request containing purchase information and reference to payment provider",
        "example": {
          "id": 122,
          "dateCreated": "",
          "productId": 1,
          "totalAmount": 100,
          "purchaseStatus": "PendingPayment",
          "paymentDetails": {
            "paymentType": "MobilePay",
            "orderId": "f5cb3e0f-3b9b-4f50-8c4f-a7450f300a5c",
            "mobilePayAppRedirectUri": "mobilepay://merchant_payments?payment_id=186d2b31-ff25-4414-9fd1-bfe9807fa8b7",
            "paymentId": "186d2b31-ff25-4414-9fd1-bfe9807fa8b7"
          }
        },
        "additionalProperties": false,
        "required": [
          "id",
          "dateCreated",
          "productId",
          "totalAmount",
          "purchaseStatus",
          "paymentDetails"
        ],
        "properties": {
          "id": {
            "type": "integer",
            "description": "Id of the purchase",
            "format": "int32",
            "example": 122
          },
          "dateCreated": {
            "type": "string",
            "description": "Date time for purchase in Utc format",
            "format": "date-time",
            "minLength": 1,
            "example": "2022-01-09T21:03:52.2283208Z"
          },
          "productId": {
            "type": "integer",
            "description": "Id of the product to be purchased",
            "format": "int32",
            "example": 1
          },
          "totalAmount": {
            "type": "integer",
            "description": "The amount of money to be collected by the purchase.A positive integer representing how much to charge in the smallest currency unit (e.g., 100 ører to charge 1.00 Danish kroner).",
            "format": "int32",
            "example": 100
          },
          "purchaseStatus": {
            "description": "Status of the purchase",
            "example": "Completed",
            "oneOf": [
              {
                "$ref": "#/components/schemas/PurchaseStatus"
              }
            ]
          },
          "paymentDetails": {
            "description": "Details about the payment. The details object is specific to the Payment Type",
            "oneOf": [
              {
                "$ref": "#/components/schemas/PaymentDetails"
              }
            ]
          }
        }
      },
      "PaymentDetails": {
        "type": "object",
        "discriminator": {
          "propertyName": "discriminator",
          "mapping": {
            "MobilePayPaymentDetails": "#/components/schemas/MobilePayPaymentDetails"
          }
        },
        "x-abstract": true,
        "additionalProperties": false,
        "required": [
          "paymentType",
          "orderId",
          "discriminator"
        ],
        "properties": {
          "paymentType": {
            "description": "Payment type",
            "example": "MobilePay",
            "oneOf": [
              {
                "$ref": "#/components/schemas/PaymentType"
              }
            ]
          },
          "orderId": {
            "type": "string",
            "description": "Order id of purchase",
            "minLength": 1,
            "example": "f5cb3e0f-3b9b-4f50-8c4f-a7450f300a5c"
          },
          "discriminator": {
            "type": "string"
          }
        }
      },
      "PaymentType": {
        "type": "string",
        "description": "PaymentType represents the type of Payment which is used to fulfill a purchase",
        "x-enumNames": [
          "MobilePay"
        ],
        "enum": [
          "MobilePay"
        ]
      },
      "MobilePayPaymentDetails": {
        "allOf": [
          {
            "$ref": "#/components/schemas/PaymentDetails"
          },
          {
            "type": "object",
            "description": "MobilePay Payment details",
            "example": {
              "paymentType": "MobilePay",
              "orderId": "f5cb3e0f-3b9b-4f50-8c4f-a7450f300a5c",
              "mobilePayAppRedirectUri": "mobilepay://merchant_payments?payment_id=186d2b31-ff25-4414-9fd1-bfe9807fa8b7",
              "paymentId": "186d2b31-ff25-4414-9fd1-bfe9807fa8b7"
            },
            "additionalProperties": false,
            "required": [
              "mobilePayAppRedirectUri",
              "paymentId"
            ],
            "properties": {
              "mobilePayAppRedirectUri": {
                "type": "string",
                "description": "App deeplink for a MobilePay payment",
                "minLength": 1,
                "example": "mobilepay://merchant_payments?payment_id=186d2b31-ff25-4414-9fd1-bfe9807fa8b7"
              },
              "paymentId": {
                "type": "string",
                "description": "MobilePay Id for a payment",
                "minLength": 1,
                "example": "186d2b31-ff25-4414-9fd1-bfe9807fa8b7"
              }
            }
          }
        ]
      },
      "InitatePurchaseRequest": {
        "type": "object",
        "description": "Initiate a new purchase request",
        "additionalProperties": false,
        "required": [
          "productId",
          "paymentType"
        ],
        "properties": {
          "productId": {
            "type": "integer",
            "description": "Id of product to be purchased",
            "format": "int32",
            "example": 1
          },
          "paymentType": {
            "description": "Payment Type used to fulfill purchase",
            "example": "MobilePay",
            "oneOf": [
              {
                "$ref": "#/components/schemas/PaymentType"
              }
            ]
          }
        }
      }
    },
    "securitySchemes": {
      "Bearer": {
        "type": "http",
        "description": "Insert a JWT Bearer token: Bearer {token}",
        "name": "Authorization",
        "in": "header",
        "scheme": "bearer",
        "bearerFormat": "JWT"
      }
    }
  }
}
''';
