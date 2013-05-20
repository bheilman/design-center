#!/usr/bin/perl

use warnings;
use strict;

use lib "../../libraries/dclib";
use dctest;

my $testdir = '/tmp/blah';

my $todo = {
    "keep file a" => qr|___001_Utilities_delete_unlisted_files_entry: kept file $testdir/a.txt|,
    "keep symlink b" => qr|___001_Utilities_delete_unlisted_files_entry: kept file $testdir/b.txt|,
    "delete file c" => qr|___001_Utilities_delete_unlisted_files_entry: deleted file $testdir/c.txt|,
    "delete symlink d" => qr|___001_Utilities_delete_unlisted_files_entry: deleted file $testdir/d.txt|,
};

use File::Path;
File::Path::remove_tree($testdir);
File::Path::make_path($testdir);
open FILE, ">/tmp/blah/a.txt"; close FILE;
symlink "$testdir/a.txt", "$testdir/b.txt";
open FILE, ">$testdir/c.txt"; close FILE;
symlink "$testdir/a.txt", "$testdir/d.txt";

my $output = dctest::setup('./test.cf', $todo);

File::Path::remove_tree($testdir);

dctest::matchall($output, $todo);
