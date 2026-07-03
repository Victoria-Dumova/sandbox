# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Java sandbox/testing repository used primarily for testing IntelliJ IDEA features, terminal behavior, and various Java functionality. It's structured as an IntelliJ IDEA project using Java 23.

## Build & Run Commands

This project uses IntelliJ IDEA's built-in Java compilation (no Maven/Gradle).

**Compile and run a specific class:**
```bash
# Compile from project root
javac -d out/production/Sandbox -sourcepath src src/Main.java

# Run the compiled class
java -cp out/production/Sandbox Main
```

**Compile and run classes in packages:**
```bash
# For terminal.sandbox package classes
javac -d out/production/Sandbox -sourcepath src src/terminal/sandbox/OutputTest.java
java -cp out/production/Sandbox terminal.sandbox.OutputTest

# For text.search package classes
javac -d out/production/Sandbox -sourcepath src src/text/search/DrawDot.java
```

**Run tests:**
```bash
# Compile and run JUnit tests (JUnit 5.8.1 and JUnit 4.13.1 are configured)
javac -d out/production/Sandbox -cp "out/production/Sandbox:$MAVEN_REPOSITORY/org/junit/jupiter/junit-jupiter/5.8.1/*" -sourcepath test test/MainTest.java
java -cp "out/production/Sandbox:$MAVEN_REPOSITORY/org/junit/jupiter/junit-jupiter/5.8.1/*:$MAVEN_REPOSITORY/org/junit/platform/junit-platform-console-standalone/1.8.1/*" org.junit.platform.console.ConsoleLauncher --class-path out/production/Sandbox --scan-class-path
```

## Repository Structure

```
sandbox/
├── src/                          # Source files directory
│   ├── Main.java                 # Simple test program with internationalization examples
│   ├── Foo.java                  # Minimal utility class
│   ├── terminal/sandbox/         # Terminal testing utilities
│   │   ├── InputTest.java        # Scanner-based input testing
│   │   ├── OutputTest.java       # Console output testing with Unicode
│   │   ├── TypeAlphabet.java     # Robot-based automated typing (a-z)
│   │   ├── TypeNumbers.java      # Robot-based automated number typing
│   │   └── *.sh                  # Shell scripts for terminal testing
│   ├── text/search/              # Text processing utilities
│   │   └── DrawDot.java          # Graphviz/DOT graph generation utility
│   └── floating/toolbar/         # UI-related test files
│
├── test/                         # Test directory
│   └── MainTest.java             # JUnit test skeleton
│
├── out/                          # Compiled classes output
└── Sandbox.iml                   # IntelliJ IDEA module configuration
```

## Key Components

### Terminal Testing Suite (`terminal.sandbox`)
- **Purpose**: Testing terminal I/O, Unicode rendering, and automated input simulation
- **Robot-based classes**: `TypeAlphabet` and `TypeNumbers` use `java.awt.Robot` to simulate keyboard input after a 5-second delay. These are useful for testing terminal input behavior in IntelliJ IDEA.
- **I/O testing**: `InputTest` for Scanner-based input, `OutputTest` for console output with various Unicode characters

### Graphviz Utility (`text.search.DrawDot`)
- **Purpose**: Programmatic generation of Graphviz DOT format for visualizing data structures
- **License**: Apache 2.0
- **Usage**: Create graphs with nodes, edges, colors, shapes, and styling for visual documentation
- **Online viewer**: https://dreampuf.github.io/GraphvizOnline/

### Main Entry Points
- `Main.java`: Primary entry point with internationalization test strings (Chinese, Arabic, Hebrew, Korean)
- Package-specific classes have their own `main()` methods for standalone execution

## Development Notes

- **Java Version**: Java 23 (configured in `.idea/misc.xml`)
- **Testing Framework**: Supports both JUnit 4.13.1 and JUnit 5.8.1
- **Kotlin Runtime**: KotlinJavaRuntime is configured as a dependency
- **Source Folders**: `src/` for main code, `test/` for tests
- **Unicode Support**: Multiple classes test Unicode rendering (Chinese, Arabic, Hebrew, Korean characters)

## Working with Robot Classes

The `TypeAlphabet` and `TypeNumbers` classes use `java.awt.Robot` to automate keyboard input:
- Both have a 5-second delay (`Thread.sleep(5000)`) before typing begins
- This delay allows you to focus the target window (e.g., IntelliJ Terminal)
- Uncomment `robot.setAutoDelay(50)` to add delays between keypresses
- These are testing utilities, not production code
