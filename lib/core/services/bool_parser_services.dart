abstract class Bool {
  static bool? parse(dynamic value) {
    if (value.toString() == 'true' || value.toString() == '1') {
      return true;
    } else if (value.toString() == 'false' || value.toString() == '0') {
      return false;
    } else {
      return null;
    }
  }
}
