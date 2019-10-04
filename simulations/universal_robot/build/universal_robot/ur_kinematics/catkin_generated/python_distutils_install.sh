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

echo_and_run cd "/home/acis/sim2real/simulations/universal_robot/src/universal_robot/ur_kinematics"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/acis/sim2real/simulations/universal_robot/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/acis/sim2real/simulations/universal_robot/install/lib/python2.7/dist-packages:/home/acis/sim2real/simulations/universal_robot/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/acis/sim2real/simulations/universal_robot/build" \
    "/usr/bin/python2" \
    "/home/acis/sim2real/simulations/universal_robot/src/universal_robot/ur_kinematics/setup.py" \
    build --build-base "/home/acis/sim2real/simulations/universal_robot/build/universal_robot/ur_kinematics" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/acis/sim2real/simulations/universal_robot/install" --install-scripts="/home/acis/sim2real/simulations/universal_robot/install/bin"
