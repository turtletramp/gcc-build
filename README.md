# gcc-build

A headless gcc / cmake build environment for Ubuntu, tested with
[16.04 LTS (Xenial Xerus)][xenial].

Using manually installed current cmake V 3.31.1 and [gcc][gcc] V 7.3

## Usage

* make
* `docker run -t -i --rm -v $PWD:$PWD tutletramp/gcc-build:xenial-1 /bin/bash`
* `cmake` or `gcc` in the container

## Credits


[gcc]: https://gcc.gnu.org/
[xenial]: http://releases.ubuntu.com/16.04/

