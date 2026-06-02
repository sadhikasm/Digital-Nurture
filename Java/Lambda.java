import java.util.*;

public class Lambda {
    public static void main(String[] args){

        List<String> str=new ArrayList<>();
        Scanner sc=new Scanner(System.in);

        System.out.print("Enter the number of strings: ");

        int n=sc.nextInt();

        while(n-->0){
            String s=sc.next();
            str.add(s);
        }

        Collections.sort(str, (a, b) -> a.compareTo(b));
        System.out.println(str);


    }
}
