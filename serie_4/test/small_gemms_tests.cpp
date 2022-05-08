#include <algorithm>
#include <iterator>
#include <array>
#include "catch.hpp"
#include "gemm_ref.h"

TEST_CASE( "gemm 3x3 and lds all 3", "[correctness]" ){


    int i_m = 3;
    int i_n = 3;
    int i_k = 3;
    int i_lda = 3;
    int i_ldb = 3;
    int i_ldc = 3;


    float matrix_a[9] = {1,2,3,4,5,6,7,8,9};
    float matrix_b[9] = {1,0,0,0,1,0,0,0,1};
    float matrix_oc[9] = {0};

    gemm_ref(matrix_a, matrix_b, matrix_oc, i_m, i_n, i_k, i_lda, i_ldb, i_ldc);

    REQUIRE(std::equal(std::begin(matrix_oc), std::end(matrix_oc), std::begin(matrix_a)));


}


TEST_CASE( "gemm 4x4 and lds all 4", "[correctness]" ){


    int i_m = 4;
    int i_n = 4;
    int i_k = 4;
    int i_lda = 4;
    int i_ldb = 4;
    int i_ldc = 4;


    float matrix_a[16] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
    float matrix_b[16] = {1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1};
    float matrix_oc[16] = {0};

    gemm_ref(matrix_a, matrix_b, matrix_oc, i_m, i_n, i_k, i_lda, i_ldb, i_ldc);

    REQUIRE(std::equal(std::begin(matrix_oc), std::end(matrix_oc), std::begin(matrix_a)));

}

TEST_CASE( "gemm 2x2 and lds all 3", "[correctness]" ){


    int i_m = 2;
    int i_n = 2;
    int i_k = 2;
    int i_lda = 3;
    int i_ldb = 3;
    int i_ldc = 3;


    float matrix_a[6] = {1,2,3,4,5,6};
    float matrix_b[6] = {1,0,7,0,1,7};
    float matrix_oc[6] = {0,0,3,0,0,6};

    gemm_ref(matrix_a, matrix_b, matrix_oc, i_m, i_n, i_k, i_lda, i_ldb, i_ldc);

    REQUIRE(std::equal(std::begin(matrix_oc), std::end(matrix_oc), std::begin(matrix_a)));

}

TEST_CASE( "gemm 2x2 and lds all 3 FAIL VERSION", "[correctness]" ){


    int i_m = 2;
    int i_n = 2;
    int i_k = 2;
    int i_lda = 3;
    int i_ldb = 3;
    int i_ldc = 3;


    float matrix_a[6] = {1,2,3,4,5,6};
    float matrix_b[6] = {1,0,7,0,1,7};
    float matrix_oc[6] = {0,0,0,0,0,0};

    gemm_ref(matrix_a, matrix_b, matrix_oc, i_m, i_n, i_k, i_lda, i_ldb, i_ldc);

    REQUIRE(std::equal(std::begin(matrix_oc), std::end(matrix_oc), std::begin(matrix_a)));

}
