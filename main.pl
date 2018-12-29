#!/usr/bin/perl

$check_git = "git rev-parse --is-inside-work-tree";
$isgit = `$check_git`;

if("true" =~ $isgit){
  exit 1;
}

$remote_verbose = "git remote -v";
$remote_urls = `$remote_verbose`;
@remote = split("\n", $remote_urls);
$remote_size = scalar(@remote);

for($i = 0; $i < $remote_size; $i++){
  @snippets = split(/(\s+)/, $remote[$i]);

  if("origin" eq $snippets[0] && "(fetch)" =~ $snippets[4]){
    $url = $snippets[2];
  }
}

$get_branch = "git branch | grep \\* | cut -d ' ' -f2";
$branch = `$get_branch`;

chomp $branch;
chomp $url;

$url = $url =~ s/.git$//r;

$get_commits_feed = "curl -s $url/commits/$branch.atom";
$commits_feed = `$get_commits_feed`;

@tags = $commits_feed =~ /<title>(.*?)<\/title>/gs;
s{^\s+|\s+$}{}g foreach @tags;

for($i = 0; $i < scalar(@tags); $i++){
  print "@tags[$i]\n";
}
