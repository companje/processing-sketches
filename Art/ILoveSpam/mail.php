<?php

$lines = <<<END
███████████████████████████████████████████████████████████████████████████
███████████████████████████████████████████████████████████████████████████
███████████████░░░░░░░░░░░░█████████████████████░░░░░░░░░░░░███████████████
█████████░░░░░░░░░░░░░░░░░░░░░░░░█████████░░░░░░░░░░░░░░░░░░░░░░░░█████████
██████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██████
██████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██████
██████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██████
███░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███
███░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███
███░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███
██████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██████
██████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██████
██████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██████
█████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█████████
████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░████████████
████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░████████████
██████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██████████████████
█████████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█████████████████████
████████████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░████████████████████████
███████████████████████████░░░░░░░░░░░░░░░░░░░░░███████████████████████████
██████████████████████████████░░░░░░░░░░░░░░░██████████████████████████████
█████████████████████████████████░░░░░░░░░█████████████████████████████████
████████████████████████████████████░░░████████████████████████████████████
███████████████████████████████████████████████████████████████████████████
███████████████████████████████████████████████████████████████████████████
END;

$to = '"The Receiver" <test@example.com>';
$from = 'From: "You" <you@yourdomain.com>';
$msg = '';
$lines = explode("\n",$lines);
$lines = array_reverse($lines);

foreach ($lines as $line) {
  print($line."\n");
  mail($to, $line, $msg, $from."\r\n");
  sleep(10);
}

?>