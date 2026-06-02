import java.io.*;
import java.util.*;

public class FileWrite {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);

        String s = sc.nextLine();

        FileWriter fw = new FileWriter("output.txt");

        fw.write(s);

        fw.close();

        System.out.println("Data written to file");
    }
}