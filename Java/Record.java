import java.util.*;

record Person(String name, int age){}

public class Record {
    public static void main(String args[]){
        Person p1=new Person("ABCD",25);
        Person p2=new Person("EFGH",15);
        Person p3=new Person("IJKL",22);
        Person p4=new Person("MNOP",13);
        Person p5=new Person("QRST",20);

        List<Person> p=List.of(p1,p2,p3,p4,p5);

        List<Person> ad= p.stream().filter(pe->pe.age()>=18).toList();

        System.out.println("Filtered people(above 18 years):\n"+ad);
        
    }

}
