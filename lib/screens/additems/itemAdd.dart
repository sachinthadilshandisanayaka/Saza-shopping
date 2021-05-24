import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:sazashopping/models/imageUploadImage.dart';
import 'package:sazashopping/screens/additems/customWidget/displayingSelectedCategory.dart';
import 'package:sazashopping/screens/additems/funtions/addModelValue.dart';
import 'package:sazashopping/services/categoryCollection.dart';
import 'package:sazashopping/shared/colors.dart';
import 'package:sazashopping/shared/loading.dart';
import 'package:sazashopping/shared/widget/bottomRightAlignButton.dart';
import 'package:sazashopping/shared/widget/centeredRaiseButton.dart';
import 'package:sazashopping/shared/widget/displayText.dart';
import 'package:sazashopping/shared/widget/dropDownFiled.dart';
import 'package:sazashopping/shared/widget/dropDownItemShowWithRemoveItem.dart';
import 'package:sazashopping/shared/widget/genderSelection.dart';
import 'package:sazashopping/shared/widget/imagePickerCardView.dart';
import 'package:sazashopping/shared/widget/imagePickerNullView.dart';
import 'package:sazashopping/shared/widget/listTextFormField.dart';
import 'package:sazashopping/shared/widget/liteRollingSwitch.dart';
import 'package:sazashopping/shared/widget/sizeBox.dart';
import 'package:sazashopping/shared/widget/stringTextFormField.dart';
import 'package:sazashopping/shared/widget/swithTextFormField.dart';

class ItemAdding extends StatefulWidget {
  @override
  _ItemAddingState createState() => _ItemAddingState();
}

class _ItemAddingState extends State<ItemAdding> {
  final _formKeyAddItem = GlobalKey<FormState>();
  final genderSelected = TextEditingController();
  final formkey = GlobalKey<FormFieldState>();
  final sizeFormkey = GlobalKey<FormFieldState>();

  List<Object> images = List<Object>();
  Future<PickedFile> imageFile;

  String productname;
  String productMaterial;
  String brandName;
  String maleOrFemale;
  String madeCountry;
  String description;
  String selectedCategory;
  String procudeSizeType;

  String tempColor;
  String tempSize;

  int quantity;

  double price;
  double offer;

  List<String> productColors = new List();
  List<String> productSize = new List();
  List<String> productSubCategory = new List();

  Map<String, String> productCategories = new Map();

  bool genderVisibilityDefault;

  bool colorAllreadyAvilable = false;
  bool colorIsNull = false;
  bool genderVisibility = false;
  bool sizeAllreadyAvilable = false;
  bool sizeIsNull = false;
  bool offerVisibility = false;
  bool loading = false;

  changeVisibility(bool visibility, String feild) {
    setState(() {
      if (feild == "gender") {
        genderVisibility = visibility;
      } else if (feild == "offer") {
        offerVisibility = visibility;
      }
    });
  }

