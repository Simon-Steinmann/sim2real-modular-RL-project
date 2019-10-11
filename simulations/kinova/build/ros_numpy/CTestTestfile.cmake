# CMake generated Testfile for 
# Source directory: /home/acis/sim2real/simulations/kinova/src/ros_numpy
# Build directory: /home/acis/sim2real/simulations/kinova/build/ros_numpy
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_ros_numpy_nosetests_test "/home/acis/sim2real/simulations/kinova/build/ros_numpy/catkin_generated/env_cached.sh" "/usr/bin/python2" "/opt/ros/melodic/share/catkin/cmake/test/run_tests.py" "/home/acis/sim2real/simulations/kinova/build/ros_numpy/test_results/ros_numpy/nosetests-test.xml" "--return-code" "\"/usr/bin/cmake\" -E make_directory /home/acis/sim2real/simulations/kinova/build/ros_numpy/test_results/ros_numpy" "/usr/bin/nosetests-2.7 -P --process-timeout=60 --where=/home/acis/sim2real/simulations/kinova/src/ros_numpy/test --with-xunit --xunit-file=/home/acis/sim2real/simulations/kinova/build/ros_numpy/test_results/ros_numpy/nosetests-test.xml")
subdirs("gtest")
