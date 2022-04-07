abstract public class Vehicles { //Abstract class
    private String RegNo;
    private String ModelNo;
    public Vehicles(String RegNo,String ModelNo){
        this.RegNo=RegNo;
        this.ModelNo=ModelNo;
    }
    abstract public void run();
    abstract public void stop();

}
