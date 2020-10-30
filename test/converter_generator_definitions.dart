const String model_with_parameters = '''
{
    "components": {
        "schemas": {
            "ActiveOrderAndListSummary": {
                "type": "object",
                "properties": {
                    "closingTime": {
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
                    }
                },
                "title": "ActiveOrderAndListSummary"
            }
        },
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
                                    "description": "Crid show (VOD)"
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

const String model_with_parameters_v2 = '''
{
    "definitions": {
            "ActiveOrderAndListSummary": {
                "type": "object",
                "properties": {
                    "closingTime": {
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
                    }
                },
                "title": "ActiveOrderAndListSummary"
            }
        }
}
''';
