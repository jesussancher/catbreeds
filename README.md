# CatBreeds Application

## Overview

CatBreeds is a Flutter application designed as a requirement for the Mobile Developer position at Pragma. It's aim is to provide detailed information about various cat breeds. The app features browsing, searching, and viewing details of cats, all while utilizing modern Flutter architecture patterns to ensure a clean and maintainable codebase.

## Architecture

The architecture of the CatBreeds application follows a well-structured approach to a Clean Architecture that leverages the following principles and patterns:

### 1. Clean Architecture

The application is organized into multiple layers to separate concerns and promote code reusability:

- **Data Layer**: Handles data sources and repositories.
- **Domain Layer**: Contains business logic and use cases.
- **Presentation Layer**: Manages the UI and state of the application.
- **UI Layer**: Contains the Pages and the Widgets.

#### Data Layer

- **Data Sources**:
  - `CatsLocalApi` and `CatsRemoteApi` manage local and remote data interactions respectively.
  - **Custom HttpClient**: The `IHttpClient` interface is implemented by a custom HTTP client to handle network requests. This allows for easy customization of HTTP request and errors handling.

- **Repositories**:
  - `CatsLocalRepository` and `CatsRemoteRepository` act as intermediaries between data sources and use cases. They abstract data fetching and caching logic.

#### Domain Layer

- **Models**: Define the core data structures such as `Cat`, `Weight`, and various parameter classes.
- **Use Cases**: Encapsulate business logic. Examples include `SearchCatsUseCase` and `FetchAllCatsPaginatedUseCase`.

#### Presentation Layer

- **ViewModels**: Manage the state and logic for UI components. Examples include `HomeViewModel` and `SearchViewModel`.

#### UI Layer
- **Pages**: Define the UI and user interactions. They use ViewModels to display and manipulate data. Examples include `HomeView`, `SearchView`, and `DetailView`.
- **Widgets**: Defined the Widgets used to showcase information or handle user interactions.
- 
### 2. State Management

The application uses `ChangeNotifier` to manage state changes. The `BaseViewModel` class extends `ChangeNotifier`, allowing ViewModels to notify listeners about state updates. This approach ensures that the UI reflects the current state of the data.

### 3. Paging and Infinite Scrolling

The app uses `infinite_scroll_pagination` to handle paginated data fetching and infinite scrolling in the `HomeView`. This allows users to scroll through a large list of cat breeds without loading all data at once.

### 4. Dependency Injection

Dependencies are managed using a service locator pattern. The `getIt` instance from the `get_it` package is used to inject dependencies across the application, making it easy to manage and test different components.

### 5. Custom HttpClient

The application uses a custom `HttpClient` that implements the `IHttpClient` interface. This client handles HTTP requestsa and responses success and errors.

### 6. Image Caching

The application uses the `cached_network_image` package to efficiently manage and cache images. This package allows for:

- **Caching**: Reduces network requests by caching images locally.
- **Placeholder**: Displays placeholder images while the network image is being loaded.
- **Error Handling**: Provides error handling and fallback options for image loading issues.

## Application Logic

### Initialization and Setup

- **Service Locator**: Initialize `getIt` with all necessary dependencies at the start of the application.
- **Routes Configuration**: Define application routes in a centralized routes map, ensuring smooth navigation between different views.

### Data Handling

- **Local and Remote Data Sources**:
  - Local data is handled through `CatsLocalApi`, which uses `BehaviorSubject` to stream data updates.
  - Remote data is fetched via `CatsRemoteApi`, which makes HTTP requests using the custom `HttpClient` and parses responses.

- **Repositories**: Use `CatsLocalRepository` and `CatsRemoteRepository` to manage interactions between the data sources and the use cases. Repositories abstract away the details of data fetching and provide a clean interface for the use cases.

### Use Cases

- **Fetching and Searching**:
  - `FetchAllCatsPaginatedUseCase` fetches cat data in pages for efficient loading.
  - `SearchCatsUseCase` searches for cats either locally or remotely and updates the local data store if needed.

- **State Management**:
  - Use cases interact with repositories to perform operations like setting and retrieving cat lists. The results are reflected in the ViewModels and their respective Views.

### UI and ViewModels

- **ViewModels**: Handle the business logic for each view. For example:
  - `HomeViewModel` manages the logic for displaying the list of cats and handling infinite scrolling.
  - `SearchViewModel` manages search functionality and random cat name generation.

- **Views**: Utilize ViewModels to display data and handle user interactions. For example:
  - `HomeView` displays a list of cat breeds and supports infinite scrolling.
  - `SearchView` allows users to search for cat breeds and displays search results.

## Conclusion

The CatBreeds application is designed with a focus on clean architecture, maintainability, and scalability. By separating concerns into distinct layers and using modern Flutter patterns, the application ensures a robust and responsive user experience. The use of a custom `HttpClient` provides flexibility and control over network operations, while dependency injection, state management, and paging strategies contribute to a well-structured and testable codebase. The `cached_network_image` package further enhances the app’s performance and user experience by efficiently handling and caching images.

Hoping we can meet as teammates soon, Jesús.

