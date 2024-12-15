# Project-GenerationTech

#### Road Accident Detection System with Spring Boot  
The system consists of both hardware and software components.  

## Hardware  
The hardware part uses an Arduino Nano, to which the following modules are connected:  
- GSM Module  
- GPS Module  
- Accelerometer/Gyroscope  

![image](https://github.com/user-attachments/assets/17aa12f5-da09-404c-aa41-f07d0b6cde54)  
Block diagram (without ESP)  

## Software  
For the software part, I used a Spring Boot server connected to a database where the data received from the sensors is stored.  

### Development Plans  
Depending on the available time (the master's O-O session is coming up), I plan to:  
- Add a web interface made with HTML and CSS.  
- Add other functionalities based on your suggestions.  

### Updates  
#### Ver 0.3  
In this version, POST and GET methods can be used to send and display data from MySQL. It was tested with PostMan. Progress has also been made on the hardware side, as we successfully transmitted data directly from the ESP8266 to the server automatically.

#### Ver 1.0 
In this version, the core functionalities of the project have been successfully implemented. For more details, please refer to the comprehensive description below.

---

## User Guide for CrashGuard System

Welcome to the Q&A page, where you can explore the features and functionalities of this exciting project.

### How to Use CrashGuard
To begin with, CrashGuard uses MySQL as its database, which runs in a Docker container. Follow these steps to set up the database:

### Step 1: Create the database in Docker
docker run --detach --env MYSQL_ROOT_PASSWORD=passwordroot --env MYSQL_USER=cosmin-user --env MYSQL_PASSWORD=cosminparola --env MYSQL_DATABASE=Accidents --name mysql --publish 3306:3306 mysql:8-oracle

### Step 2: Start MySQL shell
mysqlsh

### Step 3: Connect to the database
\connect cosmin-user@localhost:3306
### Enter the password: cosminparola

### Step 4: Switch to the Accidents database
\use Accidents

### Step 5: View the contents of the database
\sql <br>
SELECT * FROM accident;

### Step 6: Access the web interface in the browser
 Open this URL: http://localhost:8080/login

### Step 7: Log in with one of the following combinations
 Username: root, Password: root
 OR
 Username: cosmin, Password: cosmin

### Step 8: Manage accidents through the web interface
 Navigate to the AccidentsDB section in the navigation bar to:
 - Add a new accident by clicking "Add Accident"
 - Update the intensity, amplitude, and time fields
 - Delete a single entry by selecting the appropriate option
 - Delete all accidents by clicking the "Delete All Accidents" button

- Each user's data is stored individually, meaning no one else can access your information without the proper login credentials. This page is protected by Spring Boot Security, ensuring access is restricted until you successfully log in.

### Accident Detection
The system continuously monitors acceleration and orientation changes using the MPU-6050 sensor. It calculates the amplitude of acceleration and evaluates it against three trigger levels:
- **Level 1**: Detects minor acceleration deviations (e.g., bumps or minor movements).
- **Level 2**: Detects significant acceleration deviations, indicating a possible accident.
- **Level 3**: Monitors changes in orientation to confirm severe impacts and potential accidents.  
Once all three triggers are detected in sequence, an accident is confirmed.

### Accident Intensity Assessment
The amplitude of acceleration is classified into four categories:
- **Light**: Minimal impact.
- **Medium**: Moderate impact.
- **Dangerous**: Severe impact.
- **Very Dangerous**: Extremely severe impact.  
The system labels accidents based on this classification, helping assess the severity of the incident.

### GPS Location Integration
The GPS module provides the system's current geographical location. If an accident is detected, the system retrieves and formats the GPS coordinates into a Google Maps link, allowing for easy location tracking.

### Accident Alert via GSM Module
Once an accident is confirmed:
- A text message (SMS) is sent to a predefined emergency contact number.
- The SMS includes the type of accident (intensity) and the accident's location (Google Maps link).
- The GSM module is configured in text mode to handle SMS communication.

### Real-Time Monitoring
The system uses the Arduino Nano's serial communication to print debugging information, including:
- Acceleration amplitude values.
- Accident severity classification.
- Trigger statuses (e.g., Level 1, Level 2, Level 3).
- Final accident confirmation and alert status.  
This data is available for system testing and validation.

### Fault-Tolerant Operation
The system implements timeout mechanisms for GSM communication to ensure reliability. It includes safeguards to reset triggers if accident conditions are not sustained.

### Data Transmission to the Server
The system is capable of sending accident data from an ESP device directly to the server. This functionality ensures that detected incidents are logged in real-time by transmitting key information such as accident type, GPS location, and timestamps via a POST request.

### Accident Details Form
The accident details form captures information about the accident, including:
- **Intensity**: A text field for entering accident intensity (e.g., Light, Medium, Dangerous).
- **Amplitude**: A text field for describing the impact force.
- **Target Date**: A date picker to select the target date of the accident.
- **Submit Button**: Submits the form to store the accident data.

### Spring Security Configuration
Spring Security is used to secure the application, with the following components:
- **UserDetailsManager**: Stores credentials for users (e.g., root, cosmin) and assigns roles.
- **PasswordEncoder**: BCrypt is used for password hashing.
- **SecurityFilterChain**: Ensures URLs are protected, and unauthorized access is redirected to the login page.

### Welcome Controller
The Welcome Controller displays a personalized message after login, using the username stored in the session.

### Accident Management (JPA Version)
The Accident Management component handles accident data storage and management:
- **AccidentService**: Manages accident data with methods to add, delete, find, and update accidents.
- **AccidentControllerJpa**: Manages user interactions with accident data (e.g., list, add, delete, update accidents).

### Accident Entity (JPA)
The Accident entity represents an accident in the database with fields like id, username, intensity, amplitude, targetDate, and done (boolean). It includes getters, setters, and a toString() method for debugging.

### User Interface for Accident Management
The user interface for managing accidents includes:
- **Accidents List**: Displays all accidents for the logged-in user.
- **Add Accident**: A button to add a new accident.
- **Delete All Accidents**: A button to remove all accidents from the database.

### Dependencies
The project utilizes several dependencies to ensure smooth functionality and efficient development. Below is a description of the main dependencies used in this Spring Boot application:
- **Spring Boot Starter Web**: Provides essential features for building web applications, including RESTful APIs, embedded servers (like Tomcat), and JSON processing.
- **Tomcat Embed Jasper**: Required for JSP support in the project, enabling rendering of JSP pages.
- **Spring Boot Starter Security**: Implements security features such as authentication, authorization, and session management to protect the application.
- **Spring Boot Starter Data JPA**: Integrates Java Persistence API (JPA) for database operations, simplifying data access with Hibernate ORM.
- **Spring Boot Starter Validation**: Provides bean validation support to validate user inputs in the application.
- **Spring Boot DevTools**: A runtime dependency that improves development workflow by enabling hot-reload and automatic restarts during code changes.
- **Spring Boot Starter Test**: Adds testing dependencies for unit testing and integration testing using JUnit, Mockito, and Spring Test.
- **MySQL Connector Java**: A JDBC driver for connecting the Spring Boot application to a MySQL database.
- **Jakarta Persistence API**: Provides the JPA API for managing persistence in the application.
- **WebJars (Bootstrap, jQuery, Bootstrap Datepicker)**: These WebJars provide the frontend libraries (Bootstrap for responsive design, jQuery for DOM manipulation, and Bootstrap Datepicker for date selection).
