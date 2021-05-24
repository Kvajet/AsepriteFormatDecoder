#pragma once
#include <string>
#include <iostream>
#include <fstream>

class CAsepriteFileHandler
{
public:
    CAsepriteFileHandler( const std::string & filename );
    ~CAsepriteFileHandler();

    uint32_t Read();

private:
    std::string m_filename;
    std::ifstream m_file;
};