public class SmallCar extends Car { //inheritance
    private String modelNo;
    private int mileage;
    public SmallCar(String regNo, String modelNo, String color,int mileage){
        super(regNo,modelNo,color);
        this.mileage=mileage;
        this.modelNo=modelNo;

    }
    public void run(){
        System.out.println(modelNo+" is Running");
    }
    public void stop(){
        System.out.println(modelNo+" has stopped");
    }
    public void setGear(int gearNumber){
        System.out.println("The gear number is set to "+gearNumber);
    }
}
