public class Car extends Vehicles{  //Encapsulation
    private String carColor;
    public Car(String regNo, String modelNo, String color){//parametrised constructor
        super(regNo,modelNo);
        carColor=color;

    }
    public void run(){
        System.out.println("Normal car is Running");
    }
    public void stop(){
        System.out.println("Normal car has stopped");
    }
    private class Components{ //Composition and nested class
        private boolean isBrakesApplied;

        public Components() {
            isBrakesApplied = false;
        }

        public void setBrakes(boolean brakes) {
            isBrakesApplied=brakes;
        }

        public void setSteering(){
            if(isBrakesApplied){
                System.out.println("Normal car Steering wheel is free");
            }
        }

    }



}
