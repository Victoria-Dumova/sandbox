package terminal.java;

import java.awt.Robot;
import java.awt.event.KeyEvent;

public class TypeNumbers {
    public static void main(String[] args) throws Exception {
        // Give yourself 3 seconds to click into the IntelliJ Terminal (or any target window)
        Thread.sleep(5000);

        Robot robot = new Robot();
//        robot.setAutoDelay(50); // ms between key presses (tweak to taste)

        int rounds = 50;
        for (int round = 1; round <= rounds; round++) {
            for (int n = 0; n <= 10; n++) {
                typeNumber(robot, n);     // types 0..9 and 10
                if (n < 10) typeSpace(robot);
            }
//            pressEnter(robot);            // newline after each round
        }
    }

    private static void typeNumber(Robot robot, int n) {
        if (n < 0 || n > 10) return;
        if (n < 10) {
            pressDigit(robot, n);         // single digit
        } else {
            // "10" = '1' then '0'
            pressDigit(robot, 1);
            pressDigit(robot, 0);
        }
    }

    private static void pressDigit(Robot robot, int d) {
        int keyCode = KeyEvent.VK_0 + d;  // VK_0..VK_9 are contiguous
        robot.keyPress(keyCode);
        robot.keyRelease(keyCode);
    }

    private static void typeSpace(Robot robot) {
        robot.keyPress(KeyEvent.VK_SPACE);
        robot.keyRelease(KeyEvent.VK_SPACE);
    }

    private static void pressEnter(Robot robot) {
        robot.keyPress(KeyEvent.VK_ENTER);
        robot.keyRelease(KeyEvent.VK_ENTER);
    }
}

