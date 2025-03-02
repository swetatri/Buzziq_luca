<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $user_input = $_POST['message'];

    // Gemini API Key (Replace with your new secure API key)
    $api_key = "AIzaSyC9NKkWNHCOm9Z2r8lz_gww8x2emmVlQiw"; 

    // Gemini API Endpoint (Using Gemini 2.0 Flash)
    $url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$api_key";

    // Request payload (correct format for Gemini 2.0 Flash)
    $data = [
        "contents" => [
            ["parts" => [["text" => $user_input]]]
        ]
    ];

    // Convert data to JSON
    $json_data = json_encode($data);

    // cURL request to Gemini API
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, ["Content-Type: application/json"]);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $json_data);
    
    // Execute cURL request
    $response = curl_exec($ch);
    curl_close($ch);

    // Decode API response
    $response_data = json_decode($response, true);

    // Extract chatbot response correctly
    if (isset($response_data['candidates'][0]['content']['parts'][0]['text'])) {
        echo $response_data['candidates'][0]['content']['parts'][0]['text'];
    } else {
        echo "Sorry, I couldn't process your request.";
    }
}
?>
