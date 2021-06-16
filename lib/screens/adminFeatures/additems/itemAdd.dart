import 'dart:ui';

import 'package:dropdownfield/dropdownfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:sazashopping/models/imageUploadImage.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/adminFeatures/additems/customWidget/displayingSelectedCategory.dart';
import 'package:sazashopping/screens/adminFeatures/additems/formValidator/multiValueValidator.dart';
import 'package:sazashopping/screens/adminFeatures/additems/formValidator/stringValidator.dart';
import 'package:sazashopping/screens/adminFeatures/additems/formValidator/swithValidator.dart';
import 'package:sazashopping/screens/adminFeatures/additems/funtions/addModelValue.dart';
import 'package:sazashopping/screens/adminFeatures/updateItem/itemUpdate.dart';
import 'package:sazashopping/shared/constant.dart';
import 'package:sazashopping/shared/uploadLoading.dart';
import 'package:sazashopping/shared/widget/bottomRightAlignButton.dart';
import 'package:sazashopping/shared/widget/centeredRaiseButton.dart';
import 'package:sazashopping/shared/widget/displayText.dart';
import 'package:sazashopping/shared/widget/dropDownItemShowWithRemoveItem.dart';
import 'package:sazashopping/shared/widget/genderSelection.dart';
import 'package:sazashopping/shared/widget/imagePickerCardView.dart';
import 'package:sazashopping/shared/widget/imagePickerNullView.dart';
import 'package:sazashopping/shared/widget/liteRollingSwitch.dart';
import 'package:sazashopping/shared/widget/sizeBox.dart';

class ItemAdding extends StatefulWidget {
  final List<String> subCategory;
  final Map<String, String> mainCategories;
  final MainItems mainItems;
  ItemAdding({
    @required this.subCategory,
    @required this.mainCategories,
    this.mainItems,
  });
  @override
  _ItemAddingState createState() => _ItemAddingState();
}

class _ItemAddingState extends State<ItemAdding> {
  final _formKeyAddItem = GlobalKey<FormState>();
  final genderSelected = TextEditingController();
  final formkey = GlobalKey<FormFieldState>();
  final sizeFormkey = GlobalKey<FormFieldState>();

  MainItems updatedMainItem = new MainItems();

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

  bool genderVisibilityDefault;

  bool colorAllreadyAvilable = false;
  bool sizeAllreadyAvilable = false;
  bool offerVisibility = false;
  bool genderVisibility = false;
  bool loading = false;

