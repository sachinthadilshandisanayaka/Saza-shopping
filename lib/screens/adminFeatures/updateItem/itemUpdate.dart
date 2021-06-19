import 'package:sazashopping/models/imageUploadImage.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/services/database.dart';
import 'package:sazashopping/services/uploadImage.dart';

class ItemUpdate {
  final MainItems mainItems;
  final List<Object> images;
  ItemUpdate({this.mainItems, this.images});

  List<String> imgurl = new List();

  Future imageUpload() async {
    for (var image in images) {
      if (image is ImageUploadModel) {
        ImageUploadModel ium = image;
        if (image.imageUrl == '') {
          await uploadImage(
            category: mainItems.subCat,
            mainCat: mainItems.subCat,
            file: ium,
          );
        }
        imgurl.add(
            image.imageUrl == '' ? ium.imageUrl.toString() : image.imageUrl);
      }
    }
  }

  Future updatingUserInputs() async {
    mainItems.images = [];
    mainItems.images.addAll(imgurl);
    dynamic result = await DataBaseService(uid: this.mainItems.itemId)
        .updateItem(mainItems, mainItems.subCat, mainItems.mainCat);
    print(result.toString());
    return true;
  }
}
