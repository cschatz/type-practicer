#!/usr/bin/perl

($declarations, $expr, $guess) = @ARGV;

$declarations =~ s/string/STRINGTYPE/;

$timestamp = time();

$DEF = <<END;
class STRINGTYPE
{
  public:
    char operator[](int i){}
    int length(){}
    STRINGTYPE substr(int a, int b){}
};
END

$declarations = "$DEF\n$declarations;\n";

$source = ".files/src_$timestamp.cpp";
$executable = ".files/exec_$timestamp";
$errfile = ".files/err_$timestamp";

system ("cat TEMPLATE > $source");
open (OUT, ">> $source");
print OUT $declarations;
print OUT "\nint main()\n\{\nEMIT($expr)\n}\n";
close (OUT);

system ("g++ -o $executable $source 2> $errfile");

@errors = split (/\n/, (`cat $errfile`));

while ($errors[0] =~ /In function/)
{
    shift @errors;
}

if (@errors > 0)
{
    my $err = $errors[0];
    $err =~ s/.+error: //;
    $err =~ s/in this scope//;
    $err =~ s/(was not declared)|(does not name a type)/doesn't match anything the compiler knows about already. Maybe it's a typo?/;
    print "Your expression is NOT LEGAL.<br />$err";
    exit;
}

$output = `$executable | c++filt -t`;
$output =~ s/std::(\w+)/\1/g;
$output = strip_alloc($output);
$output =~ s/, _alloc_ //g;
$output =~ s/, std::allocator<[^<>]>//g; 
$output =~ s/(.+)\*$/pointer to \1/g;
while ($output =~ s/vector<(.+)>/vector of \1/) { }
while ($output =~ s/(.+)\s+\[\d+\]$/array of \1/) { }
$output =~ s/([^ ]+)\*/pointer to \1/g; 
$output =~ s/STRINGTYPE/string/g;
$output =~ s/unsigned int/int/g;

$output2 = $output;
if ($output2 =~ /^(vector)|(array) of/) { $output2 .= "s"; }

if ($output eq $guess)
{ 
    print "CORRECT! "; 
    print "<span class='code'>$expr</span> is a <b>$guess</b>";
}
elsif ($output2 eq $guess)
{ 
    print "CORRECT! "; 
    print "<span class='code'>$expr</span> is a <b>$guess</b>";
}
else { print "** No, <span class='code'>$expr</span> is not a <b>$guess</b>"; }

sub strip_alloc
{
    my ($text) = @_;
    while ((my $index = index ($text, "allocator<")) > -1)
    {
	my $start = $index;
	my $end = $start + 10;
	my $count = 1;
	while ($count != 0)
	{
	    if (substr($text, $end, 1) eq "<") { $count++; }
	    elsif (substr($text, $end, 1) eq ">") { $count--; }
	    $end++;
	}
	substr($text, $start, ($end-$start)) = "_alloc_";
    }
    return ($text);
}