  bool ismainItemAvalible;

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
    super.initState();
    setState(() {
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
    });
    if (widget.mainItems != null) {
      setState(() {
        updatedMainItem = widget.mainItems;
      });
      _updateItem();
    } else {
      setState(() {
        ismainItemAvalible = false;
      });
    }
  }

  _updateItem() {
    setState(() {
      ismainItemAvalible = true;
      selectedCategory = widget.mainItems.subCat;
      if (widget.mainItems.offer == 0.0) {
        offerVisibility = false;
      } else {
        offerVisibility = true;
      }
      if (widget.mainItems.gender != '') {
        genderVisibility = true;
        maleOrFemale = widget.mainItems.gender;
      } else {
        maleOrFemale = '';
        genderVisibility = false;
      }
      if (widget.mainItems.color.isNotEmpty) {
        productColors.addAll(widget.mainItems.color);
      }
      if (widget.mainItems.size.isNotEmpty) {
        productSize.addAll(widget.mainItems.size);
      }
      if (widget.mainItems.images.isNotEmpty) {
        for (var i = 0; i < widget.mainItems.images.length; i++) {
          ImageUploadModel imageUpload = new ImageUploadModel();
          imageUpload.isUploaded = false;
          imageUpload.uploading = false;
          imageUpload.imageFile = PickedFile('');
          imageUpload.imageUrl = widget.mainItems.images[i];
          images.replaceRange(i, i + 1, [imageUpload]);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? UploadLoading()
        : SingleChildScrollView(
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
                    style: TextStyle(fontWeight: FontWeight.bold),
                    initialValue:
                        ismainItemAvalible ? widget.mainItems.name : '',
                    decoration: textinputDecoration,
                    onChanged: (val) {
                      setState(() {
                        productname = val.trim();
                        updatedMainItem.name = val.trim();
                      });
                    },
                    validator: (val) => checkValue(val),
                  ),
                  sizedBox,
                  displayText('Category'),
                  DropDownField(
                    hintText: 'Select item categor',
                    textStyle: inputFormTextStyle,
                    enabled: true,
                    value: ismainItemAvalible ? widget.mainItems.subCat : '',
                    items: widget.subCategory,
                    itemsVisibleInDropdown: 5,
                    onValueChanged: (value) {
                      setState(() {
                        selectedCategory = value;
                        updatedMainItem.subCat = value;
                      });
                    },
                  ),
                  DisplaySelectedCategory(
                    selectedCategory ?? '',
                    widget.mainCategories,
                  ),
                  sizedBox,
                  displayText('Price'),
                  TextFormField(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.number,
                    decoration: textinputDecoration,
                    initialValue:
                        ismainItemAvalible ? widget.mainItems.price : '',
                    onChanged: (val) {
                      setState(() {
                        price = double.parse(val.trim());
                        updatedMainItem.price = val.trim();
                      });
                    },
                    validator: (val) => checkValue(val),
                  ),
                  sizedBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      displayText("Offer"),
                      liteRollingSwith(
                          changeVisibility: changeVisibility,
                          type: "offer",
                          ismainItemAvalible: offerVisibility),
                    ],
                  ),
                  sizedBox,
                  offerVisibility
                      ? TextFormField(
                          style: TextStyle(fontWeight: FontWeight.bold),
                          initialValue: offerVisibility
                              ? ismainItemAvalible
                                  ? widget.mainItems.offer.toString()
                                  : ''
                              : '',
                          keyboardType: TextInputType.number,
                          decoration: textinputDecoration.copyWith(
                              hintText: 'add offer precentage \'%\''),
                          onChanged: (val) {
                            setState(() {
                              offer = double.parse(val);
                              updatedMainItem.offer = double.parse(val);
                            });
                          },
                          validator: (val) =>
                              checkValueSwith(val, offerVisibility),
                        )
                      : SizedBox(),
                  sizedBox,
                  displayText('Material'),
                  TextFormField(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    initialValue:
                        ismainItemAvalible ? widget.mainItems.material : '',
                    decoration: textinputDecoration,
                    onChanged: (val) {
                      setState(() {
                        productMaterial = val.trim();
                        updatedMainItem.material = val.trim();
                      });
                    },
                    validator: (val) => checkValue(val),
                  ),
                  sizedBox,
                  displayText('Brand'),
                  TextFormField(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    initialValue:
                        ismainItemAvalible ? widget.mainItems.brand : '',
                    decoration: textinputDecoration,
                    onChanged: (val) {
                      setState(() {
                        brandName = val.trim();
                        updatedMainItem.brand = val.trim();
                      });
                    },
                    validator: (val) => checkValue(val),
                  ),
                  sizedBox,
                  displayText('Made in'),
                  TextFormField(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    initialValue:
                        ismainItemAvalible ? widget.mainItems.country : '',
                    decoration: textinputDecoration,
                    onChanged: (val) {
                      setState(() {
                        madeCountry = val.trim();
                        updatedMainItem.country = val.trim();
                      });
                    },
                    validator: (val) => checkValue(val),
                  ),
                  sizedBox,
                  displayText('Quantity Avilable'),
                  TextFormField(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    initialValue: ismainItemAvalible
                        ? widget.mainItems.quantity.toString()
                        : '',
                    decoration: textinputDecoration,
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      setState(() {
                        quantity = int.parse(val.trim());
                        updatedMainItem.quantity = int.parse(val.trim());
                      });
                    },
                    validator: (val) => checkValue(val),
                  ),
                  sizedBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      displayText('Gender'),
                      liteRollingSwith(
                          changeVisibility: changeVisibility,
                          type: "gender",
                          ismainItemAvalible: genderVisibility),
                    ],
                  ),
                  sizedBox,
                  genderVisibility
                      ? selectGender(
                          text: 'Select gender',
                          maleOrFemale: maleOrFemale,
                          funtion: (value) {
                            setState(() {
                              maleOrFemale = value;
                              updatedMainItem.gender = value;
                            });
                          })
                      : SizedBox(),
                  sizedBox,
                  displayText('Add color'),
                  TextFormField(
                    key: formkey,
                    decoration: textinputDecoration.copyWith(
                        hintText: 'you can add list of sizes'),
                    onChanged: (val) {
                      return setState(() {
                        tempColor = val.trim();
                      });
                    },
                    validator: (val) {
                      return swicthValidate(colorAllreadyAvilable);
                    },
                  ),
                  bottomRightAlignButton(
                    context: context,
                    text: 'Add',
                    buttonClickOperation: () {
                      if (tempColor.isNotEmpty) {
                        if (productColors.contains(tempColor)) {
                          setState(() {
                            colorAllreadyAvilable = true;
                          });
                        } else {
                          setState(() {
                            colorAllreadyAvilable = false;
                            productColors.add(tempColor);
                            if (ismainItemAvalible) {
                              updatedMainItem.color.add(tempColor);
                            }
                            tempColor = '';
                          });
                        }
                      }

                      if (formkey.currentState.validate()) {
                        formkey.currentState.reset();
                      }
                    },
                  ),
                  productColors.isNotEmpty
                      ? dropDownSelectedItems(
                          productColors: productColors,
                          removeItem: (index) => removeColorListItem(index),
                        )
                      : SizedBox(),
                  sizedBox,
                  displayText('Add Size'),
                  TextFormField(
                    key: sizeFormkey,
                    decoration: textinputDecoration.copyWith(
                        hintText: 'you can add list of sizes'),
                    onChanged: (val) {
                      return setState(() {
                        tempSize = val.trim();
                      });
                    },
                    validator: (val) {
                      return swicthValidate(sizeAllreadyAvilable);
                    },
                  ),
                  bottomRightAlignButton(
                    context: context,
                    text: 'Add',
                    buttonClickOperation: () {
                      if (tempSize.isNotEmpty) {
                        if (productSize.contains(tempSize)) {
                          setState(() {
                            sizeAllreadyAvilable = true;
                          });
                        } else {
                          setState(() {
                            sizeAllreadyAvilable = false;
                            productSize.add(tempSize);
                            if (ismainItemAvalible) {
                              updatedMainItem.size.add(tempSize);
                            }
                            tempSize = '';
                          });
                        }
                      }
                      if (sizeFormkey.currentState.validate()) {
                        sizeFormkey.currentState.reset();
                      }
                    },
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
                    height: 230,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                          child: GridView.count(
                            shrinkWrap: false,
                            crossAxisCount: 2,
                            childAspectRatio: 1,
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              images.length,
                              (index) {
                                if (images[index] is ImageUploadModel) {
                                  ImageUploadModel uploadModel = images[index];
                                  return ImageGetingCarView(
                                    uploadModel: uploadModel,
                                    cardOnTapFuntion: () => removeImage(index),
                                  );
                                } else {
                                  return defaultCardView(
                                      onpressFuntion: () =>
                                          _onAddImageClick(index));
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  sizedBox,
                  displayText('Description'),
                  TextFormField(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    initialValue:
                        ismainItemAvalible ? widget.mainItems.description : '',
                    maxLines: 8,
                    decoration: textinputDecoration,
                    onChanged: (val) {
                      setState(() {
                        description = val.trim();
                        updatedMainItem.description = val.trim();
                      });
                    },
                    validator: (val) => checkValue(val),
                  ),
                  sizedBox,
                  sizedBox,
                  ismainItemAvalible
                      ? RaiseButtonCenter(
                          buttonLable: 'UPDATE ITEM',
                          pressBottonFuntion: () async {
                            setLoaing(true);
                            if (_formKeyAddItem.currentState.validate()) {
                              try {
                                ItemUpdate itemUpdate = ItemUpdate(
                                    mainItems: updatedMainItem, images: images);
                                await itemUpdate.imageUpload();
                                dynamic result =
                                    await itemUpdate.updatingUserInputs();
                                if (result) {
                                  setLoaing(false);
                                  Navigator.of(context).pop();
                                }
                              } catch (e) {
                                var _error = e.message;
                                print(_error);
                                setLoaing(false);
                              }
                            }
                          },
                        )
                      : RaiseButtonCenter(
                          buttonLable: 'ADD ITEM',
                          pressBottonFuntion: () async {
                            setLoaing(true);
                            try {
                              dynamic result = await storeItemDataBase(
                                productname,
                                productMaterial,
                                _formKeyAddItem,
                                selectedCategory,
                                widget.mainCategories,
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
                              if (result) {
                                print('------------------ok');
                                setLoaing(false);
                                Navigator.of(context).pop();
                              }
                            } catch (e) {
                              var _error = e.message;
                              print(_error);
                              setLoaing(false);
                            }
                          },
                        ),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          );
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
