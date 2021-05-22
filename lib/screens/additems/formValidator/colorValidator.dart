String colorValidate(bool colorNull, bool colorAlreadyExist) {
  if (colorNull) {
    return "Can't be null";
  } else if (colorAlreadyExist) {
    return "color is already avilabale";
  } else {
    return null;
  }
}
