#!/c/Perl/bin/perl -w

while (<>) 
{
  chomp;
  @str = split;

  print ("NET \"$str[1]\" LOC = $str[0] ;");
  print ("\n");

}


