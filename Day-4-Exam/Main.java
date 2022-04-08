import java.util.HashMap;
import java.util.Stack;
/* This class contains all questions answer except  Linked list question*/
public class Main {
    public static void main(String[] args) {
        /*Uncomment to see the output of each function*/
        int ar[]=new int[]{-4, 2, 4,50, 1, 11, 3, 0};
        //printPairs(ar,-15);
        //printMaxTripProd(ar);
        //printSecMaxDiff(ar);
        //printEquilTriangle(5);
        //Character[] arr=new Character[]{ '2', '+', '(' ,'{', '*', '4', '{', '}','}',')', '3', '/', ']', ')',']' };
        //System.out.println(isbalancedParenthesis(arr));
        Character[] array=new Character[]{'a', '1', '!', 'r', 'r', '~', 'A', 'r', '\n'};
        printCount(array);

    }

    public static void printPairs(int[] arr, int x){
         /* Question 1. Print pairs that equals to x */

        for(int i=0;i<arr.length-1;i++){
            for(int j=i+1;j<arr.length;j++){
                if(arr[i]*arr[j]==x){
                    System.out.println(arr[i]+" "+arr[j]);
                }
            }
        }
    }
    public static void printMaxTripProd(int[] arr){
        /* Question 2. Print maximum triplet product */
        int max=Integer.MIN_VALUE;
        for(int i=0;i<arr.length-2;i++){
            for(int j=i+1;j<arr.length-1;j++){
                for(int k=j+1;k<arr.length;k++){
                    if(max<(arr[i]*arr[j]*arr[k])){
                        max=arr[i]*arr[j]*arr[k];
                    }
                }
            }

        }
        System.out.println(max);
    }
    public static void printCount(Character[] arr){
        /*Question 3. Print the count of the last character appearing
         in a stream terminated with a ‘\n’.*/
        HashMap<Character,Integer> mp=new HashMap<>();
        for(int i=0;i<arr.length;i++){
            if(arr[i]=='\n'){
                System.out.println("Count of last character "+arr[i-1]+"= "+mp.get(arr[i-1]));
                break;
            }
            int count=mp.getOrDefault(arr[i],0);
            mp.put(arr[i],count+1);

        }

    }
    public static boolean isbalancedParenthesis(Character[] arr){
        /*Question 4: Check for balanced parenthesis */
        Stack<Character> st=new Stack<>();
        for(int i=0;i<arr.length;i++){
            if(arr[i]=='(' || arr[i]=='[' || arr[i]=='{'){
                st.push(arr[i]);
                System.out.print(st.peek()+" ");
            }
            else if(!st.empty() && !Character.isLetterOrDigit(arr[i])
            && arr[i]!='*' && arr[i]!='+' && arr[i]!='/' && arr[i]!='-'){
                System.out.print(arr[i] +" ");
                if(st.peek()=='(' && arr[i]==')'){
                    st.pop();
                }
                else if(st.peek()=='{' && arr[i]=='}'){
                    st.pop();
                }
                else  if(st.peek()=='[' && arr[i]==']'){
                    st.pop();
                }
                else{
                    return false;
                }
            }
            else if(st.empty() && (arr[i]=='}' ||arr[i]==']' ||arr[i]==')')){
                return false;
            }


        }
        if(!st.empty()){
            return false;
        }
        return true;
    }

    public static void printEquilTriangle(int n){
        /* Question 6. Print equilateral triangle of size n */
        int arr[][]=new int[n][n];
        for (int i = 0; i < n; i++){
            for (int j = 0; j <= i; j++){
                if (i == j || j == 0) {
                    arr[i][j] = 1;
                }
                else {
                    arr[i][j] = arr[i - 1][j - 1] + arr[i - 1][j];
                }
                System.out.print(arr[i][j] +" ");
            }
            System.out.println();
        }


    }
    public static void printSecMaxDiff(int[] arr ){
        /* Question 2. Print second  maximum difference
        between any two elements from an array. */
        int maxDiff=0,secMaxDiff=0;
        for(int i=0;i<arr.length-1;i++){
            for(int j=i+1;j<arr.length;j++){
                int diff=Math.abs(arr[i]-arr[j]);
                if(diff>maxDiff){
                    secMaxDiff=maxDiff;
                    maxDiff=diff;
                }
                else if(diff>secMaxDiff && diff<maxDiff)
                    secMaxDiff=diff;
            }
        }
        System.out.println(secMaxDiff);
    }
}
