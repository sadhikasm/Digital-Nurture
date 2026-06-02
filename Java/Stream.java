import java.util.*;

public class Stream {
    public static void main(String args[]){
        List<Integer> list= new ArrayList<>();
        Scanner sc=new Scanner(System.in);

        System.out.print("Enter the total no. of numbers: ");

        int n=sc.nextInt();
        while(n-->0){
            int s=sc.nextInt();
            list.add(s);
        }

        list.stream().filter(x-> x%2==0).forEach(x->System.out.print(x+" "));
    }

}
