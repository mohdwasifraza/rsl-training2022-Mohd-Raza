public class DoublyLinkedList {
    public static void main(String[] args) {
        DoublyLinkedList dll=new DoublyLinkedList();
        dll.insertElement(1,0);
        dll.insertElement(2,1);
        dll.insertElement(3,2);
        dll.Display();
        dll.removeElement(2);
        dll.Display();
    }

    Node head;
    class Node{
        int val;
        Node next;
        Node prev;
        public Node(int val){
            this.val=val;
        }
    }
    public void insertElement(int val, int index){


        Node node=new Node(val);
        if(head==null){
            head=node;
        }
        else if(index==0){
            node.next=head;
            node.prev=null;
            head.prev=node;
            head=node;
        }
        else {
            Node x = head;
            while (index > 1) {
                x = x.next;
                index--;
            }
            Node temp = x.next;
            x.next = node;
            if (temp != null) {
                node.next = temp;
                temp.prev = node;
            }
            node.prev = x;
        }


    }
    public void removeElement(int index) {
        if (index == 0) {
            head = head.next;
        }
        else{
            Node x = head;
            while (index > 1) {
                x = x.next;
                index--;
            }
            if(x.next.next==null){
                x.next=null;
            }
            else {
                x.next = x.next.next;
                x.next.prev = x;
            }

        }
    }
    public boolean findElements(int val){
        Node x=head;
        while(x.next!=null){
            if(x.val==val){
                return true;
            }
            x=x.next;
        }
        return false;

    }
    public void Display(){
        Node x=head;
        while(x!=null){
            System.out.print(x.val+"->");
            x=x.next;
        }
        System.out.print("null");
        System.out.println();
    }

}
