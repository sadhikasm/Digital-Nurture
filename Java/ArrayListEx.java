import java.util.ArrayList;
import java.util.Scanner;

public class ArrayListEx {
    public static void main(String args[]){
        Scanner sc=new Scanner(System.in);
        ArrayList<String> st_name=new ArrayList<>();
        System.out.print("Enter the number of students: ");
        int n=sc.nextInt();

        while(n-->0){
            String name=sc.next();
            st_name.add(name);
        }

        System.out.println(st_name);

    }

}
