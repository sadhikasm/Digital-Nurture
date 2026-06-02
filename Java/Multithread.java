class Multi extends Thread{
    public void run(){
        for(int i=0;i<10;i++){
            System.out.println("Iteration no.: "+(i+1));
        }
    }
}

public class Multithread {
    public static void main(String[] args){
        Multi m=new Multi();
        m.start();

        for(int i=0;i<10;i++){
            System.out.println("Main process: "+(i+1));
        }
    }
}
