#!/usr/bin/perl

$locals = `git branch -l`;

@lines = split(/\n/, $locals);

my %has = ();
foreach (@lines) {
  $_ =~ s/[ *]+//g;
  $_ = "my/" . $_;
  $has{$_} = 1;
}

$remotes = `git branch -r`;

@rlines = split(/\n/, $remotes);
foreach (@rlines) {
  $_ =~ s/ //g;
  if (/^my/) {
     $find = $_;
    if ($has{$_} != 1) {
      $_ =~ s|/| --delete |;
      print "git push $_\n";
      #print `git push --dry-run $_`
      print `git push $_`
    }
  }
}
