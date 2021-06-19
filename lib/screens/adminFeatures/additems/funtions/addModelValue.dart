import 'package:sazashopping/models/imageUploadImage.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/services/database.dart';
import 'package:sazashopping/services/uploadImage.dart';

class StroreItemDatabase {
  final MainItems mainItems;
  final List<Object> images;
  StroreItemDatabase({this.mainItems, this.images});
  List<String> imgurl = new List();

  Future imageUpload() async {
    for (var image in images) {
      if (image is ImageUploadModel) {
        ImageUploadModel ium = image;
        await uploadImage(
          category: this.mainItems.subCat,
          mainCat: this.mainItems.mainCat,
          file: ium,
        );
        imgurl.add(ium.imageUrl.toString());
      }
    }
  }

  Future uploadUserData() async {
    this.mainItems.images.addAll(imgurl);
    dynamic result =
        await DataBaseService(mainItems: this.mainItems).uploadItem();
    print("result :" + result.toString());
    return true;
  }
}
