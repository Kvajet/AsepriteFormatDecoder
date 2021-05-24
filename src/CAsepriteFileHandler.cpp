#include "CAsepriteFileHandler.h"

CAsepriteFileHandler::CAsepriteFileHandler( const std::string & filename )
    : m_filename( std::move( filename ) ) , 
      m_file( std::ifstream( m_filename , std::ios::binary ) )
{
    Read();
}

CAsepriteFileHandler::~CAsepriteFileHandler()
{
    m_file.close();
}

uint32_t CAsepriteFileHandler::Read()
{
    char buffer = 0;
    uint32_t num = 0;
    for( int i = 0 ; i < 4 ; i++ )
    {
        m_file.get( buffer );
        num |= ( static_cast< uint32_t >( buffer ) << ( 24 - 8 * ( 3 - i ) ) );
    }
    std::cout << std::hex << num << "\n";
    return num;
}