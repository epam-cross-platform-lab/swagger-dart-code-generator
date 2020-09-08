const model_with_parameters = """
{
  "definitions": {
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
""";

const request_with_header = """
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
""";

const request_with_enum_in_parameter = """
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
""";

const String request_with_array_string = """
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
""";

const String request_with_array_order_summary = """
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
""";

const String request_with_list_string_return_type = """
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
""";
