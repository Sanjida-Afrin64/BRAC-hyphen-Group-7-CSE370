<?php
session_start();
require_once('connection.php');
$result = $connect->query("SELECT * FROM alumni");
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BRAC-hypen Alumni</title>
    <link rel="stylesheet" href="allstyles.css">
</head>
<body class="bhofal">
    <h1 class="bhalumni">BRAC&#8208;HYPHEN</h1>
    <a href="bhstudenthomepage.html"><span class="shp">Go back to Homepage</span></a>
    <div style="box-shadow: 0px 0px 20px rgba(11, 74, 209, 1); padding-top: 100px; padding-bottom: 40px; margin-bottom: 90px; margin-right: 6px; margin-left: 6px; background-color: white;">
        <?php if ($result->num_rows > 0): ?>
            <?php while ($row = $result->fetch_assoc()): 
                $subject = "Student Question.";
                $body = "Hello, Bhaiya/Apu/Sir/Ma'am.\nI have a question for you.";
                $mailto_link = "mailto:" . urlencode($row['email'])
                               . "?subject=" . urlencode($subject)
                               . "&body=" . urlencode($body);
            ?>
                <div class="al">
                    <img src="<?= $row['profile_pic'] ?>" class="pfp">
                    <h3 class="n"><?= $row['name'] ?></h3>
                    <p class="w">✨ <?= $row['position'] ?> ✨</p>
                    <p class="w"><?= $row['work'] ?></p>
                    <a href="<?= $mailto_link ?>" class="bhaskq">
                        Ask me questions.
                    </a>
                    <img src="<?= $row['portfolio_pic'] ?>" class="portfolio">
                </div>
            <?php endwhile; ?>
        <?php else: ?>
            <p>No alumni found.</p>
        <?php endif; ?>
      </div>
    </div>

    <script>
        document.querySelectorAll('.al').forEach(card => {
            card.addEventListener('click', function(e) {
                if (e.target.classList.contains('bhaskq')) return;
                
                const portfolio = card.querySelector('.portfolio');
                portfolio.classList.toggle('open');
            });
        });
    </script>
</body>
</html>
