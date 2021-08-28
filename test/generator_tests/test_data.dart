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
                        "description": "Car successfuly loaded",
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
                        "description": "Car successfuly loaded",
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
                        "description": "Car successfuly loaded",
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
                        "description": "Car successfuly loaded",
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
                        "description": "Car successfuly loaded",
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
                "summary": "Its needed to test optionalBody generation",
                "responses": {
                    "200": {
                        "description": "Car successfuly loaded",
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
                        "description": "Car successfuly loaded",
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
    },
    "components": {
        "schemas": {
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
        }
    }
}
''';
