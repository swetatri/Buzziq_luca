<?php
  // Fetching all the Navbar Data
  require('./includes/nav.inc.php');

  // Fetching all the Slider Data
  require('./includes/slider.inc.php');
?>

<!-- Article List Container -->
<section class="py-1 category-list">
  <div class="container">
    <h2 class="headings">Articles</h2>
    <div class="card-container">
      <?php

        // Article Query to fetch maximum 5 random articles
        $articleQuery = " SELECT category.category_name, category.category_color, article.*
                          FROM category, article
                          WHERE article.category_id = category.category_id
                          AND article.article_active = 1
                          ORDER BY RAND() LIMIT 5";
        
        // Running Article Query 
        $result = mysqli_query($con,$articleQuery);

        // Row stores the no of rows in the return data from Query
        $row = mysqli_num_rows($result);
        
        // If query has any result (records) => If any articles are present
        if($row > 0) {
          
          // Fetching the data of particular record as an Associative Array
          while($data = mysqli_fetch_assoc($result)) {
            
            // Storing the article data in variables
            $category_color = $data['category_color'];
            $category_name = $data['category_name'];
            $category_id = $data['category_id'];
            $article_id = $data['article_id'];
            $article_title = $data['article_title'];
            $article_image = $data['article_image'];
            $article_desc = $data['article_description'];
            $article_date = $data['article_date'];
            $article_trend = $data['article_trend'];
            
            // Updating the title with a substring containing at most length of 55 characters
            $article_title = substr($article_title,0,55).' . . . . .';
            
            // Updating the description with a substring containing at most length of 150 characters
            $article_desc = substr($article_desc,0,150).' . . . . .';
            
            // New variable to determine if the article is NEW
            $new = false;

            // Fetching present timestamp
            $tdy = time();

            // Article date is updated to a timestamp 
            $article_date = strtotime($article_date);
            
            // Found the difference between the article release timestamp and present timestamp
            $datediff = $tdy - $article_date;

            // Converting the difference into no of days
            $datediff = round($datediff / (60*60*24));

            // If the difference is less than 2 => article is less than 2 days older
            if($datediff < 2) {
              
              // Updating the variable to true to have a new tag on article card
              $new = true;
            }
            
            // Bookmarked variable to determine if the article is bookmarked by the user
            $bookmarked = false;
            
            // Checking if the user is logged in
            if(isset($_SESSION['USER_ID'])) {
              
              // Bookmark Query to check if the particular article is bookmarked by user
              $bookmarkQuery = "SELECT * FROM bookmark 
                                WHERE user_id = {$_SESSION['USER_ID']}
                                AND article_id = {$article_id}";
              
              // Running the Bookmark Query
              $bookmarkResult = mysqli_query($con, $bookmarkQuery);
              
              // Returns the number of rows from the result retrieved.
              $bookmarkRow = mysqli_num_rows($bookmarkResult);
              
              // If query has any result (records) => User has the article bookmarked
              if($bookmarkRow > 0) {
                
                // Updating the variable to true to have bookmarked icon on article card
                $bookmarked = true;
              }
            }

            // Calling user defined function to create an article card based upon given data
            createArticleCard($article_title, $article_image, 
                  $article_desc, $category_name, $category_id, $article_id, 
                  $category_color, $new, $article_trend, $bookmarked);

          }
        }
        // Calling user defined function to create a Addmore Card which directs to All Article Page
        createMoreCard('./articles.php');
      ?>

    </div>
  </div>
</section>


<!-- Category List Container -->
<section class="py-1 category-list">
  <div class="container">
    <h2 class="headings">Categories</h2>
    <div class="card-container">
      <?php
        // Category Query to fetch maximum 5 random category
        $categoryQuery= " SELECT * 
                          FROM category 
                          ORDER BY RAND() LIMIT 5";
        
        // Running Category Query
        $result = mysqli_query($con,$categoryQuery);
        
        // Returns the number of rows from the result retrieved.
        $row = mysqli_num_rows($result);

        // If query has any result (records) => If any categories are present
        if($row > 0) {
        
          // Fetching the data of particular record as an Associative Array
          while($data = mysqli_fetch_assoc($result)) {
            
            // Storing the category data in variables
            $category_id = $data['category_id'];
            $category_name = $data['category_name'];
            $category_image = $data['category_image'];
            $category_desc = $data['category_description'];
            
            // Calling user defined function to create an category card based upon given data
            createCategoryCard($category_name,$category_image,$category_desc,$category_id,);   
          }
        }
        // Calling user defined function to create a Addmore Card which directs to All Categories Page
        createMoreCard('./categories.php');
      ?>
    </div>
  </div>
</section>


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