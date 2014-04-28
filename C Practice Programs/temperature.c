#include <stdio.h>

/* print Fahrenheit-Celsius table
 * for fahr = 0, 20, ..., 300; floating-point version */

#define LOWER 0
#define UPPER 300
#define STEP 20

main () {
	float fahr, celsius;

	fahr = LOWER;

	while (fahr <= UPPER) {
		celsius = (5.0/9.0) * (fahr-32.0);
		printf("%3.0f, %32f\n", fahr, celsius);
		fahr += STEP;
	}
}
