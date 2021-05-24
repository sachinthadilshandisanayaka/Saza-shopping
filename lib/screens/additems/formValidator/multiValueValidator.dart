String swicthValidate(bool colorNull, bool colorAlreadyExist) {
  if (colorNull) {
    return "Can't be null";
  } else if (colorAlreadyExist) {
    return "value is already avilabale";
  } else {
    return null;
  }
}
