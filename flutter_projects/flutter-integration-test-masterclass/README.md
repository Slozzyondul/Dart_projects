# FLUTTER INTEGRATION TEST MASTERCLASS STARTER PROJECT

## Mini Mart

Use this project to learn how to write a complete integration test for your Flutter app.

### STEP 1: Install the dependencies
```bash
flutter pub get
```

### STEP 2: Generate language files
```bash
flutter gen-l10n
```

### STEP 3: Start The Server
Based on your operating system (OS) run one of the command below in your terminal from the root of this project to start the built-in server.
```bash
./run/mac-server
# or
./run/linux-server
# or
./run/windows-server.exe
```
The server will log some output. Please go through them.

### STEP 4 (optional): Update Your Base Url
If required replace the baseUrl on `lib/app_config.dart` from `localhost` to the url with the `IP Address`.
*(!! only required for a physical device.)*

### STEP 5: Install Required VSCode Extensions
Name: **Flutter**
Publisher: Dart Code
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter

Name: **Dart**
Publisher: Dart Code
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code