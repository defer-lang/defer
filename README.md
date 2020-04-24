# defer

A new language

## How to build

Firstly you need have two software - `flex` and `bison` to make the lexer and
yaccer files:

``` shell
sudo apt-get install flex
sudo apt-get install bison
```

And then you need download `make` to build the project:

``` shell
sudo apt-get install make
```

After that you can build it by `make`:

``` shell
make
```

Then you can use it like this:

``` shell
./defer
>>> print "this"
||| this
```
