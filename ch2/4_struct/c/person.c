#include <stdio.h>
#include "person.h"

void person_say_hello(person_t *p) {
    printf("hello, my name is %s, %d years old.\n", p->name, p->age);
}
