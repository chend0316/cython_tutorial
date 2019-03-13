#ifndef __PERSON_H__
#define __PERSON_H__

typedef struct person_s {
    int age;
    char *name;
} person_t;

void person_say_hello(person_t *p);

#endif /* __PERSON_H__ */
