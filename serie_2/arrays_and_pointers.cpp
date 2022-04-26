#include <cstdlib>
#include <iostream>

int main() {

    std::cout << "hello world!" << std::endl;

    int * l_my_var = (int*) malloc ( 1500 * sizeof(int));

    free (l_my_var);

    return EXIT_SUCCESS;

}