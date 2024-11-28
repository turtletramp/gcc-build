# gcc-build

A headless gcc / cmake build environment for Ubuntu, tested with
[16.04 LTS (Xenial Xerus)][xenial].

Using manually installed current cmake V 3.31.1 and [gcc][gcc] V 8
NOTE: To successfully use the resulting builds on other old systems you might want to statically link libgcc and libstdc++ (when using cmake with this possible option `target_link_options(mylib PRIVATE -static-libgcc -static-libstdc++)`)

## Usage

* make
* `docker run -t -i --rm -v $PWD:$PWD turtletramp/gcc-build:16.04-3 /bin/bash`
* `cmake` or `gcc` in the container

## Credits


[gcc]: https://gcc.gnu.org/
[xenial]: http://releases.ubuntu.com/16.04/

