# haystacks-graalvm java

The `java` solution to the haystack problem with a build for GraalVM.

## Build

Run `make` to create the `haystack` binary. This will download the GraalVM from github
(approx 250M), then use the GraalVM `javac` and `native-image` tools to build a native
executable.

`make clean` will cleanup.

## Test

Test with

    cat test-data/dodgy_alphabet.txt | ./haystack --needles test-data/vowels.txt

This is a dodgy alphabet that misses `e` so outputs:

    a
    i
    o
    u
