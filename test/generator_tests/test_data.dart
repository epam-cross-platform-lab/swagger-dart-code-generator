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
                        "required": true
                    },
                    {
                        "name": "type",
                        "type": "enum",
                        "in": "query",
                        "items": {
                            "type": "string"
                        },
                        "required": true
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
