<?php
  passthru ("./determine.pl " . $_POST['sessionid'] . " \"" .
      urldecode($_POST['decls']) . "\" \"" . $_POST['expr']
      . "\" \"" . urldecode($_POST['type']) . "\"" );
?>
