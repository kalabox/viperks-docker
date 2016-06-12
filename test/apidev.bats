#!/usr/bin/env bats

#
# Some tests to verify our docker images are built correctly and
# have the correct properties
#

# Load up environment
load env

#
# Setup some things
#
setup() {

  # Config
  VIPERKS_API_ROOT="${TRAVIS_BUILD_DIR}/api"
  VIPERKS_API_DOCKERFILES="${VIPERKS_API_ROOT}/dockerfiles"

}

#
# Check that we can build the data image without an error.
#
@test "Check that we can build the data image without an error." {
  run kbox-retry-build busybox latest $VIPERKS_API_DOCKERFILES/data
  [ "$status" -eq 0 ]
}

#
# Check that we can build the nginx image without an error.
#
@test "Check that we can build the web image without an error." {
  run kbox-retry-build viperks/web api-latest $VIPERKS_API_DOCKERFILES/web
  [ "$status" -eq 0 ]
}

#
# Check that we can build the api image without an error.
#
@test "Check that we can build the api image without an error." {
  run kbox-retry-build viperks/api latest $VIPERKS_API_DOCKERFILES/api
  [ "$status" -eq 0 ]
}

#
# Check that we can spin up the site in kalabox
#
@test "Check that we can spin up the site in kalabox." {
  cd "$VIPERKS_API_ROOT"
  run kbox start
  [ "$status" -eq 0 ]
}

#
# Check that the data container exists and is in the correct state.
#
@test "Check that the data container exists and is in the correct state." {
  $DOCKER inspect apiviperks_data_1 | grep "\"Status\": \"exited\""
}

#
# Check that the api container exists and is in the correct state.
#
@test "Check that the api container exists and is in the correct state." {
  $DOCKER inspect apiviperks_api_1 | grep "\"Status\": \"running\""
}

#
# Check that the web container exists and is in the correct state.
#
@test "Check that the web container exists and is in the correct state." {
  $DOCKER inspect apiviperks_web_1 | grep "\"Status\": \"running\""
}

#
# BURN IT TO THE GROUND!!!!
# Add a small delay before we run other things
#
teardown() {
  sleep 1
}
