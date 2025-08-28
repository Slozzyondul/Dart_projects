import 'dart:io';
import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';
import 'package:shelf_static/shelf_static.dart';

/// A simple Shelf web server example demonstrating:
/// - Basic routing
/// - Middleware usage
/// - Different response types (JSON, HTML, text)
/// - CORS handling
/// - Static file serving
/// - Request/response handling

class ShelfCoreExample {
  late final Router _router;
  late final Pipeline _pipeline;

  ShelfCoreExample() {
    _router = Router();
    _setupRoutes();
    _setupMiddleware();
  }

  void _setupRoutes() {
    // Basic GET route
    _router.get('/', _handleHome);

    // JSON API routes
    _router.get('/api/users', _handleGetUsers);
    _router.post('/api/users', _handleCreateUser);
    _router.get('/api/users/<id>', _handleGetUser);

    // HTML route
    _router.get('/about', _handleAbout);

    // Dynamic route with parameters
    _router.get('/greet/<name>', _handleGreet);

    // Route that accepts query parameters
    _router.get('/search', _handleSearch);

    // Route that demonstrates different HTTP methods
    _router.get('/items', _handleGetItems);
    _router.post('/items', _handleCreateItem);
    _router.put('/items/<id>', _handleUpdateItem);
    _router.delete('/items/<id>', _handleDeleteItem);
  }

  void _setupMiddleware() {
    // Create a pipeline with middleware
    _pipeline = const Pipeline().addMiddleware(corsHeaders()); // Enable CORS
  }

  /// Start the server
  Future<HttpServer> start({int port = 8080}) async {
    // Create a handler that combines static file serving with our router
    final handler = Cascade()
        .add(_createStaticHandler())
        .add(_pipeline.addHandler(_router.call))
        .handler;

    final server = await io.serve(handler, InternetAddress.anyIPv4, port);

    print('🚀 Shelf server running on http://localhost:$port');
    print('📁 Static files served from: /public');
    print('🔗 Available routes:');
    print('   GET  /                    - Home page');
    print('   GET  /about               - About page');
    print('   GET  /greet/<name>        - Greet someone');
    print('   GET  /search?q=<query>    - Search with query params');
    print('   GET  /api/users           - Get all users');
    print('   POST /api/users           - Create a user');
    print('   GET  /api/users/<id>      - Get specific user');
    print('   GET  /items               - Get all items');
    print('   POST /items               - Create an item');
    print('   PUT  /items/<id>          - Update an item');
    print('   DELETE /items/<id>        - Delete an item');

    return server;
  }

  /// Create a static file handler for serving files from /public directory
  Handler _createStaticHandler() {
    return createStaticHandler('public', defaultDocument: 'index.html');
  }

  // ===== Route Handlers =====

  Response _handleHome(Request request) {
    final html = '''
<!DOCTYPE html>
<html>
<head>
    <title>Shelf Core Example</title>
    <style>
        body { font-family: Arial, sans-serif; max-width: 800px; margin: 0 auto; padding: 20px; }
        .endpoint { background: #f5f5f5; padding: 10px; margin: 10px 0; border-radius: 5px; }
        .method { font-weight: bold; color: #007cba; }
        .url { font-family: monospace; color: #333; }
    </style>
</head>
<body>
    <h1>🚀 Shelf Core Example</h1>
    <p>Welcome to your Shelf web server! This demonstrates various Shelf features.</p>
    
    <h2>Available Endpoints:</h2>
    <div class="endpoint">
        <span class="method">GET</span> <span class="url">/</span> - This page
    </div>
    <div class="endpoint">
        <span class="method">GET</span> <span class="url">/about</span> - About page
    </div>
    <div class="endpoint">
        <span class="method">GET</span> <span class="url">/greet/YourName</span> - Greet someone
    </div>
    <div class="endpoint">
        <span class="method">GET</span> <span class="url">/search?q=hello</span> - Search with query
    </div>
    <div class="endpoint">
        <span class="method">GET</span> <span class="url">/api/users</span> - Get all users (JSON)
    </div>
    <div class="endpoint">
        <span class="method">POST</span> <span class="url">/api/users</span> - Create a user (JSON)
    </div>
    <div class="endpoint">
        <span class="method">GET</span> <span class="url">/api/users/1</span> - Get specific user
    </div>
    
    <h2>Try it out:</h2>
    <p>Use curl, Postman, or your browser to test these endpoints!</p>
    
    <script>
        // Example of calling the API
        fetch('/api/users')
            .then(response => response.json())
            .then(data => console.log('Users:', data))
            .catch(error => console.error('Error:', error));
    </script>
</body>
</html>
    ''';

    return Response.ok(html, headers: {'content-type': 'text/html'});
  }

