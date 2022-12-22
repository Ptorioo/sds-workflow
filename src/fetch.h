#pragma once
#ifndef FETCH_H
#define FETCH_H

#include <curl.h>
#include <string>

class CurlObj {
public: 
    CurlObj (std::string url) {
        CURL *curl = curl_easy_init();
        if (!curl) {
            throw std::string ("Curl did not initialize.");
        }
    }
};

#endif