VIPerks Docker
==============

This project contains the images, container orchestration and development tools
for VIPerks API and APP services.

Dependencies
------------

VIPerks Docker works easiest with Kalabox.

  1. [Kalabox](https://github.com/kalabox/kalabox)

Installation
------------

```
# Get the VIPerks repo
git clone https://github.com/kalabox/viperks-docker.git
```

Current Limitations
-------------------

1. You will need to
comment out the `image` keys in `kalabox-compose.yml`s and uncomment the `build` keys.

Starting Services
-----------------

```bash
#
# Each code stanza below assumes you start from the repo root
#

# Start dev version of API service
cd api
kbox start
# Visit API at api.viperks.kbox

# Start production version of API service
cd api
mv kalabox-compose-override.yml kalabox-compose-override.dev.yml
kbox start
# Visit API at api.viperks.kbox

# Start dev version of APP service
cd app
kbox start
# Visit API at app.viperks.kbox

# Start production version of API service
cd app
mv kalabox-compose-override.yml kalabox-compose-override.dev.yml
kbox start
# Visit APP at app.viperks.kbox
```

Development
-----------

Here is an example using the API project.

```bash
# Start the dev api containers
cd /path/to/repo
cd api
kbox start

# Clone down your development source
cd code
kbox git clone https://location/of/api/repo
```

Testing
-------

We use Kalabox for easy testing. You will additionally need [node](http://nodejs.org) and
npm installed for this.

```bash
# Install the testing dependencies
npm install

# Run all the tests
grunt test

# Run dev api tests
run test:apidev

# Run prod api tests
run test:apiprod

# Run dev app tests
run test:appdev

# Run dev app tests
run test:appprod
```
