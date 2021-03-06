#!/bin/sh

#
# Variables
#
SCRIPT=$(readlink -f "$0")
DIR="$(dirname $SCRIPT)"
DIR_TESTS="$(dirname $(dirname $DIR))"

DIR_LIBRARY="${DIR_TESTS}/lib"
DIR_RESOURCES="${DIR_TESTS}/resources"
DIR_TARGET="${DIR_TESTS}/target"

#
# Tests
#
. $DIR_LIBRARY/testbase.sh
. $DIR_LIBRARY/functions.sh

# 
# Test Runner
#
(
    rm -rf $DIR_TARGET
    mkdir -p $DIR_TARGET
    
    (
      RESULT=$(install)
      assertEquals "install to image" 0 $?
    )

    (
      RESULT=$(optipng)
      assertEquals "optipng is installed" 0 $?
    )

    (
      RESULT=$(simple_png)
      assertEquals "optimize a simple png" 0 $?
    )
)