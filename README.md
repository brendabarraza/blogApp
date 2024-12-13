# Mobile Blog App

This is a mobile blog app that allows users to upload photos with descriptions, view full posts on a home screen, and organize them alphabetically for quick access. The app is built using `SwiftUI` for the frontend, `PHP` and `MySQL/MariaDB` for the backend, and uses the `Alamofire` package for network requests.

## Technologies Used

### Frontend (iOS)
- **SwiftUI**: Framework for building user interfaces in iOS apps.
- **Alamofire**: Library for making HTTP requests and handling communication between the app and the server.
- **PhotosUI**: Framework used for selecting photos from the user's device.

### Backend (Server)
- **PHP**: Programming language used for handling the server logic, including CRUD operations (Create, Read, Update, Delete) for the blog.
- **MySQL/MariaDB**: Database management system used to store blog entries, including photos and descriptions.
- **XAMPP**: Package including Apache, MySQL, and PHP to serve as a local development server.

### Architecture
- **MVC**: The Model-View-Controller pattern is followed to organize the code and logic both in the client (SwiftUI) and server (PHP).
- **CRUD**: The app implements full CRUD operations for the blog entries (photo + description).

## Requirements

- **Xcode 14.1 or higher** to build and run the iOS app.
- **XAMPP** or a similar server with Apache, MySQL/MariaDB, and PHP to run the backend locally.
- **Alamofire** (dependency in the iOS project).

## Database Structure

MySQL/MariaDB is used to store the data. The basic database structure is as follows:

### `blog_entries` Table

| Column           | Type           | Description                               |
|------------------|----------------|-------------------------------------------|
| `id`             | `INT`          | Unique identifier for the entry.          |
| `title`          | `VARCHAR(255)` | Title of the blog entry.                  |
| `contenido`      | `TEXT`         | Description of the blog entry.            |
| `imagen`         | `VARCHAR(255)` | URL of the uploaded image.                |
| `nombre_ imagen` | `VARCHAR(255)` | URL of the uploaded image.                |

    
    struct Posts: Codable {
        let id : String
        let titulo : String
        let contenido : String
        let imagen : String
        let nombre_imagen : String 
    }


## Installation

### 1. Clone the Repository

    ```bash
    git clone https://github.com/brendabarraza/blogApp.git


---

## Figma Prototype

You can view the Figma prototype of the app [here](https://www.figma.com/proto/aCtVNm5U7a7kZBKAJvdYQa/Untitled?node-id=44-71&node-type=canvas&t=kkwnLwrwcQejlHRc-1&scaling=scale-down&content-scaling=fixed&page-id=33%3A42&starting-point-node-id=44%3A71).


