<?php
  // Fetching all the Navbar Data
  require('./includes/nav.inc.php');

  // Checking if the User is logged in already
  if(isset($_SESSION['USER_LOGGED_IN']) && $_SESSION['USER_LOGGED_IN'] == "YES") {
    
    // Redirected to home page
    redirect('./index.php');
  }

  // Whenever login button is pressed
  if(isset($_POST['login-submit'])) {

    // Fetching values via POST and passing them to user defined function 
    // to get rid of special characters used in SQL
    $loginEmail = get_safe_value($_POST['login-email']);
    $loginPassword = get_safe_value($_POST['login-password']);
    
    // Login Query to check if the email submitted is present or registered
    $loginQuery = " SELECT * FROM user 
                    WHERE user_email = '{$loginEmail}'";
    
    // Running the Login Query
    $result = mysqli_query($con, $loginQuery);
    
    // Returns the number of rows from the result retrieved.
    $rows = mysqli_num_rows($result);

    // If query has any result (records) => If any user with the email exists
    if($rows > 0) {

      // Fetching the data of particular record as an Associative Array
      while($data = mysqli_fetch_assoc($result)) {

        // Verifing whether the password matches the hash from DB
        $password_check = password_verify($loginPassword, $data['user_password']);
        
        // If password matches with the data from DB
        if($password_check) {

          // Setting user specific session variables
          $_SESSION['USER_NAME'] = $data['user_name'];
          $_SESSION['USER_LOGGED_IN'] = "YES";
          $_SESSION['USER_ID'] = $data['user_id'];
          $_SESSION['USER_EMAIL'] = $data['user_email'];

          // Unsetting all the author specific session variables
          unset($_SESSION['AUTHOR_NAME']);
          unset($_SESSION['AUTHOR_LOGGED_IN']);
          unset($_SESSION['AUTHOR_ID']);
          unset($_SESSION['AUTHOR_EMAIL']);

          // Redirected to home page
          redirect('./index.php');
        }

        // If the password fails to match
        else {

          // Redirected to login page along with a message
          alert("Wrong Password");
          redirect('./user-login.php');
        }
      }     
    }
    // If the email is not registered 
    else {

      // Redirected to signup page along with a message
      alert("This Email is not registered. Please Register");
      redirect('./user-login.php');
    }
  }

  // Whenever login button is pressed
  if(isset($_POST['signup-submit'])) {

    // Fetching values via POST and passing them to user defined 
    // function to get rid of special characters used in SQL
    $signupName = get_safe_value($_POST['signup-name']);
    $signupEmail = get_safe_value($_POST['signup-email']);
    $signupPassword = get_safe_value($_POST['signup-password']);

    // Creating new password hash using a strong one-way hashing algorithm => CRYPT_BLOWFISH algorithm
    $strg_pass = password_hash($signupPassword,PASSWORD_BCRYPT);
    
    // Check Query to check if the email submitted is present or registered already
    $check_sql = "SELECT user_email FROM user 
                  WHERE user_email = '{$signupEmail}'";
    
    // Running the Check Query
    $check_result = mysqli_query($con,$check_sql);
    
    // Returns the number of rows from the result retrieved.
    $check_row = mysqli_num_rows($check_result);
    
    // If query has any result (records) => If any user with the email exists
    if($check_row > 0) {

      // Redirecting to the login page along with a message
      alert("Email Already Exists");
      redirect('./user-login.php');
    }

    // If the query has no records => No user with the email exists (New User)
    else {

      // Signup Query to insert values into the DB
      $signupQuery = "INSERT INTO user 
                      (user_name, user_email, user_password) 
                      VALUES 
                      ('{$signupName}', '{$signupEmail}', '{$strg_pass}')";

      // Running the signup query
      $result = mysqli_query($con, $signupQuery);

      //If Query ran successfully
      if($result) {
        
        // Redirected to login page with a message
        alert("Signup Successful, Please Login");
        redirect('./user-login.php');
      }
      
      // If the Query failed
      else {

        // Print the error
        echo "Error: ".mysqli_error($con);
      }
    }
  }
?>


