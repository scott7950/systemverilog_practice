#include <svdpi.h>
#include <iostream>
#include <string>

using namespace std;

class memoryClass {
public:
    memoryClass(int size = 10) {
        if(size > 1000) {
            size = 1000;
            cout << "[C++][Error] Size > 1000" << endl;
        }
        memoryData = new int[size];
        this->size = size;
    }

    ~memoryClass() {
        cout << "Deleting data" << endl;
        delete [] memoryData;
    }

    bool write(int addr, int data) {
        if(addr >= this->size) {
            return false;
        }

        memoryData[addr] = data;

        return true;
    }

    int read(int addr) {
        if(addr >= this->size) {
            return -1;
        }

        return memoryData[addr];
    }

private:
    int* memoryData;
    int  size;
};

extern "C" void helloFromSV(char*);

extern "C" void helloFromCpp(const char* cstr1) {
    cout << "[C++] Hello From CPP " << cstr1 << endl;

    string str = "Called from Cpp";
    char *cstr2 = new char[str.length() + 1];
    strcpy(cstr2, str.c_str());
    helloFromSV(cstr2);
}

extern "C" void helloTaskFromSV(char*);

extern "C" void helloTaskFromCpp(const char* cstr1) {
    cout << "[C++] Hello From CPP Task " << cstr1 << endl;

    string str = "Called from Cpp";
    char *cstr2 = new char[str.length() + 1];
    strcpy(cstr2, str.c_str());
    helloTaskFromSV(cstr2);
}

extern "C" void* initMemory(int size) {
    memoryClass* memoryInstance = new memoryClass(size);
    return memoryInstance;
}

extern "C" void writeMemory(void* memoryInstanceVoid, int addr, int data) {
    memoryClass* memoryInstance = (memoryClass*) memoryInstanceVoid;
    memoryInstance->write(addr, data);
}

extern "C" int readMemory(void* memoryInstanceVoid, int addr) {
    memoryClass* memoryInstance = (memoryClass*) memoryInstanceVoid;
    return memoryInstance->read(addr);
}

extern "C" void freeMemory(void* memoryInstanceVoid) {
    memoryClass* memoryInstance = (memoryClass*) memoryInstanceVoid;
    cout << "Removing memory instance" << endl;
    delete memoryInstance;
}

