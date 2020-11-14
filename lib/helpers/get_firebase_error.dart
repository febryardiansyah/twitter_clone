extension StringExtension on String{
  String get getErrorFirebase{
    return this.split(']')[1].trim();
  }
}
