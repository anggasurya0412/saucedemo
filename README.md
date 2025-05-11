## Set up
1. Make sure you have already install python & pip, if you want install it : 
   -  macOS : ``` brew install python@3.11 ```
   -  windows / linux : 
         ``` 
            sudo apt update
            sudo apt install python3.11
         ```
2. install all package using ``` pip install -r requirements.txt ```
3. install `rfbrowser init` to use playwright libarary

## How to run test :
```
robot  -v BROWSER:CHROME  [pathFile]

e.g : robot -v BROWSER:Chrome  TestSuite/sauce_demo_tests.robot

hedless mode:
Staging --> robot -v BROWSER:Chrome headless  [pathFile]
e.g : robot -v BROWSER:Chrome headless   TestSuite/sauce_demo_tests.robot
```