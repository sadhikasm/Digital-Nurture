import java.util.Scanner;

public class FiboRecur {
    public static void main(String args[]){
        Scanner sc=new Scanner(System.in);

        System.out.println("Enter the number of numbers: ");
        int n=sc.nextInt();
        int ans=1;

        for(int i=0;i<n;i++){
            ans=fibo(i);
            System.out.print(ans+" ");
        }

    }

    public static int fibo(int n){
        
        if(n==0){
            return 0;
        }
        if(n==1){
            return 1;
        }
        return fibo(n-1)+fibo(n-2);        

    }
}
