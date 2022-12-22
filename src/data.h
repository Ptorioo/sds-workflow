#pragma once
#ifndef DATA_H
#define DATA_H

#include <vector>
#include <string>

class Data {
private:
    std::string html;
public:
    Data (std::string HTML);

    void fillData();

    void printData();
};

#endif