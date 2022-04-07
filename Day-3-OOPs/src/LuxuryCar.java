public class LuxuryCar extends Car {
    private String wheeltype;
    private String modelNo;
    LuxuryCar(String regNo, String modelNo, String color,String wheeltype){
        super(regNo,modelNo,color);
        this.modelNo=modelNo;
        this.wheeltype=wheeltype;

    }
    public void run(){
        System.out.println(modelNo+" is Running");
    }
    public void stop(){
        System.out.println(modelNo+" has stopped");
    }
    public void setSportsMode(){
        System.out.println(modelNo+" is running in sports mode");
    }
}
