import 'package:flutter/material.dart';
import 'package:flutter_supabase/main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UploadImages extends StatefulWidget {
  const UploadImages({super.key});

  @override
  UploadImagesState createState() => UploadImagesState();
}

class UploadImagesState extends State<UploadImages> {
  bool _isLoading = false;
  String imageUrl = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Image'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            if (imageUrl.isEmpty)
              Container(
                width: 200,
                height: 200,
                color: Colors.yellow,
                child: Center(child: Text('No image selected')),
              )
            else
              Image.network(
                imageUrl,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),

            ElevatedButton(
              onPressed: _isLoading ? null : _upload,
              child: Text('Upload image'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _upload() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 400,
      maxWidth: 400,
    );
    if (imageFile == null) {
      return;
    }
    setState(() {
      _isLoading = true;
    });

    try {
      final bytes = await imageFile.readAsBytes();
      final fileExt = imageFile.path.split('.').last;
      final fileName = '${DateTime.now().millisecondsSinceEpoch}.$fileExt';
      final filePath = fileName;

      await supabase.storage
          .from('images')
          .uploadBinary(
            filePath,
            bytes,
            fileOptions: FileOptions(contentType: imageFile.mimeType),
          );
      final imageUrlResponse = await supabase.storage
          .from('images')
          .createSignedUrl(filePath, 60);
      setState(() {
        imageUrl = imageUrlResponse;
      });
    } on StorageException catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Unexpected error: $error'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }
}
