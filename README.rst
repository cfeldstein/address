====================================================
    Address-O-Matic - Automated Test Suite
====================================================

.. contents:: **Contents:**
   :depth: 1
   :local:

Setup
-----

- Install Python 3.7
    https://www.python.org/downloads/release/python-379/
- Install Pip
    If using Python 2.7.9 and above this is included with python install
- Create a working venv for python
    https://docs.python.org/3.7/library/venv.html
- Clone the repository code to the venv
- Goto root of your venv working directory
- Install Robot Framework
    pip install robotframework
- Install Selenium for Robot Framework
    pip install --upgrade robotframework-seleniumlibrary
- Install WebDriverManager
    pip install webdrivermanager
- Install WebDriver Binary for Chrome
    webdrivermanager --downloadpath ./WebDriverManager chrome
- Install Request Library for Robot Framework
    pip install --upgrade robotframework-requests

To Run
------

- API Tests
    robot -d ./output/api address-o-matic_tests/api_tests.robot

- Web Tests
    robot -d ./output/web address-o-matic_tests/web_tests.robot

- All
    robot -d ./output address-o-matic_tests/

To View Results
---------------

- Open in Browser the report.html file located in the output directory. Note the results are overwritten with each run.





