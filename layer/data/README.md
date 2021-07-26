# data

This is a core layer module whose functionality is to generate the data and manipulate it according to requirement of Domain layer.

## Feature Includes
1. Remote: This package has remote library DIO for api calls and networking. Remote Data Source acts as an mediator between the repository and actual network client. This provides the flexibility to modify remote client accoeding to need. 
2. Local: This package is responsible for local cache management for the app. Currently using Secure Storage and Shared Preference for caching the data. It exposes a manager class for the different libraries.
3. Repository: This package provides the implementation for the actual definitions in the Domain layer. Different clients and mappers are used to provide the desired implementation. 
4. Mapper: This package maps the data models to domain entities
5. Model: This package has all the data level model classes.
6. Provider/DI: This package provides the dependency injection via riverpod.


## Dependencies
1. Domain Module
2. Common Module

