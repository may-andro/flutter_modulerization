# Flutter Modular App

A small Flutter project to demonstrate the concept of Modularization in project.

## Concept

Modular programming is a software design technique to separate functionality into independent, interchangeable module, so that each contains everything necessary to execute a specific functionality.

Android equivalent concept: 

Techniques: 
1. Feature Based 
2. Layer Based
3. Hybrid Based (Feature and Layer)

There many other ways to distribute the app but these are the basic/general techniques.

Pro: 
1. Seperation of Concern
2. Maintainablilty
3. Testable
4. Reusability
5. Faster CI/CD (Not 100% sure)

Con: 
1. Slower development
2. Could be an over kill if feature is small
3. Increases code cmplexity in the 

## Structure Overview
The app is very basic with networking and few main features: 
1. Getting current location
2. Display current AQI
3. Get AQI forcast
4. Get last 7 days AQI history
5. Setting (Theme, Language etc)
6. Add location (Pending)
7. Add Feedback (Pending)

Modules in the App:

1. layer/domain Module
2. layer/data Module
3. utility/common Module
4. utility/analytics Module
5. utility/component Module
6. feature/forecast Module
7. feature/history Module
8. main

### layer/domian Module
This module is responsible for defining the business logic. It provides definitions and it is pure dart.

### layer/data Module
This module is responsible is fetching data and hooking the data with domian definitions. The data could be local, remote, locations, sensors etc.

### utility/common Module
This module is responsible for providing common stuff throughout the app. This layer could/should be independent of any external libraries. The things it could include are: Exceptions, extensions, mappers defnitions etc.

### utility/analytics Module
This module is responsible for providing analytics throughout the app. This could be also the part of common layer.

### utility/component Module
This module is responsible for providing basic building block widget for the presentation(main) and feature modules.

### feature/forecast, feature/hostory Module
These modules are feature based which mostly has presentation layers.

### main Module
This module has basic setup for all the app which could be theme, global state, routes etc.


## Challenges 
In flutter environment the following could be challenges:
1. Navigation between feature modules
2. DI for modules
3. Module inter dependencies

