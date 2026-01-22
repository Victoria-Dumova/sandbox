package terminal.sandbox.java;

import java.util.Scanner;

class InputTest {
    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);

        System.out.print("Enter smth: ");
        String smth = input.next();
        System.out.println("You entered " + smth);

        // closing the scanner object
        input.close();
    }
}