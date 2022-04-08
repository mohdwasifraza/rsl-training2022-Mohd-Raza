/*Question 3: prints the middle element of this list
in one traverse.*/
public class LinkedList {

    public static void main(String[] args) {
        Node linklist=new Node(5);
        linklist.push(4);
        linklist.push(3);
        linklist.push(2);
        linklist.push(1);
        printMid(linklist.head);

    }
    /*Question 3: prints the middle element of this list
in one traverse.*/
    public static void printMid(Node head){
        Node slow = head;
        Node fast = head;

        while (fast != null && fast.next != null)
        {
            fast = fast.next.next;
            slow= slow.next;
        }
        System.out.println("The middle element is " + slow.val );
    }
}
class Node
{
    Node head;
    int val;
    Node next;
    Node(int d)
    {
        val = d;
        next = null;
    }
    /* I have created this function to create a link list*/
    /*This func inserts value in front of a linklist*/
    public void push(int val)
    {
        Node new_node = new Node(val);
        new_node.next = head;
        head = new_node;
    }
}
