# Library Administrator

> This is my first project in ruby ​​on rails, and it aims to get to know the framework and refine my knowledge.

# REST API

> Basically there are three crud's for libraries, authors and books The REST API to the example app is described below.

## Get list of Things

### Request

`GET Index`
http://localhost:3000/api/libraries

### Response

    Status = 200
    [
    {
        "id": 1,
        "name": "Kalunga",
        "address": "Av. figueira grande",
        "authors": [
            {
                "id": 1,
                "name": "Author",
                "email": "aa@aaa.com"
            },
            {
                "id": 5,
                "name": "New Author",
                "email": "teste@sumup.com"
            }
        ],
        "books": [
            {
                "id": 5,
                "title": "a espera de um milagre"
            }
        ]
    },
    {
        "id": 2,
        "name": "edited library",
        "address": "rua amado",
        "authors": [
            {
                "id": 2,
                "name": "felipe",
                "email": "ei@gmail"
            },
            {
                "id": 3,
                "name": "Tuezin",
                "email": "30@a"
            }
        ],
        "books": [
            {
                "id": 3,
                "title": "New title"
            }
        ]
    }
