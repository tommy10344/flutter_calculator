enum Sign { plus, minus }

class Calculator {
  double input = 0;
  double result = 0;
  Sign currentSign;
  bool showingResult = false;

  double showingValue() {
    return showingResult
        ? result
        : input;
  }

  void inputNumber(int number) {
    input = input * 10 + number.toDouble();
    showingResult = false;
  }

  void inputSign(Sign sign) {
    if (currentSign != null) {
      calculate();
    } else {
      result = input;
      input = 0;
    }
    currentSign = sign;
    showingResult = true;
  }

  void clear() {
    input = 0;
    showingResult = false;
  }

  void allClear() {
    input = 0;
    result = 0;
    currentSign = null;
    showingResult = false;
  }

  void calculate() {
    if (currentSign == null) return;

    switch (currentSign) {
      case Sign.plus:
        result = result + input;
        break;

      case Sign.minus:
        result = result - input;
        break;
    }
    input = 0;
    showingResult = true;
  }
}