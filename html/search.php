<?php
// Enable error reporting for development (disable in production)
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Check if the request method is POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Database connection parameters
    $servername = "localhost";
    $username = "root";
    $password = "password"; // Consider using environment variables for sensitive data
    $dbname = "dictionary";

    // Create a new MySQLi instance
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check the connection
    if ($conn->connect_error) {
        // Log the error and show a generic message to the user
        error_log("Connection failed: " . $conn->connect_error);
        die("Sorry, we're experiencing technical difficulties. Please try again later.");
    }

    // Prepare and bind the SQL statement
    $stmt = $conn->prepare("SELECT meaning FROM words WHERE word = ?");
    if ($stmt) {
        $stmt->bind_param("s", $_POST['word']);
        $stmt->execute();
        $stmt->bind_result($meaning);
        $stmt->fetch();
        $stmt->close();
    } else {
        // Log the error and show a generic message to the user
        error_log("Prepare failed: " . $conn->error);
        die("Sorry, we're experiencing technical difficulties. Please try again later.");
    }

    // Close the connection
    $conn->close();
} else {
    // Redirect to the index page if accessed directly
    header("Location: index.html");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Search Result</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <main>
    <h1>Search Result</h1>
    <div class="card">
      <?php if ($meaning): ?>
        <p><strong>Meaning:</strong> <?php echo htmlspecialchars($meaning); ?></p>
      <?php else: ?>
        <p>No meaning found for the word '<?php echo htmlspecialchars($_POST['word']); ?>'.</p>
      <?php endif; ?>
      <a href="index.html" class="back-link">← Back to Search</a>
    </div>
  </main>
</body>
</html>