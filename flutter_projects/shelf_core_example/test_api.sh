#!/bin/bash

# Shelf Core Example - API Test Script
# This script demonstrates all the features of the Shelf server

echo "🚀 Testing Shelf Core Example Server"
echo "====================================="

# Start the server in the background
echo "Starting server..."
dart run bin/shelf_core_example.dart &
SERVER_PID=$!

# Wait for server to start
sleep 3

echo ""
echo "📋 Testing API Endpoints"
echo "========================"

# Test 1: Home page (should return HTML)
echo "1. Testing home page..."
curl -s http://localhost:8080/ | grep -q "Shelf Core Example" && echo "✅ Home page works" || echo "❌ Home page failed"

# Test 2: About page
echo "2. Testing about page..."
curl -s http://localhost:8080/about | grep -q "About Shelf" && echo "✅ About page works" || echo "❌ About page failed"

# Test 3: Dynamic route with parameters
echo "3. Testing dynamic route..."
RESPONSE=$(curl -s http://localhost:8080/greet/Alice)
echo "   Response: $RESPONSE"
if [[ "$RESPONSE" == *"Hello, Alice"* ]]; then
    echo "✅ Dynamic route works"
else
    echo "❌ Dynamic route failed"
fi

# Test 4: Query parameters
echo "4. Testing query parameters..."
RESPONSE=$(curl -s "http://localhost:8080/search?q=flutter")
echo "   Response: $RESPONSE"
if [[ "$RESPONSE" == *"flutter"* ]]; then
    echo "✅ Query parameters work"
else
    echo "❌ Query parameters failed"
fi

# Test 5: JSON API - Get users
echo "5. Testing JSON API (GET users)..."
RESPONSE=$(curl -s http://localhost:8080/api/users)
echo "   Response: $RESPONSE"
if [[ "$RESPONSE" == *"users"* ]]; then
    echo "✅ JSON API GET works"
else
    echo "❌ JSON API GET failed"
fi

# Test 6: JSON API - Create user
echo "6. Testing JSON API (POST user)..."
RESPONSE=$(curl -s -X POST http://localhost:8080/api/users \
  -H "Content-Type: application/json" \
  -d '{"name": "Test User", "email": "test@example.com"}')
echo "   Response: $RESPONSE"
if [[ "$RESPONSE" == *"created successfully"* ]]; then
    echo "✅ JSON API POST works"
else
    echo "❌ JSON API POST failed"
fi

# Test 7: Get specific user
echo "7. Testing specific user endpoint..."
RESPONSE=$(curl -s http://localhost:8080/api/users/1)
echo "   Response: $RESPONSE"
if [[ "$RESPONSE" == *"user"* ]]; then
    echo "✅ Specific user endpoint works"
else
    echo "❌ Specific user endpoint failed"
fi

# Test 8: CRUD operations
echo "8. Testing CRUD operations..."
echo "   Getting items..."
curl -s http://localhost:8080/items > /dev/null && echo "   ✅ GET items works" || echo "   ❌ GET items failed"

echo "   Creating item..."
RESPONSE=$(curl -s -X POST http://localhost:8080/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "price": 99.99}')
echo "   Response: $RESPONSE"
if [[ "$RESPONSE" == *"created successfully"* ]]; then
    echo "   ✅ POST item works"
else
    echo "   ❌ POST item failed"
fi

echo "   Updating item..."
RESPONSE=$(curl -s -X PUT http://localhost:8080/items/1 \
  -H "Content-Type: application/json" \
  -d '{"name": "Updated Item", "price": 149.99}')
echo "   Response: $RESPONSE"
if [[ "$RESPONSE" == *"updated successfully"* ]]; then
    echo "   ✅ PUT item works"
else
    echo "   ❌ PUT item failed"
fi

echo "   Deleting item..."
RESPONSE=$(curl -s -X DELETE http://localhost:8080/items/1)
echo "   Response: $RESPONSE"
if [[ "$RESPONSE" == *"deleted successfully"* ]]; then
    echo "   ✅ DELETE item works"
else
    echo "   ❌ DELETE item failed"
fi

# Test 9: Static file serving
echo "9. Testing static file serving..."
RESPONSE=$(curl -s http://localhost:8080/index.html)
if [[ "$RESPONSE" == *"Static File Serving"* ]]; then
    echo "✅ Static file serving works"
else
    echo "❌ Static file serving failed"
fi

echo ""
echo "🎉 All tests completed!"
echo "======================"

# Stop the server
echo "Stopping server..."
kill $SERVER_PID 2>/dev/null
wait $SERVER_PID 2>/dev/null

echo "✅ Server stopped"
echo ""
echo "💡 To run the server manually:"
echo "   dart run bin/shelf_core_example.dart"
echo ""
echo "💡 Then visit:"
echo "   http://localhost:8080 - Main page"
echo "   http://localhost:8080/about - About page"
echo "   http://localhost:8080/index.html - Static file" 