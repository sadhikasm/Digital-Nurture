import java.util.Random;
import java.util.Scanner;

public class GuessNum {
    public static void main(String args[]){
        Random rand= new Random();
        Scanner sc=new Scanner(System.in);

        int n=rand.nextInt(100)+1;
        System.out.println("Enter any number: ");
        int s=sc.nextInt();

        while(true){
            if(s>n){
                System.out.println("Too high");
            }
            else if(s<n){
                System.out.println("Too low");
            }
            else{
                System.out.println("Correct Guess!");
                break;
            }
            
            s=sc.nextInt();
        }

    }
}
