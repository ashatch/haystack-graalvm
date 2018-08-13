import java.nio.*;
import java.nio.file.*;
import java.io.*;
import java.util.*;
import java.util.stream.Collectors;

public class Haystack {
  public static void main(String[] args) throws IOException {

    final Set<String> needles =
    Files.lines(Paths.get(args[1]))
         .collect(Collectors.toSet());

    BufferedReader in = new BufferedReader(new InputStreamReader(System.in));

    in.lines()
         .filter(needles::contains)
         .forEach(System.out::println);
  }
}
