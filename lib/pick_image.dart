import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/*
 * Created by riyadi rb on 2/5/2020.
 * link  : https://github.com/xrb21/flutter-html-editor
 */

typedef void CallbackValue(dynamic value);

class PickImage extends StatelessWidget {
  final CallbackValue callbackFile;
  final Color color;

  PickImage({this.callbackFile, this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ListTile(
                  leading: Icon(
                    Icons.linked_camera,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: const Text('Take a picture'),

                  // contentPadding: EdgeInsets.zero,
                  onTap: () {
                    getImage(true);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.image,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: const Text('Pick from gallery'),
                  // contentPadding: EdgeInsets.zero,
                  onTap: () {
                    getImage(false);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future getImage(bool isKamera) async {
    var image = await ImagePicker.pickImage(
      source: isKamera ? ImageSource.camera : ImageSource.gallery,
      maxWidth: 800.0,
      maxHeight: 600.0,
    );

    if (image != null) {
      callbackFile(image);
    }
  }
}
