# gcc-build

A headless gcc / cmake build environment for Ubuntu, tested with
[16.04 LTS (Xenial Xerus)][xenial].

## Usage

* make
* `docker run -t -i --rm -v $PWD:$PWD gcc-build:xenial-1 bash`
* `cmake` or `gcc` in the container

## Credits


[gcc]: https://gcc.gnu.org/
[xenial]: http://releases.ubuntu.com/16.04/

