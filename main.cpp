#include <string.h>
#include <stdio.h>

#define MAX_NAME_LENGTH 100

void print_reverse(const char *str) {
    int length = strlen(str);
    for (int i = length - 1; i >= 0; i--) {
        printf("%c", str[i]);
    }
    printf("\n");
}

void print_reversed_words(const char *str) {
    int length = strlen(str);
    int start = 0;

    for (int i = 0; i <= length; i++) {
        if (str[i] == ' ' || str[i] == '\0') {
            print_reverse(&str[start]);
            start = i + 1;
        }
    }
}

int main() {
    char input[MAX_NAME_LENGTH];
    printf("Enter a string: ");
    fgets(input, MAX_NAME_LENGTH, stdin);

    printf("Reversed string: ");
    print_reverse(input);

    printf("Reversed words: ");
    print_reversed_words(input);

    return 0;
}