<div class="container p-2">
  <!-- Container to store two form divs -->
  <div class="forms-container">
    <!-- Left div for login -->
    <div class="left">
      <div class="form-title">
        <h4>User Login</h4>
      </div>
      <div class="login-form-container">
        <!-- Form for Login -->
        <form method="POST" class="login-form" id="login-form">
          <div class="input-field">
            <input type="email" name="login-email" id="login-email" placeholder=" Email Address" autocomplete="off"
              required>
          </div>
          <div class="input-field">
            <input type="password" name="login-password" id="login-password" placeholder=" Password" autocomplete="off"
              required>
          </div>
          <div class="input-field">
            <button type="submit" name="login-submit">Login</button>
          </div>
        </form>
      </div>
      <!-- Div to display the errors from the Login form -->
      <div class="form-errors">
        <p class="errors" id="login-errors"></p>
      </div>
    </div>
    <!-- Right div for Signup -->
    <div class="right">
      <div class="form-title">
        <h4>User Signup</h4>
      </div>
      <div class="signup-form-container">
        <!-- Form for Signup -->
        <form method="POST" class="signup-form" id="signup-form">
          <div class="input-field">
            <input type="text" name="signup-name" id="signup-name" placeholder=" Name" autocomplete="off" required>
          </div>
          <div class="input-field">
            <input type="email" name="signup-email" id="signup-email" placeholder=" Email Address" autocomplete="off"
              required>
          </div>
          <div class="input-field">
            <input type="password" name="signup-password" id="signup-password" placeholder=" Password"
              autocomplete="off" required>
          </div>
          <div class="input-field">
            <input type="password" name="signup-confirm-password" id="signup-confirm-password"
              placeholder=" Confirm Password" autocomplete="off" required>
          </div>
          <div class="input-field">
            <button type="submit" name="signup-submit">Signup</button>
          </div>
        </form>
      </div>
      <!-- Div to display the errors from the Signup form -->
      <div class="form-errors d-flex">
        <p class="errors" id="signup-errors">
          Password must be 6 to 20 characters long with aleast 1 number, 1 uppercase and 1 lowecase
        </p>
      </div>
    </div>
  </div>
</div>

<!-- Script for form Validation -->
<script src="./assets/js/form-validate.js"></script>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chatbot</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .chat-button {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color:rgba(225, 20, 31, 0.91);
            color: white;
            border: none;
            padding: 15px 20px;
            border-radius: 50px;
            cursor: pointer;
            font-size: 16px;
        }
        .chat-container {
            display: none;
            position: fixed;
            bottom: 80px;
            right: 20px;
            width: 300px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .chat-header {
            background:rgba(225, 20, 31, 0.91);
            color: white;
            padding: 10px;
            text-align: center;
            font-weight: bold;
        }
        .chat-box {
            height: 300px;
            overflow-y: auto;
            padding: 10px;
        }
        .message {
            padding: 8px;
            border-radius: 10px;
            margin: 5px;
            max-width: 80%;
        }
        .user-message {
            background:rgba(37, 133, 211, 0.5);
            align-self: flex-end;
            text-align: right;
        }
        .bot-message {
            background:rgba(224, 224, 224, 0.33);
            align-self: flex-start;
        }
        .chat-input {
            display: flex;
            padding: 10px;
            border-top: 1px solid #ccc;
        }
        .chat-input input {
            flex: 1;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .chat-input button {
            background:rgba(225, 20, 31, 0.91);
            color: white;
            border: none;
            padding: 8px 15px;
            margin-left: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <button class="chat-button" onclick="toggleChat()">𝐋𝐔𝐂𝐀 : 𝐂𝐡𝐚𝐭𝐭𝐞𝐫𝐁𝐞𝐞 🐝✨ </button>
    <div class="chat-container" id="chatContainer">
        <div class="chat-header">Luca 😇💬 </div>
        <div class="chat-box" id="chatBox"></div>
        <div class="chat-input">
            <input type="text" id="userInput" placeholder="Type a message...">
            <button onclick="sendMessage()">Send</button>
        </div>
    </div>

    <script>
        function toggleChat() {
            let chatContainer = document.getElementById("chatContainer");
            chatContainer.style.display = chatContainer.style.display === "none" ? "block" : "none";
        }

        function sendMessage() {
            let userInput = document.getElementById("userInput");
            let chatBox = document.getElementById("chatBox");
            let message = userInput.value.trim();
            
            if (message === "") return;
            
            let userMessage = `<div class='message user-message'>${message}</div>`;
            chatBox.innerHTML += userMessage;
            userInput.value = "";
            chatBox.scrollTop = chatBox.scrollHeight;
            
            fetch('chatbot.php', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: 'message=' + encodeURIComponent(message)
            })
            .then(response => response.text())
            .then(data => {
                let botMessage = `<div class='message bot-message'>${data}</div>`;
                chatBox.innerHTML += botMessage;
                chatBox.scrollTop = chatBox.scrollHeight;
            })
            .catch(error => console.error('Error:', error));
        }
    </script>
</body>
</html>
<?php

  // Fetching all the Footer Data
  require('./includes/footer.inc.php');
?>