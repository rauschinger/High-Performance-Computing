# CMake generated Testfile for 
# Source directory: /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4
# Build directory: /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(MY_TEST "/home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build/test/small_gemms_tests")
subdirs("catch")
subdirs("test")
subdirs("small_gemms")