  setLoaing(bool val) {
    setState(() {
      loading = val;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: additemPageBackgroundColor,
        appBar: AppBar(
          backgroundColor: appBarColor,
          actions: [],
        ),
        body: loading
            ? Loading()
            : StreamBuilder(
                stream: CategoryDataBaseService().catogories,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    for (var category in snapshot.data) {
                      for (var ct in category.category) {
                        if (!productSubCategory.contains(ct)) {
                          productCategories[ct] = category.name.toString();
                          productSubCategory.add(ct.toString() ?? '');
                        }
                      }
                    }
                  }
                  return SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(15.0),
                    child: Form(
                      key: _formKeyAddItem,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          displayText('Item name'),
                          stringTextFormField(
                              funtion: (val) =>
                                  setInputValue(val, productname)),
                          sizedBox,
                          displayText('Category'),
                          dropDownField(
                            hint: 'Select item category',
                            productSubCategory: productSubCategory,
                            valueChangeFuntion: (value) =>
                                dropDownFieldSelection(value),
                          ),
                          DisplaySelectedCategory(
                              selectedCategory ?? '', productCategories),
                          sizedBox,
                          displayText('Price'),
                          stringTextFormField(
                              textInputType: TextInputType.number,
                              funtion: (val) => setInputDobleValue(val, price)),
                          sizedBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              displayText("Offer"),
                              liteRollingSwith(
                                  changeVisibility: changeVisibility,
                                  type: "offer"),
                            ],
                          ),
                          sizedBox,
                          offerVisibility
                              ? swicthTextField(
                                  hint: 'add offer precentage \'%\'',
                                  funt: (val) => setInputDobleValue(val, offer),
                                  state: offerVisibility,
                                )
                              : SizedBox(),
                          sizedBox,
                          displayText('Material'),
                          stringTextFormField(
                              funtion: (val) =>
                                  setInputValue(val, productMaterial)),
                          sizedBox,
                          displayText('Brand'),
                          stringTextFormField(
                              funtion: (val) => setInputValue(val, brandName)),
                          sizedBox,
                          displayText('Made in'),
                          stringTextFormField(
                              funtion: (val) =>
                                  setInputValue(val, madeCountry)),
                          sizedBox,
                          displayText('Quantity Avilable'),
                          stringTextFormField(
                              textInputType: TextInputType.number,
                              funtion: (val) => setInputValue(val, quantity)),
                          sizedBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              displayText('Gender'),
                              liteRollingSwith(
                                  changeVisibility: changeVisibility,
                                  type: "gender"),
                            ],
                          ),
                          sizedBox,
                          genderVisibility
                              ? selectGender(
                                  text: 'Select gender',
                                  maleOrFemale: maleOrFemale,
                                  funtion: gendetSelection)
                              : SizedBox(),
                          sizedBox,
                          displayText('Add color'),
                          listedTextFormField(
                              formkey: formkey,
                              hint: 'you can add list of colors',
                              funtion: (val) => setInputValue(val, tempColor),
                              isValueNull: colorIsNull,
                              valueIsreadyAvilable: colorAllreadyAvilable),
                          bottomRightAlignButton(
                            context: context,
                            text: 'Add',
                            buttonClickOperation: () => listColorValueChecker(),
                          ),
                          productColors.isNotEmpty
                              ? dropDownSelectedItems(
                                  productColors: productColors,
                                  removeItem: (index) =>
                                      removeColorListItem(index),
                                )
                              : SizedBox(),
                          sizedBox,
                          displayText('Size'),
                          listedTextFormField(
                              formkey: sizeFormkey,
                              hint: 'you can add list of sizes',
                              funtion: (val) => setInputValue(val, tempSize),
                              isValueNull: colorIsNull,
                              valueIsreadyAvilable: colorAllreadyAvilable),
                          bottomRightAlignButton(
                            context: context,
                            text: 'Add',
                            buttonClickOperation: () => listSizeValueChecker(),
                          ),
                          productSize.isNotEmpty
                              ? dropDownSelectedItems(
                                  productColors: productSize,
                                  removeItem: (index) =>
                                      removeSizeListItem(index),
                                )
                              : SizedBox(),
                          sizedBox,
                          displayText('Images'),
                          Container(
                            height: 230,
                            child: Column(
                              verticalDirection: VerticalDirection.up,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Expanded(
                                  child: GridView.count(
                                    shrinkWrap: true,
                                    crossAxisCount: 3,
                                    childAspectRatio: 1,
                                    children:
                                        List.generate(images.length, (index) {
                                      if (images[index] is ImageUploadModel) {
                                        ImageUploadModel uploadModel =
                                            images[index];
                                        return buildCardView(
                                          uploadModel: uploadModel,
                                          cardOnTapFuntion: () =>
                                              removeImage(index),
                                        );
                                      } else {
                                        return defaultCardView(
                                            onpressFuntion: () =>
                                                _onAddImageClick(index));
                                      }
                                    }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          sizedBox,
                          displayText('Description'),
                          stringTextFormField(
                            maxline: 8,
                            funtion: (val) => setInputValue(val, description),
                          ),
                          sizedBox,
                          sizedBox,
                          raiseButtonCenter(
                              lading: (val) => setLoaing(val),
                              globalKey: _formKeyAddItem,
                              buttonLable: 'ADD ITEM',
                              pressBottonFuntion: () async {
                                return await storeItemDataBase(
                                  context,
                                  productname,
                                  _formKeyAddItem,
                                  selectedCategory,
                                  productCategories,
                                  genderVisibility,
                                  maleOrFemale,
                                  productColors,
                                  productSize,
                                  images,
                                  offerVisibility,
                                  offer,
                                  price,
                                  description,
                                  madeCountry,
                                  brandName,
                                  quantity,
                                );
                              },
                              context: context),
                          SizedBox(
                            height: 60,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  void setInputValue(val, variable) {
    setState(() {
      variable = val.trim();
    });
  }

  void setInputDobleValue(String val, variable) {
    setState(() {
      variable = double.parse(val);
    });
  }

  void setInputIntValue(String val, variable) {
    setState(() {
      variable = int.parse(val);
    });
  }

  void gendetSelection(String newValue) {
    setState(() {
      maleOrFemale = newValue;
    });
  }

  void dropDownFieldSelection(String value) {
    setState(() {
      selectedCategory = value;
    });
  }

  void removeSizeListItem(int index) {
    setState(() {
      productSize.removeAt(index);
    });
  }

  void removeColorListItem(int index) {
    setState(() {
      productColors.removeAt(index);
    });
  }

  void listColorValueChecker() {
    if (tempColor == null || tempColor == '') {
      setState(() {
        colorIsNull = true;
      });
    } else if (productColors.contains(tempColor)) {
      setState(() {
        colorAllreadyAvilable = true;
        colorIsNull = false;
      });
    } else {
      setState(() {
        colorAllreadyAvilable = false;
        colorIsNull = false;
        productColors.add(tempColor);
        tempColor = '';
      });
    }
    if (formkey.currentState.validate()) {
      formkey.currentState.reset();
    }
  }

  void listSizeValueChecker() {
    if (tempSize == null || tempSize == '') {
      setState(() {
        sizeIsNull = true;
      });
    } else if (productSize.contains(tempSize)) {
      setState(() {
        sizeAllreadyAvilable = true;
        sizeIsNull = false;
      });
    } else {
      setState(() {
        sizeAllreadyAvilable = false;
        sizeIsNull = false;
        productSize.add(tempSize);
        tempSize = '';
      });
    }
    if (sizeFormkey.currentState.validate()) {
      sizeFormkey.currentState.reset();
    }
  }

  Future _onAddImageClick(int index) async {
    setState(() {
      imageFile = ImagePicker().getImage(source: ImageSource.gallery);
      getFileImage(index);
    });
  }

  void getFileImage(int index) async {
//    var dir = await path_provider.getTemporaryDirectory();
    imageFile.then((file) async {
      if (file != null) {
        setState(() {
          ImageUploadModel imageUpload = new ImageUploadModel();
          imageUpload.isUploaded = false;
          imageUpload.uploading = false;
          imageUpload.imageFile = file;
          imageUpload.imageUrl = '';
          images.replaceRange(index, index + 1, [imageUpload]);
        });
      }
    });
  }

  void removeImage(int index) {
    setState(() {
      images.replaceRange(index, index + 1, ['Add Image']);
    });
  }
}
