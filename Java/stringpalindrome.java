import java.util.Scanner;

public class stringpalindrome {
     public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.println("Enter a string:");
        String s = sc.nextLine();

        s = s.replaceAll("[^a-zA-Z0-9]", "").toLowerCase();

        int left = 0;
        int right = s.length() - 1;

        boolean palindrome = true;

        while(left < right) {
            if(s.charAt(left) != s.charAt(right)) {
                palindrome = false;
                break;
            }

            left++;
            right--;
        }

        if(palindrome) {
            System.out.println(s+" is a palindrome");
        } else {
            System.out.println(s+" is not a palindrome");
        }
    }

}
