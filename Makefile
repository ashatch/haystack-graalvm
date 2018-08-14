haystack: Haystack.class
	graalvm/Contents/Home/bin/native-image Haystack

Haystack.class: graalvm
	graalvm/Contents/Home/bin/javac Haystack.java

graalvm: graalvm.tgz
	mkdir -p graalvm
	tar --strip 1 -xzf graalvm.tgz -C graalvm

graalvm.tgz:
	wget -O graalvm.tgz https://github.com/oracle/graal/releases/download/vm-1.0.0-rc5/graalvm-ce-1.0.0-rc5-macos-amd64.tar.gz

clean:
	rm -Rf graalvm/
	rm -f haystack
	rm -f Haystack.class
	rm -f graalvm.tgz
