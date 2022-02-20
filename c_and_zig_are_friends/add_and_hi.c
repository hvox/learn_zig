#include <stdio.h>

int add(int a, int b) {
	return (a + b + 257 * 2) % 257;
}

void hi() {
	printf("Hello, my dear world!\n");
}
