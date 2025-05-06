# Sports eCommerce Flutter App

A clean, modular Flutter application for managing sports products. This app allows users to add, edit, view, and delete products, with image previewing and validation. Built using Clean Architecture principles to ensure maintainability, testability, and scalability.

---

## Features

-  Add, view, update, and delete products
- Network image preview with placeholder fallback
- Local data source abstraction (can be upgraded to remote APIs)
- Unit-tested data models and use cases
- Clean Architecture (domain-driven design)



## Architectural Overview

The project follows **Clean Architecture** with clearly separated layers:

```
+----------------------+
|    Presentation      | ← UI Widgets, Screens, State Management
+----------------------+
|     Application      | ← UseCases (business rules, input/output boundaries)
+----------------------+
|       Domain         | ← Entities & Interfaces (business models and contracts)
+----------------------+
|       Data           | ← Models, Repositories (implements interfaces), API logic
+----------------------+
|       Core/Utils     | ← Reusable helpers, DI, constants
+----------------------+
```

---

## Data Flow

```text
User Interaction
      ↓
 UI Widget (Presentation Layer)
      ↓
 Calls UseCase (Application Layer)
      ↓
 UseCase talks to Repository (Domain Layer)
      ↓
 Repository implementation fetches data (Data Layer)
      ↓
 Data is transformed into Domain Entity
      ↓
 Response goes back up → UI updates
```

---

## Layer Breakdown

### 1. **Presentation Layer**

* Location: `lib/features/product/presentation`
* Components:

    * `Widgets`, `Pages`, and `Controllers` (if used)
    * StatelessWidgets/StatefulWidgets and view logic
* Role:

    * Handles UI rendering and user interactions
    * Calls use cases via button taps, text input, etc.

---

### 2. **Application Layer**

* Location: `/lib/features/product/domain/usecases`
* Components:

    * One file per use case (e.g., `AddProductUsecase`)
* Role:

    * Contains business logic
    * Accepts parameters, invokes repository methods

---

### 3. **Domain Layer**

* Location: `/lib/features/product/domain`
* Components:

    * `Entities` (e.g., `Product`)
    * `Repository contracts` (abstract classes)
* Role:

    * Holds core models and business rules
    * Defines what data is required—not how it's fetched

---

### 4. **Data Layer**

* Location: `/lib/features/product/data`
* Components:

    * `Models` (e.g., `ProductModel`)
    * `Repository Implementations`
    * `API/Data Sources`
* Role:

    * Implements repository contracts
    * Handles actual data fetching/parsing
    * Converts between Models ↔ Entities

---

### 5. **Core/Utilities**

* Location: `/lib/core`, `/lib/injection.dart`
* Components:

    * DI setup using `get_it`
    * Constants, themes, error handlers

---

## Testing Strategy

| Layer        | Test Type          | Notes                                      |
| ------------ | ------------------ | ------------------------------------------ |
| Domain       | Unit Tests         | Test pure logic (e.g., entities, usecases) |
| Data         | Unit/Integration   | Test repository + data source behavior     |
| Presentation | Widget/Integration | Test UI responses to state/data            |

---


## Feature Structure

Each feature follows a modular folder layout:

```
features/
└── product/
    ├── data/
    │   └── models/, repositories/
    ├── domain/
    │   └── entities/, usecases/, repositories/
    └── presentation/
        └── pages/, widgets/
```

---

## Data Flow

**Adding a Product**

1. User taps “Add Product”
2. Presentation layer collects input
3. Calls `AddProductUsecase`
4. UseCase calls `ProductRepository.addProduct(...)`
5. Repository sends data to backend
6. Response mapped to `Product` entity
7. UI reflects new product in list


**Viewing a Product**
1. User taps a product in the list
2. App navigates to ViewProductPage 
3. The selected Product is passed as an argument 
4. UI displays product details and attempts to load image via Image.network(...)
5. If the image URL is invalid, a placeholder is shown

**Editing a Product**
1. User taps “Edit” on a product 
2. The product’s current data is pre-filled in form fields 
3. User modifies the data and taps “Save Changes” 
4. Calls UpdateProductUsecase with the updated 
5. Product Usecase → Repository → DataSource updates product data 
6. On success, returns updated Product to UI
7. UI refreshes to display new details

**Deleting a Product**
1. User taps “Delete”
2. A confirmation dialog is shown
3. On confirmation, calls DeleteProductUsecase
4. Usecase calls ProductRepository.deleteProduct(id)
5. Repository removes the product from the data source
6. UI navigates back and removes the product from the list

