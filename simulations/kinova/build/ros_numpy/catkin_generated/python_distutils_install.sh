#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/simon/sim2real/simulations/kinova/src/ros_numpy"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/simon/sim2real/simulations/kinova/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/simon/sim2real/simulations/kinova/install/lib/python2.7/dist-packages:/home/simon/sim2real/simulations/kinova/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/simon/sim2real/simulations/kinova/build" \
    "/usr/bin/python2" \
    "/home/simon/sim2real/simulations/kinova/src/ros_numpy/setup.py" \
    build --build-base "/home/simon/sim2real/simulations/kinova/build/ros_numpy" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/simon/sim2real/simulations/kinova/install" --install-scripts="/home/simon/sim2real/simulations/kinova/install/bin"
