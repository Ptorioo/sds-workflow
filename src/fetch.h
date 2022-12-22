#pragma once
#ifndef FETCH_H
#define FETCH_H

#include <curl/curl.h>
#include <string>

class CurlObj {
private:
    CURL* curl;
    std::string curlBuffer;
public:
    CurlObj(std::string url) {
        curl = curl_easy_init();
        if(!curl) {
            throw std::string ("Curl did not initialize.");
        }

        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, &CurlObj::curlWriter);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &curlBuffer);
        curl_easy_setopt(curl, CURLOPT_URL, url.c_str());
        curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1);
        curl_easy_perform(curl);
    };

    ~CurlObj() = default;
    
    int curlWriter(char *data, int size, int nmemb, std::string *buffer);
    
    std::string getData();
};

#endif