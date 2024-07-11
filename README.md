# Robot Framework Browser Automation

This project leverages the Robot Framework with the Browser library for automated web testing, specifically focusing on testing a login form. The project includes the following key steps:

### Project Workflow

1. **Create a New Account Using a Random Email Address**:
    - A random email address is generated using the [1secmail](https://www.1secmail.com/api/#) service via API.
    - For the API calls [RESTinstance](https://asyrjasalo.github.io/RESTinstance/) library is used 
    - This email is used to fill out the registration form and create a new account.
   
2. **Fill registration form**:
    - [Robot Framework Browser](https://github.com/MarketSquare/robotframework-browser): For browser automation.
   
3. **Get a Confirmation Email**:
    - The system retrieves the confirmation email sent to the generated random email address.

4. **Click the Verifying Email Link**:
    - The confirmation email contains a verification link.
    - The system extracts and clicks this link to verify the email address.

5. **Set Up Password**:
    - After verifying the email, the system prompts the user to set up a password.
    - The password is set according to the defined requirements.

6. **Login**:
    - Using the verified email and the newly set password, the system logs into the application.

7. **Verify That the User is Logged In**:
    - After logging in, the system verifies that the user is successfully logged in by checking for certain elements or user information on the profile page.


## Prerequisites
1. Installed NodeJS v20.15.1 https://nodejs.org/en/download/package-manager
2. Installed Python 3.9.13 https://www.python.org/downloads/

## Setup Instructions

### 1. Update pip
Ensure you have the latest version of pip installed:

```sh
python.exe -m pip install --upgrade pip
```

### 2. Create a Virtual Environment
Create a virtual environment to manage your project's dependencies:

```sh
python -m venv env
```
### 3. Activate the Virtual Environment

* Windows:

```sh
 .\env\Scripts\activate
```    
    
* macOS/Linux:             

```sh
source env/bin/activate 
```

### 4. Install Dependencies
Install the required dependencies using the provided requirements.txt file:

```sh
pip install -r requirements.txt
```

### 5. Run the Test Suite
Initialize the Browser environment and run the tests:

* Initialize the Browser Environment:
```sh
rfbrowser init
```

* Run Tests:
```sh
robot --outputdir .\results --pythonpath .\ --loglevel TRACE tests
```

#### NOTE: Running Tests with ENVIRONMENT Variable
Before running your tests, ensure you have set the ENVIRONMENT variable to either 'production', 'staging', or 'test'. This variable determines which URL will be used in your test scenarios. If no ENVIRONMENT variable is then, then test suite will run 'production'