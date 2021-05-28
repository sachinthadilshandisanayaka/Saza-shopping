import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:sazashopping/models/imageUploadImage.dart';
import 'package:sazashopping/screens/additems/customWidget/displayingSelectedCategory.dart';
import 'package:sazashopping/screens/additems/formValidator/multiValueValidator.dart';
import 'package:sazashopping/screens/additems/funtions/addModelValue.dart';
import 'package:sazashopping/shared/uploadLoading.dart';
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
  final List<String> subCategory;
  final Map<String, String> mainCategories;
  ItemAdding({
    @required this.subCategory,
    @required this.mainCategories,
  });
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
                  stringTextFormField(funtion: (val) {
                    setState(() {
                      productname = val.trim();
                    });
                  }),
                  sizedBox,
                  displayText('Category'),
                  dropDownField(
                    hint: 'Select item category',
                    productSubCategory: widget.subCategory,
                    valueChangeFuntion: (value) {
                      setState(() {
                        selectedCategory = value;
                      });
                    },
                  ),
                  DisplaySelectedCategory(
                      selectedCategory ?? '', widget.mainCategories),
                  sizedBox,
                  displayText('Price'),
                  stringTextFormField(
                      textInputType: TextInputType.number,
                      funtion: (val) {
                        setState(() {
                          price = double.parse(val.trim());
                        });
                      }),
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
                      ? swicthTextField(
                          type: TextInputType.number,
                          hint: 'add offer precentage \'%\'',
                          funt: (val) {
                            setState(() {
                              offer = double.parse(val);
                            });
                          },
                          state: offerVisibility,
                        )
                      : SizedBox(),
                  sizedBox,
                  displayText('Material'),
                  stringTextFormField(funtion: (val) {
                    setState(() {
                      productMaterial = val.trim();
                    });
                  }),
                  sizedBox,
                  displayText('Brand'),
                  stringTextFormField(funtion: (val) {
                    setState(() {
                      brandName = val.trim();
                    });
                  }),
                  sizedBox,
                  displayText('Made in'),
                  stringTextFormField(funtion: (val) {
                    setState(() {
                      madeCountry = val.trim();
                    });
                  }),
                  sizedBox,
                  displayText('Quantity Avilable'),
                  stringTextFormField(
                      textInputType: TextInputType.number,
                      funtion: (val) {
                        setState(() {
                          quantity = int.parse(val.trim());
                        });
                      }),
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
                          funtion: (value) {
                            setState(() {
                              maleOrFemale = value;
                            });
                          })
                      : SizedBox(),
                  sizedBox,
                  displayText('Add color'),
                  listedTextFormField(
                      formkey: formkey,
                      hint: 'you can add list of colors',
                      funtion: (val) {
                        setState(() {
                          tempColor = val.trim();
                        });
                      },
                      validFunction: (val) {
                        return swicthValidate(
                            colorIsNull, colorAllreadyAvilable);
                      }),
                  bottomRightAlignButton(
                    context: context,
                    text: 'Add',
                    buttonClickOperation: () {
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
                  listedTextFormField(
                    formkey: sizeFormkey,
                    hint: 'you can add list of sizes',
                    funtion: (val) {
                      setState(() {
                        tempSize = val.trim();
                      });
                    },
                    validFunction: (val) {
                      return swicthValidate(sizeIsNull, sizeAllreadyAvilable);
                    },
                  ),
                  bottomRightAlignButton(
                    context: context,
                    text: 'Add',
                    buttonClickOperation: () {
                      if (tempSize == null || tempSize == '') {
                        setState(() {
                          sizeIsNull = true;
                        });
                      } else if (productSize.contains(tempSize)) {
                        setState(() {
                          sizeIsNull = false;
                          sizeAllreadyAvilable = true;
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
                  stringTextFormField(
                    maxline: 8,
                    funtion: (val) {
                      description = val.trim();
                    },
                  ),
                  sizedBox,
                  sizedBox,
                  raiseButtonCenter(
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
                      context: context),
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
