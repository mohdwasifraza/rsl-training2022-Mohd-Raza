public class Truck extends Vehicles implements MaxLoad{
    private String ModelNo;
    public Truck(String RegNo,String ModelNo){
        super(RegNo,ModelNo);
        this.ModelNo=ModelNo;
    }
    public void run(){
        System.out.println(ModelNo+" cycle is running");
    }
    public void stop(){
        System.out.println(ModelNo+ "cycle has stopped");
    }
    public void LoudHorn(){
        System.out.println("Loud horn is on");
    }
    public void printMaxLoad(){
        System.out.println("Maximum Load Truck can carry is 5 Lakh Kg");
    }

}
