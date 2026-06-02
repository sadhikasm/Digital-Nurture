import java.util.*;

public class HashMapEx {
    public static void main(String arghs[]){
        Scanner sc = new Scanner(System.in);

        HashMap<Integer,String> sid = new HashMap<>();

        System.out.print("Enter the total number of students: ");
        int n = sc.nextInt();

        System.out.println("Enter the id foloowed by name: ");
        while(n-->0){
            int id = sc.nextInt();
            String name = sc.next();
            sid.put(id, name);
        }

        System.out.println(sid);
    }

}
