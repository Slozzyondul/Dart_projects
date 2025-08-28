import 'package:shelf_core_example/shelf_core_example.dart'
    as shelf_core_example;

void main(List<String> arguments) async {
  print('🚀 Starting Shelf Core Example Server...');

  // Create and start the server
  final server = shelf_core_example.ShelfCoreExample();
  await server.start(port: 8080);

  print('✅ Server is running! Press Ctrl+C to stop.');

  // Keep the server running
  await Future.delayed(Duration.zero);
}
