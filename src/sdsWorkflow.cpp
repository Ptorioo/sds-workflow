#include <iostream>
#include "fetch.h"
#include "data.h"

int main() {
    std::vector<Data> dataObj;

    for(auto i : dataObj) {
        std::string address = "";
        CurlObj temp(address);
        Data data = Data(temp.getData());
        data.printData();
    }
    return 0;
}