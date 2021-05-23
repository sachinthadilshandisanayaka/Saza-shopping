import 'dart:ui';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:sazashopping/models/imageUploadImage.dart';
import 'package:sazashopping/screens/additems/customWidget/displayingSelectedCategory.dart';
import 'package:sazashopping/screens/additems/formValidator/colorValidator.dart';
import 'package:sazashopping/screens/additems/formValidator/sizeValidator.dart';
import 'package:sazashopping/screens/additems/funtions/addModelValue.dart';
import 'package:sazashopping/services/categoryCollection.dart';
import 'package:sazashopping/shared/colors.dart';
import 'package:sazashopping/shared/constant.dart';
import 'package:sazashopping/shared/widget/bottomRightAlignButton.dart';
import 'package:sazashopping/shared/widget/centeredRaiseButton.dart';
import 'package:sazashopping/shared/widget/displayText.dart';
import 'package:sazashopping/shared/widget/dropDownFiled.dart';
import 'package:sazashopping/shared/widget/dropDownItemShowWithRemoveItem.dart';
import 'package:sazashopping/shared/widget/genderSelection.dart';
import 'package:sazashopping/shared/widget/imagePickerCardView.dart';
import 'package:sazashopping/shared/widget/imagePickerNullView.dart';
import 'package:sazashopping/shared/widget/liteRollingSwitch.dart';
import 'package:sazashopping/shared/widget/sizeBox.dart';

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

  changeVisibility(bool visibility, String feild) {
    setState(() {
      if (feild == "gender") {
        genderVisibility = visibility;
      } else if (feild == "offer") {
        offerVisibility = visibility;
      }
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
        body: StreamBuilder(
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
                    TextFormField(
                      decoration: textinputDecoration,
                      onChanged: (val) {
                        setState(() {
                          productname = val.trim();
                        });
                      },
                      validator: (val) {
                        return val.trim().isEmpty ? 'Enter item name' : null;
                      },
                    ),
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
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: textinputDecoration,
                      onChanged: (val) {
                        setState(() {
                          price = double.parse(val);
                        });
                      },
                    ),
                    sizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        displayText("Offer"),
                        liteRollingSwith(
                            changeVisibility: changeVisibility, type: "offer"),
                      ],
                    ),
                    sizedBox,
                    offerVisibility
                        ? TextFormField(
                            decoration: textinputDecoration,
                            onChanged: (val) {
                              setState(() {
                                offer = double.parse(val.trim());
                              });
                            },
                            validator: (val) {
                              if (offerVisibility == true &&
                                  val.trim().isEmpty) {
                                return "add value";
                              } else {
                                return null;
                              }
                            },
                          )
                        : SizedBox(),
                    sizedBox,
                    displayText('Material'),
                    TextFormField(
                      decoration: textinputDecoration,
                      onChanged: (val) {
                        setState(() {
                          productMaterial = val.trim();
                        });
                      },
                      validator: (val) {
                        return val.trim().isEmpty ? 'Enter material' : null;
                      },
                    ),
                    sizedBox,
                    displayText('Brand'),
                    TextFormField(
                      decoration: textinputDecoration,
                      onChanged: (val) {
                        setState(() {
                          brandName = val.trim();
                        });
                      },
                      validator: (val) {
                        return val.trim().isEmpty ? 'Enter Brand' : null;
                      },
                    ),
                    sizedBox,
                    displayText('Made in'),
                    TextFormField(
                      decoration: textinputDecoration,
                      onChanged: (val) {
                        setState(() {
                          madeCountry = val.trim();
                        });
                      },
                      validator: (val) {
                        return val.trim().isEmpty ? 'Enter Country' : null;
                      },
                    ),
                    sizedBox,
                    displayText('Quantity Avilable'),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: textinputDecoration,
                      onChanged: (val) {
                        setState(() {
                          quantity = int.parse(val);
                        });
                      },
                      validator: (val) {
                        return val.trim().isEmpty ? 'Add quantity' : null;
                      },
                    ),
                    sizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        displayText('Gender'),
                        liteRollingSwith(
                            changeVisibility: changeVisibility, type: "gender"),
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
                    new TextFormField(
                      key: formkey,
                      decoration: textinputDecoration.copyWith(
                          hintText: 'you can add list of colors',
                          hintStyle: TextStyle(fontFamily: 'Baloo2')),
                      onChanged: (val) {
                        setState(() {
                          tempColor = val.trim();
                        });
                      },
                      validator: (val) {
                        return colorValidate(
                            colorIsNull, colorAllreadyAvilable);
                      },
                    ),
                    bottomRightAlignButton(
                      context: context,
                      text: 'Add',
                      buttonClickOperation: () => listColorValueChecker(),
                    ),
                    productColors.isNotEmpty
                        ? dropDownSelectedItems(
                            productColors: productColors,
                            removeItem: (index) => removeColorListItem(index),
                          )
                        : SizedBox(),
                    sizedBox,
                    displayText('Size'),
                    new TextFormField(
                      key: sizeFormkey,
                      decoration: textinputDecoration.copyWith(
                          hintText: 'you can add list of sizes',
                          hintStyle: TextStyle(fontFamily: 'Baloo2')),
                      onChanged: (val) {
                        setState(() {
                          tempSize = val.trim();
                        });
                      },
                      validator: (val) {
                        return sizeValidate(sizeIsNull, sizeAllreadyAvilable);
                      },
                    ),
                    bottomRightAlignButton(
                      context: context,
                      text: 'Add',
                      buttonClickOperation: () => listSizeValueChecker(),
                    ),
                    productSize.isNotEmpty
                        ? dropDownSelectedItems(
                            productColors: productSize,
                            removeItem: (index) => removeSizeListItem(index),
                          )
                        : SizedBox(),
                    sizedBox,
                    displayText('Images'),
                    Container(
                      height: 250,
                      child: Column(
                        verticalDirection: VerticalDirection.up,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                            child: GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 3,
                              childAspectRatio: 1,
                              children: List.generate(images.length, (index) {
                                if (images[index] is ImageUploadModel) {
                                  ImageUploadModel uploadModel = images[index];
                                  return buildCardView(
                                    uploadModel: uploadModel,
                                    cardOnTapFuntion: () => removeImage(index),
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
                    TextFormField(
                      decoration: textinputDecoration,
                      maxLines: 6,
                      onChanged: (val) {
                        setState(() {
                          description = val.trim();
                        });
                      },
                      validator: (val) {
                        return val.trim().isEmpty
                            ? 'Add your description'
                            : null;
                      },
                    ),
                    sizedBox,
                    sizedBox,
                    RaiseButtonCenter(
                      pressBottonFuntion: () => storeItemDataBase(
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
                      ),
                      buttonLable: 'ADD ITEM',
                    ),
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

  void gendetSelection(String newValue) {
    setState(() {
      maleOrFemale = newValue;
    });
  }

  void dropDownFieldSelection(value) {
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