  Response _handleAbout(Request request) {
    final html = '''
<!DOCTYPE html>
<html>
<head>
    <title>About - Shelf Core Example</title>
    <style>
        body { font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px; }
        .feature { background: #e8f4fd; padding: 15px; margin: 10px 0; border-radius: 5px; }
    </style>
</head>
<body>
    <h1>About Shelf</h1>
    <p>Shelf is a web server middleware for Dart that makes it easy to create web applications.</p>
    
    <h2>Key Features:</h2>
    <div class="feature">
        <strong>Middleware Pipeline:</strong> Chain multiple middleware functions together
    </div>
    <div class="feature">
        <strong>Routing:</strong> Easy-to-use router with parameter support
    </div>
    <div class="feature">
        <strong>Static Files:</strong> Serve static files like HTML, CSS, JS
    </div>
    <div class="feature">
        <strong>CORS Support:</strong> Built-in CORS headers middleware
    </div>
    <div class="feature">
        <strong>Flexible Responses:</strong> Return JSON, HTML, text, or custom responses
    </div>
    
    <p><a href="/">← Back to Home</a></p>
</body>
</html>
    ''';

    return Response.ok(html, headers: {'content-type': 'text/html'});
  }

  Response _handleGreet(Request request) {
    final name = request.params['name'] ?? 'Anonymous';
    final message = 'Hello, $name! Welcome to Shelf!';

    return Response.ok(message, headers: {'content-type': 'text/plain'});
  }

  Response _handleSearch(Request request) {
    final query = request.url.queryParameters['q'] ?? '';

    if (query.isEmpty) {
      return Response.badRequest(
        body: 'Query parameter "q" is required',
        headers: {'content-type': 'text/plain'},
      );
    }

    // Simulate search results
    final results = [
      {'id': 1, 'title': 'Shelf Documentation', 'match': query},
      {'id': 2, 'title': 'Dart Web Development', 'match': query},
      {'id': 3, 'title': 'Flutter Backend', 'match': query},
    ];

    return Response.ok(
      jsonEncode({'query': query, 'results': results}),
      headers: {'content-type': 'application/json'},
    );
  }

  Response _handleGetUsers(Request request) {
    // Simulate database users
    final users = [
      {'id': 1, 'name': 'Alice', 'email': 'alice@example.com'},
      {'id': 2, 'name': 'Bob', 'email': 'bob@example.com'},
      {'id': 3, 'name': 'Charlie', 'email': 'charlie@example.com'},
    ];

    return Response.ok(
      jsonEncode({'users': users}),
      headers: {'content-type': 'application/json'},
    );
  }

  Future<Response> _handleCreateUser(Request request) async {
    try {
      final body = await request.readAsString();
      final userData = jsonDecode(body) as Map<String, dynamic>;

      // Validate required fields
      if (!userData.containsKey('name') || !userData.containsKey('email')) {
        return Response.badRequest(
          body: jsonEncode({'error': 'Name and email are required'}),
          headers: {'content-type': 'application/json'},
        );
      }

      // Simulate creating a user (in real app, save to database)
      final newUser = {
        'id': DateTime.now().millisecondsSinceEpoch,
        'name': userData['name'],
        'email': userData['email'],
        'created_at': DateTime.now().toIso8601String(),
      };

      return Response.ok(
        jsonEncode({'user': newUser, 'message': 'User created successfully'}),
        headers: {'content-type': 'application/json'},
      );
    } catch (e) {
      return Response.badRequest(
        body: jsonEncode({'error': 'Invalid JSON format'}),
        headers: {'content-type': 'application/json'},
      );
    }
  }

