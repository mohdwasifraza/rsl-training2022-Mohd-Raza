public class Factory {
    public static void main(String[] args) {
        Car car=new Car("ABCD4562","MARUTI","BLACK");// creating objects and Constructor Overloading
        car.run();
        car.stop();
        LuxuryCar luxuryCar=new LuxuryCar("XYZEE`4562","AUDI A4","GREY","ALLOY WHEELS");
        luxuryCar.run();
        luxuryCar.stop();//Method Overriding (Polymorphism)
        luxuryCar.setSportsMode();

 }
}
