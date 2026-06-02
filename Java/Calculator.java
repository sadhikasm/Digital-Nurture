import java.util.Scanner;

public class Calculator {
    public static void main(String[] args){
        Scanner sc=new Scanner(System.in);

        System.out.println("Enter two numbers followed by the operator:");

        int a=sc.nextInt();
        int b=sc.nextInt();
        char op=sc.next().charAt(0);

        switch(op){
            case '+':
                System.out.println(a+b);
                break;
            case '-':
                System.out.println(a-b);
                break;
            case 'X':
                System.out.println(a*b);
                break;
            case '*':
                System.out.println(a*b);
                break;
            case '/':
                System.out.println(a/b);
                break;
            case '%':
                System.out.println(a%b);
                break;
            case '^':
                System.out.println(Math.pow(a,b));
                break;
            case 'r':
                System.out.println(Math.pow(a,1.0/b));
                break;
            default:
                System.out.println("Invalid Input");
                break;
            
        }
    }
}
