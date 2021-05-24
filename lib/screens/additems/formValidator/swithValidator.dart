String checkValue(String val, bool state) {
  if (val.trim().isEmpty && state == true) {
    return "Value can not be empty";
  } else {
    return null;
  }
}