  Response _handleGetUser(Request request) {
    final id = request.params['id'] ?? '0';

    // Simulate fetching user from database
    final user = {
      'id': int.parse(id),
      'name': 'User $id',
      'email': 'user$id@example.com',
    };

    return Response.ok(
      jsonEncode({'user': user}),
      headers: {'content-type': 'application/json'},
    );
  }

  Response _handleGetItems(Request request) {
    final items = [
      {'id': 1, 'name': 'Item 1', 'price': 10.99},
      {'id': 2, 'name': 'Item 2', 'price': 20.50},
      {'id': 3, 'name': 'Item 3', 'price': 15.75},
    ];

    return Response.ok(
      jsonEncode({'items': items}),
      headers: {'content-type': 'application/json'},
    );
  }

  Future<Response> _handleCreateItem(Request request) async {
    try {
      final body = await request.readAsString();
      final itemData = jsonDecode(body) as Map<String, dynamic>;

      final newItem = {
        'id': DateTime.now().millisecondsSinceEpoch,
        'name': itemData['name'] ?? 'Unknown Item',
        'price': itemData['price'] ?? 0.0,
        'created_at': DateTime.now().toIso8601String(),
      };

      return Response.ok(
        jsonEncode({'item': newItem, 'message': 'Item created successfully'}),
        headers: {'content-type': 'application/json'},
      );
    } catch (e) {
      return Response.badRequest(
        body: jsonEncode({'error': 'Invalid JSON format'}),
        headers: {'content-type': 'application/json'},
      );
    }
  }

  Future<Response> _handleUpdateItem(Request request) async {
    final id = request.params['id'] ?? '0';

    try {
      final body = await request.readAsString();
      final itemData = jsonDecode(body) as Map<String, dynamic>;

      final updatedItem = {
        'id': int.parse(id),
        'name': itemData['name'] ?? 'Updated Item',
        'price': itemData['price'] ?? 0.0,
        'updated_at': DateTime.now().toIso8601String(),
      };

      return Response.ok(
        jsonEncode({
          'item': updatedItem,
          'message': 'Item updated successfully',
        }),
        headers: {'content-type': 'application/json'},
      );
    } catch (e) {
      return Response.badRequest(
        body: jsonEncode({'error': 'Invalid JSON format'}),
        headers: {'content-type': 'application/json'},
      );
    }
  }

  Response _handleDeleteItem(Request request) {
    final id = request.params['id'] ?? '0';

    return Response.ok(
      jsonEncode({'message': 'Item $id deleted successfully'}),
      headers: {'content-type': 'application/json'},
    );
  }

  // ===== Middleware =====

  /// Logging middleware to track requests
  Future<Response> _loggingMiddleware(
    Request request,
    Handler innerHandler,
  ) async {
    final startTime = DateTime.now();
    print(
      '📥 ${request.method} ${request.url} - ${startTime.toIso8601String()}',
    );

    try {
      final response = await innerHandler(request);
      final duration = DateTime.now().difference(startTime);
      print('📤 ${response.statusCode} - ${duration.inMilliseconds}ms');
      return response;
    } catch (e) {
      final duration = DateTime.now().difference(startTime);
      print('❌ Error - ${duration.inMilliseconds}ms: $e');
      rethrow;
    }
  }

  /// Error handling middleware
  Future<Response> _errorHandlingMiddleware(
    Request request,
    Handler innerHandler,
  ) async {
    try {
      return await innerHandler(request);
    } catch (e) {
      print('🚨 Error handling request: $e');
      return Response.internalServerError(
        body: jsonEncode({
          'error': 'Internal server error',
          'message': e.toString(),
        }),
        headers: {'content-type': 'application/json'},
      );
    }
  }
}

/// Legacy function for backward compatibility
int calculate() {
  return 6 * 7;
}
