String sizeValidate(bool sizeNull, bool sizeAlreadyExist) {
  if (sizeNull) {
    return "Can't be null";
  } else if (sizeAlreadyExist) {
    return "size is already avilabale";
  } else {
    return null;
  }
}
