import java.util.Scanner;

public class StringRev {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.println("Enter a string:");
        String s = sc.nextLine();

        StringBuilder rev = new StringBuilder(s);
        rev.reverse();

        System.out.println("Reversed string: " + rev);
    }
}
