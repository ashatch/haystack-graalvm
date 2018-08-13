# haystacks-graalvm java

The `java` solution to the haystack problem with a build for GraalVM.

Run `./build.sh` to create the `haystack` binary.

Test with

    cat test-data/dodgy_alphabet.txt | ./haystack --needles test-data/vowels.txt

This is a dodgy alphabet that misses `e` so outputs:

    a
    i
    o
    u
