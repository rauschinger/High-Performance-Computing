#include <cstdlib>
#include <iostream>

int main() {

    std::cout << "hello world!" << std::endl;

    int * l_my_var = (int*) malloc ( 1500 * sizeof(int));

    unsigned char l_my_char = 5;
    std::cout << "sizeof( l_my_char ): " << sizeof(l_my_char) << std::endl;


    //l_my_var[1000] = 5;
    *(l_my_var+1000) = 4;
    std::cout << l_my_var[1000] << std::endl;


    free (l_my_var);

    return EXIT_SUCCESS;

}