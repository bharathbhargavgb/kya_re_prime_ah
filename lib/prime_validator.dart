class PrimeValidator {

  int isPrime(int val) {
    if (val == 2 || val == 3) {
      return 0;
    } else if (val < 2) {
      return 1;
    } else if (val % 2 == 0) {
      return 2;
    } else {
      int i = 3;
      while (i*i <= val) {
        if (val % i == 0) {
          return i;
        }
        i += 2;
      }
      return 0;
    }
  }
}