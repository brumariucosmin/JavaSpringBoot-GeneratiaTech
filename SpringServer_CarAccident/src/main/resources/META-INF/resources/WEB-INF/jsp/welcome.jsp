<%@ include file="common/header.jspf"%>
<%@ include file="common/navigation.jspf"%>

<div class="container" style="font-family: Arial, sans-serif; line-height: 1.6; color: #333;">
    <h1 style="text-align: center; color: #040273; margin-bottom: 30px;">
        Hello, ${name}! Welcome to the Q&A page, where you can explore the features and functionalities of this exciting project.
    </h1>

    <div class="section" style="background-color: #f9f9f9; padding: 20px; margin-bottom: 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
        <h2 style="color: #040273; margin-bottom: 15px;">1. How to Use CrashGuard</h2>
        <p>By accessing the AccidentsDB page, you can add new entries, modify existing ones, or delete them. All elements in the database are connected live to MySQL, ensuring that your data is securely stored and accessible each time you log in. Each user's data is stored individually, meaning no one else can access your information without the proper login credentials. This page is protected by Spring Boot Security, ensuring access is restricted until you successfully log in.</p>
    </div>

    <div class="section" style="background-color: #f9f9f9; padding: 20px; margin-bottom: 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
        <h2 style="color: #040273; margin-bottom: 15px;">2. Accident Detection</h2>
        <p>The system continuously monitors acceleration and orientation changes using the MPU-6050 sensor. It calculates the amplitude of acceleration and evaluates it against three trigger levels:</p>
        <ul>
            <li><strong>Level 1:</strong> Detects minor acceleration deviations (e.g., bumps or minor movements).</li>
            <li><strong>Level 2:</strong> Detects significant acceleration deviations, indicating a possible accident.</li>
            <li><strong>Level 3:</strong> Monitors changes in orientation to confirm severe impacts and potential accidents.</li>
        </ul>
        <p>Upon detecting all three triggers in sequence, an accident is confirmed.</p>
    </div>

    <div class="section" style="background-color: #f9f9f9; padding: 20px; margin-bottom: 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
        <h2 style="color: #040273; margin-bottom: 15px;">3. Accident Intensity Assessment</h2>
        <p>The amplitude of acceleration is classified into four categories:</p>
        <ul>
            <li><strong>Light:</strong> Minimal impact.</li>
            <li><strong>Medium:</strong> Moderate impact.</li>
            <li><strong>Dangerous:</strong> Severe impact.</li>
            <li><strong>Very Dangerous:</strong> Extremely severe impact.</li>
        </ul>
        <p>The system labels accidents based on this classification, helping assess the severity of the incident.</p>
    </div>

    <div class="section" style="background-color: #f9f9f9; padding: 20px; margin-bottom: 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
        <h2 style="color: #040273; margin-bottom: 15px;">4. GPS Location Integration</h2>
        <p>The GPS module provides the system's current geographical location. If an accident is detected, the system retrieves and formats the GPS coordinates into a Google Maps link, allowing for easy location tracking.</p>
    </div>

    <div class="section" style="background-color: #f9f9f9; padding: 20px; margin-bottom: 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
        <h2 style="color: #040273; margin-bottom: 15px;">5. Accident Alert via GSM Module</h2>
        <p>Once an accident is confirmed:</p>
        <ul>
            <li>A text message (SMS) is sent to a predefined emergency contact number.</li>
            <li>The SMS includes the type of accident (intensity) and the accident's location (Google Maps link).</li>
        </ul>
        <p>The GSM module is configured in text mode to handle SMS communication.</p>
    </div>

    <div class="section" style="background-color: #f9f9f9; padding: 20px; margin-bottom: 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
        <h2 style="color: #040273; margin-bottom: 15px;">6. Real-Time Monitoring</h2>
        <p>The system uses the Arduino Nano's serial communication to print debugging information, including:</p>
        <ul>
            <li>Acceleration amplitude values.</li>
            <li>Accident severity classification.</li>
            <li>Trigger statuses (e.g., Level 1, Level 2, Level 3).</li>
            <li>Final accident confirmation and alert status.</li>
        </ul>
        <p>This data is available for system testing and validation.</p>
    </div>

    <div class="section" style="background-color: #f9f9f9; padding: 20px; margin-bottom: 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
        <h2 style="color: #040273; margin-bottom: 15px;">7. Fault-Tolerant Operation</h2>
        <p>The system implements timeout mechanisms for GSM communication to ensure reliability. It includes safeguards to reset triggers if accident conditions are not sustained.</p>
    </div>

    <div class="section" style="background-color: #f9f9f9; padding: 20px; margin-bottom: 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
        <h2 style="color: #040273; margin-bottom: 15px;">8. Data Transmission to the Server</h2>
        <p>The system is capable of sending accident data from an ESP device directly to the server. This functionality ensures that detected incidents are logged in real-time by transmitting key information such as accident type, GPS location, and timestamps via a POST request.</p>
    </div>

    <div class="section" style="background-color: #f9f9f9; padding: 20px; margin-bottom: 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
        <h2 style="color: #040273; margin-bottom: 15px;">9. Accident Details Form</h2>
        <p>The accident details form captures information about the accident, including:</p>
        <ul>
            <li><strong>Intensity:</strong> A text field for entering accident intensity (e.g., Light, Medium, Dangerous).</li>
            <li><strong>Amplitude:</strong> A text field for describing the impact force.</li>
            <li><strong>Target Date:</strong> A date picker to select the target date of the accident.</li>
            <li><strong>Submit Button:</strong> Submits the form to store the accident data.</li>
        </ul>
    </div>

    <div class="section" style="background-color: #f9f9f9; padding: 20px; margin-bottom: 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
        <h2 style="color: #040273; margin-bottom: 15px;">10. Spring Security Configuration</h2>
        <p>Spring Security is used to secure the application, with the following components:</p>
        <ul>
            <li><strong>UserDetailsManager:</strong> Stores credentials for users (e.g., root, cosmin) and assigns roles.</li>
            <li><strong>PasswordEncoder:</strong> BCrypt is used for password hashing.</li>
            <li><strong>SecurityFilterChain:</strong> Ensures URLs are protected, and unauthorized access is redirected to the login page.</li>
        </ul>
    </div>

    <div class="section" style="background-color: #f9f9f9; padding: 20px; margin-bottom: 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
        <h2 style="color: #040273; margin-bottom: 15px;">11. Welcome Controller</h2>
        <p>The Welcome Controller displays a personalized message after login, using the username stored in the session.</p>
    </div>

    <div class="section" style="background-color: #f9f9f9; padding: 20px; margin-bottom: 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
        <h2 style="color: #040273; margin-bottom: 15px;">12. Accident Management (JPA Version)</h2>
        <p>The Accident Management component handles accident data storage and management:</p>
        <ul>
            <li><strong>AccidentService:</strong> Manages accident data with methods to add, delete, find, and update accidents.</li>
            <li><strong>AccidentControllerJpa:</strong> Manages user interactions with accident data (e.g., list, add, delete, update accidents).</li>
        </ul>
    </div>

    <div class="section" style="background-color: #f9f9f9; padding: 20px; margin-bottom: 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
        <h2 style="color: #040273; margin-bottom: 15px;">13. Accident Entity (JPA)</h2>
        <p>The Accident entity represents an accident in the database with fields like id, username, intensity, amplitude, targetDate, and done (boolean). It includes getters, setters, and a toString() method for debugging.</p>
    </div>

    <div class="section" style="background-color: #f9f9f9; padding: 20px; margin-bottom: 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
        <h2 style="color: #040273; margin-bottom: 15px;">14. User Interface for Accident Management</h2>
        <p>The user interface for managing accidents includes:</p>
        <ul>
            <li><strong>Accidents List:</strong> Displays all accidents for the logged-in user.</li>
            <li><strong>Add Accident:</strong> A button to add a new accident.</li>
            <li><strong>Delete All Accidents:</strong> A button to remove all accidents from the database.</li>
        </ul>
    </div>
    <div class="section" style="background-color: #f9f9f9; padding: 20px; margin-bottom: 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
        <h2 style="color: #34495e; margin-bottom: 15px;">15. Dependencies</h2>
        <p>The project utilizes several dependencies to ensure smooth functionality and efficient development. Below is a description of the main dependencies used in this Spring Boot application:</p>
        <ul>
            <li><strong>Spring Boot Starter Web:</strong> Provides essential features for building web applications, including RESTful APIs, embedded servers (like Tomcat), and JSON processing.</li>
            <li><strong>Tomcat Embed Jasper:</strong> Required for JSP support in the project, enabling rendering of JSP pages.</li>
            <li><strong>Spring Boot Starter Security:</strong> Implements security features such as authentication, authorization, and session management to protect the application.</li>
            <li><strong>Spring Boot Starter Data JPA:</strong> Integrates Java Persistence API (JPA) for database operations, simplifying data access with Hibernate ORM.</li>
            <li><strong>Spring Boot Starter Validation:</strong> Provides bean validation support to validate user inputs in the application.</li>
            <li><strong>Spring Boot DevTools:</strong> A runtime dependency that improves development workflow by enabling hot-reload and automatic restarts during code changes.</li>
            <li><strong>Spring Boot Starter Test:</strong> Adds testing dependencies for unit testing and integration testing using JUnit, Mockito, and Spring Test.</li>
            <li><strong>MySQL Connector Java:</strong> A JDBC driver for connecting the Spring Boot application to a MySQL database.</li>
            <li><strong>Jakarta Persistence API:</strong> Provides the JPA API for managing persistence in the application.</li>
            <li><strong>WebJars (Bootstrap, jQuery, Bootstrap Datepicker):</strong> These WebJars provide the frontend libraries (Bootstrap for responsive design, jQuery for DOM manipulation, and Bootstrap Datepicker for date selection).</li>
        </ul>
    </div>
    <div class="section" style="background-color: #f9f9f9; padding: 20px; margin-bottom: 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
        <h2 style="color: #040273; margin-bottom: 15px;">Would you like to learn more?</h2>
        <p>Click on the CrashGuard title above or <a href="https://github.com/brumariucosmin/JavaSpringBoot-GeneratiaTech">here</a>, to visit our GitHub repository. There, you'll discover additional details, along with photos and videos showcasing the project in action!</p>
    </div>
</div>

<%@ include file="common/footer.jspf"%>
