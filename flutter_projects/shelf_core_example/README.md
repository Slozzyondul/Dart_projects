# 🚀 Shelf Core Example

A comprehensive example demonstrating how to use **Shelf** - a web server middleware for Dart.

## What is Shelf?

Shelf is a web server middleware for Dart that makes it easy to create web applications. It provides:

- **Middleware Pipeline**: Chain multiple middleware functions together
- **Routing**: Easy-to-use router with parameter support  
- **Static Files**: Serve static files like HTML, CSS, JS
- **CORS Support**: Built-in CORS headers middleware
- **Flexible Responses**: Return JSON, HTML, text, or custom responses

## 🏃‍♂️ Quick Start

1. **Install dependencies:**
   ```bash
   dart pub get
   ```

2. **Run the server:**
   ```bash
   dart run bin/shelf_core_example.dart
   ```

3. **Open your browser:**
   - Main server: http://localhost:8080
   - Static files: http://localhost:8080/index.html

## 📋 Available Endpoints

### HTML Pages
- `GET /` - Home page with API documentation
- `GET /about` - About page explaining Shelf features
- `GET /greet/<name>` - Dynamic greeting with URL parameters

### JSON API
- `GET /api/users` - Get all users
- `POST /api/users` - Create a new user
- `GET /api/users/<id>` - Get specific user

### Search & Query Parameters
- `GET /search?q=<query>` - Search with query parameters

### CRUD Operations
- `GET /items` - Get all items
- `POST /items` - Create an item
- `PUT /items/<id>` - Update an item
- `DELETE /items/<id>` - Delete an item

## 🔧 Key Concepts Demonstrated

### 1. **Routing with shelf_router**
```dart
final router = Router();
router.get('/', _handleHome);
router.post('/api/users', _handleCreateUser);
router.get('/api/users/<id>', _handleGetUser);
```

### 2. **Middleware Pipeline**
```dart
final pipeline = const Pipeline()
    .addMiddleware(corsHeaders()) // Enable CORS
    .addMiddleware(_loggingMiddleware) // Custom logging
    .addMiddleware(_errorHandlingMiddleware); // Error handling
```

### 3. **Static File Serving**
```dart
final staticHandler = createStaticHandler('public', defaultDocument: 'index.html');
```

### 4. **Request/Response Handling**
```dart
Response _handleGreet(Request request) {
  final name = request.params['name'] ?? 'Anonymous';
  return Response.ok('Hello, $name!');
}
```

### 5. **JSON API Responses**
```dart
Response _handleGetUsers(Request request) {
  final users = [/* user data */];
  return Response.ok(
    jsonEncode({'users': users}),
    headers: {'content-type': 'application/json'},
  );
}
```

## 🧪 Testing the API

### Using curl:

**Get all users:**
```bash
curl http://localhost:8080/api/users
```

**Create a user:**
```bash
curl -X POST http://localhost:8080/api/users \
  -H "Content-Type: application/json" \
  -d '{"name": "John Doe", "email": "john@example.com"}'
```

**Get specific user:**
```bash
curl http://localhost:8080/api/users/1
```

**Search with query:**
```bash
curl "http://localhost:8080/search?q=shelf"
```

### Using your browser:
- Visit http://localhost:8080 to see the interactive documentation
- Try the JavaScript example in the browser console

## 📁 Project Structure

```
shelf_core_example/
├── bin/
│   └── shelf_core_example.dart    # Main entry point
├── lib/
│   └── shelf_core_example.dart    # Core server implementation
├── public/
│   └── index.html                 # Static file example
├── test/
│   └── shelf_core_example_test.dart
└── pubspec.yaml                   # Dependencies
```

## 🔍 Understanding the Code

### Server Setup
The `ShelfCoreExample` class demonstrates:
- **Router configuration** with different HTTP methods
- **Middleware pipeline** for cross-cutting concerns
- **Static file serving** alongside dynamic routes
- **Error handling** and logging

### Route Handlers
Each handler shows different response types:
- **HTML responses** with proper content-type headers
- **JSON API responses** for REST endpoints
- **Text responses** for simple data
- **Error responses** with appropriate status codes

### Middleware
Custom middleware demonstrates:
- **Request logging** with timing information
- **Error handling** to catch and format exceptions
- **CORS headers** for cross-origin requests

## 🚀 Next Steps

1. **Add Database Integration**: Connect to PostgreSQL, MongoDB, or SQLite
2. **Authentication**: Implement JWT or session-based auth
3. **Validation**: Add request validation middleware
4. **Testing**: Write integration tests for your API
5. **Deployment**: Deploy to cloud platforms like Google Cloud Run

## 📚 Learn More

- [Shelf Documentation](https://pub.dev/packages/shelf)
- [shelf_router Documentation](https://pub.dev/packages/shelf_router)
- [Dart Web Development Guide](https://dart.dev/web)

---

**Happy coding with Shelf! 🎉**
