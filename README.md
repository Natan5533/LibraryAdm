# Library Administrator

> This is my first project in ruby ​​on rails, and it aims to get to know the framework and refine my knowledge.

## For this application it is necessary:

     Rails 7.0.3

     ruby 3.1.1p18 (2022-02-18 revision 53f5fc4236) [x86_64-linux]

## To run the application do:

     Bundler Install

     Rails s

# REST API

> Basically there are three crud's for libraries, authors and books The REST API to the example app is described below.

## Get list of Libraries

### Request

> `GET Index`
> http://localhost:3000/api/libraries

> We can also filter a given library using the query string:
> ?name=libraryname

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

> `GET Show`
> http://localhost:3000/api/libraries/:id | _id = 2_

### Response

    Status = 200
    {
    "id": 2,
    "name": "library",
    "address": "rua amado",
    "authors": [],
    "books": []
    }

## Create new Library

### Request

> `POST Create`
> http://localhost:3000/api/libraries

### Params

     {
    "library":{
        "name": "New Library",
        "address": "avenue"
    }
    }

### Response

    {
    "id": 9,
    "name": "New Library",
    "address": "avenue",
    "authors": [],
    "books": []
    }

## Update Libraries

### Request

> `PUT Update`
> http://localhost:3000/api/libraries/:id | id = 2

### Params

    {
    "id": 2,
    "library":
    {
        "name": "name updated"
    }
    }

### Response

    {
    "id": 2,
    "name": "name updated",
    "address": "Avenue",
    "authors": [],
    "books": []
    }

## Delete Library

### Request

> `DELETE Destroy`
> http://localhost:3000/api/libraries/:id | id = 7

### Params

    {
    "library":
    {
        "id": 7
    }
    }

### Response

    {
    "id": 7,
    "name": "Library",
    "address": "Avenue ***",
    "authors": [],
    "books": []
    }

## `Additional Information`

> For authors and books, the logic is the same but attention must be paid to the parameters

## Authors:

### Request example:

    http://localhost:3000/api/authors

### Params example:

    {
    "author":{
        "name": "",
    >>>> "email": "",
    >>>>"library_id": 1
    }
    }

## Books:

### Request example:

    http://localhost:3000/api/authors

### Params example:

    {
    "book":{
       >>>>> "author_id": 5,
       >>>>> "title": ""
    }
    }
