class PrimeValidator {

  bool isPrime(int val) {
    if (val == 2 || val == 3) {
      return true;
    } else if (val < 2 || val % 2 == 0) {
      return false;
    } else {
      int i = 3;
      while (i*i <= val) {
        if (val % i == 0) {
          return false;
        }
        i += 2;
      }
      return true;
    }
  }
}