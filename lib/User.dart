class User {
  String _prifix = "";
  String _dPName = "";
  String _firstName = "";
  String _secondName = "";
  Map<String, String> _mobile = {};
  Map<String, String> _email = {};

  void addAllData(String prifix, String dPName, String firstName, secondName,
      Map<String, String> mobile, Map<String, String> email) {}

  Map<String, String> get Email => _email;

  Map<String, String> get Mobile => _mobile;

  String get secondName => _secondName;

  String get firstName => _firstName;

  String get dPName => _dPName;

  String get prifix => _prifix;

  set Email(Map<String, String> value) {
    _email = value;
  }

  set Mobile(Map<String, String> value) {
    _mobile = value;
  }

  set secondName(String value) {
    _secondName = value;
  }

  set firstName(String value) {
    _firstName = value;
  }

  set dPName(String value) {
    _dPName = value;
  }

  set prifix(String value) {
    _prifix = value;
  }

  String checkMobile(String firstFieldVal) {
    if (Mobile.containsKey("$firstFieldVal")) {
      return "Cant add Same Type twice";
    }

    return "";
  }

  void addMobile(String firstFieldVal, String secondFieldVal) {
    Mobile[firstFieldVal] = secondFieldVal;
  }

  String checkEmail(String firstFieldVal) {
    if (Email.containsKey("$firstFieldVal")) {
      return "Cant add Same Type twice";
    }

    return "";
  }

  void addEmail(String firstFieldVal, String secondFieldVal) {
    Email[firstFieldVal] = secondFieldVal;
  }
}
