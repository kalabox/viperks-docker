#!/usr/bin/env bats

#
# Basic tests to verify that Kalabox has been installed
#

# Load up environment
load env

#
# Setup some things
#
setup() {
  echo
}

# Check that the Kalabox CLI is in the PATH
@test "Check that kalabox-cli is in PATH" {
  run which $KBOX
  [ "$status" -eq 0 ]
}

# Check that '$KBOX' returns without error
@test "Check that '$KBOX' returns without error" {
  run $KBOX
  [ "$status" -eq 1 ]
}

# Check that '$KBOX config' returns without error
@test "Check that '$KBOX config' returns without error" {
  run $KBOX config
  [ "$status" -eq 0 ]
}

# Check that '$KBOX create' returns without error
@test "Check that '$KBOX create' returns without error" {
  run $KBOX create
  [ "$status" -eq 1 ]
}

# Check that '$KBOX env' returns without error
@test "Check that '$KBOX env' returns without error" {
  run $KBOX env
  [ "$status" -eq 0 ]
}

# Check that '$KBOX list' returns without error
@test "Check that '$KBOX list' returns without error" {
  run $KBOX list
  [ "$status" -eq 0 ]
}

# Check that '$KBOX version' returns without error
@test "Check that '$KBOX version' returns without error" {
  run $KBOX version
  [ "$status" -eq 0 ]
}

# Check that '10.13.37.100' can be pinged
@test "Check that '10.13.37.100' can be pinged" {
  ping -c 1 10.13.37.100
}

#
# BURN IT TO THE GROUND!!!!
# Add a small delay before we run other things
#
teardown() {
  sleep 1
}
