class Addition{
    void add(int a,int b){
        System.out.println("The sum of two integers is:"+(a+b));
    }

    void add(double a,double b){
        System.out.println("The sum of two doubles is:"+(a+b));
    }

    void add(int a,int b,int c){
        System.out.println("The sum of three integers is:"+(a+b+c));
    }
}


public class MethodOverload {
    public static void main(String args[]){
        Addition a=new Addition();

        a.add(18,27);
        a.add(2.5,10.2);
        a.add(18,17,72);

    }
}
