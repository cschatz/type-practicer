<?php
  passthru ("./determine.pl \"" .
      urldecode($_POST['decls']) . "\" \"" . $_POST['expr']
      . "\" \"" . urldecode($_POST['type']) . "\"" );

?>
