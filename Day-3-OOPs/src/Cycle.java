public class Cycle extends Vehicles implements MaxLoad{
    private String model;
    private String color;
    public Cycle(String regNo,String model, String color){
        super(regNo,model);
        this.color=color;
    }
    public void run(){
        System.out.println(model+" cycle is running");
    }
    public void stop(){
        System.out.println(model+ "cycle has stopped");
    }
    public void printMaxLoad(){
        System.out.println("Maximum Load Truck can carry is 200 Kg");
    }

}
