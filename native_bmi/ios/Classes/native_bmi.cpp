#include <cmath>
using namespace std;

// Avoiding name mangling
extern "C" {

    int getAge(){
      return 25;
    }

    double calculateBMI(double weight, double height)
    {
      return weight / pow(height / 100, 2);
    }

    char *getResult(double weight, double height)
    {
        double _bmi = weight / pow(height / 100, 2);
        if (_bmi >= 25) {
          return "Overweight";
        } else if (_bmi > 18.5) {
          return "Normal";
        } else {
          return "Underweight";
        }
    }

    char *getVersion()
    {
        return "v1.0.0";
    }
}