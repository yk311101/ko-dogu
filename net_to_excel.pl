#!/c/Perl/bin/perl -w


if (@ARGV != 2) {
  print("usage : [input file] [target part number]");
  exit;
}


open (IN,"$ARGV[0]") || die "file open error";
open (OUT,">tmp") || die "cannot create file, \"tmp\"";

$partno = $ARGV[1];

while (<IN>) {

  if(m/\$NETS/) { last; }

}

while (<IN>) {

  chomp;
  @str = split;

  if($str[0] =~ m/.*;/) {
    print OUT "\n";
  }

  s/,/ /;
  print OUT "$_ ";

}

close IN;
close OUT;

open (IN,"tmp") || die "file open error";

while(<IN>) {

  if($_ =~ m/\b${partno}\b\.([^ ]*) /) {
    $pin = $1;
    m/([^ ;]*);/;
    $net = $1;
    $net =~ s/([0-9]+)$/<$1>/;

    print "$pin $net\n";
  }

}






