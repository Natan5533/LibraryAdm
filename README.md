# Library Administrator

> This is my first project in ruby ​​on rails, and it aims to get to know the framework and refine my knowledge.

# REST API

> Basically there are three crud's for libraries, authors and books The REST API to the example app is described below.

## Get list of Libraries

### Request

`GET Index`
http://localhost:3000/api/libraries

### Response

    Status = 200
    {
        "id": 1,
        "name": "Kalunga",
        "address": "Av. figueira grande",
        "authors": [],
        "books": []
    },
    {
        "id": 2,
        "name": "New library",
        "address": "rua amado",
        "authors": [],
        "books": []
    }

## Get one Library

### Request

> this url is used for different http verbs such as DELETE and PUT, in this example it was used for SHOW

`GET Show`
http://localhost:3000/api/libraries/:id | _id = 2_

### Response

    Status = 200
    {
    "id": 2,
    "name": "library",
    "address": "rua amado",
    "authors": [],
    "books": []
    }
