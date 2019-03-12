
void traverse(int *arr, int len, void (*cb)(int)) {
    for (int i = 0; i < len; i++) {
        cb(arr[i]);
    }
}

void traverse2(int *arr, int len, void (*cb)(int, void*), void *priv) {
    for (int i = 0; i < len; i++) {
        cb(arr[i], priv);
    }
}
