class OptionSelect {
  String name;
  int value;

  OptionSelect(this.name, this.value);

  @override
  String toString() {
    return '$name - $value';
  }
}
