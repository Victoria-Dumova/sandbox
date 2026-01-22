package terminal.sandbox.java;

import java.awt.Robot;
import java.awt.event.KeyEvent;

public class TypeAlphabet {
    public static void main(String[] args) throws Exception {
        // Give yourself 3 seconds to focus the IDE Terminal
        Thread.sleep(5000);

        Robot robot = new Robot();
//        robot.setAutoDelay(50); // ms between key presses

        // type a..z
        for (char c = 'a'; c <= 'z'; c++) {
            int keyCode = KeyEvent.VK_A + (c - 'a'); // VK_A..VK_Z are contiguous
            robot.keyPress(keyCode);
            robot.keyRelease(keyCode);
        }

        // press Enter
        robot.keyPress(KeyEvent.VK_ENTER);
        robot.keyRelease(KeyEvent.VK_ENTER);
    }
}
