#pragma once
#include "CAsepriteFileHandler.h"
#include <string>

class CAsepriteFileFormat
{
public:
    CAsepriteFileFormat( const std::string & filename );

private:
    CAsepriteFileHandler m_file;
};