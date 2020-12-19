
#include <iostream>

int main() {
#ifdef FOO
	std::cout<< "FOO is defined" <<std::endl;
#else
	std::cout<< "No definitions are provided." <<std::endl;
#endif


#ifdef  FIRST_DEF
	std::cout<< "FIRST_DEF is defined" <<std::endl;
#endif

#ifdef  SECOND_DEF
	std::cout<< "SECOND_DEF is defined" <<std::endl;
#endif
	return 0;
}
