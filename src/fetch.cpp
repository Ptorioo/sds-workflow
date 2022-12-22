#include "fetch.h"

int CurlObj::curlWriter(char *data, int size, int nmemb, std::string *buffer) {
    int result = 0;
    if(buffer != NULL) {
        buffer->append(data, size * nmemb);
        result = size * nmemb;
    }

    return result;
}

std::string CurlObj::getData() {
    return curlBuffer;
}