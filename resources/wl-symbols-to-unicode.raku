#!/usr/bin/env raku
use v6.d;

use Text::CSV;
use Data::Reshapers;

# Automatically generated from wl-symbols-to-unicode.raku

my @dsWLSymbols = csv(in => $*CWD ~ "/resources/UnicodeLongNames.csv", headers => 'auto');

say deduce-type(@dsWLSymbols);

say to-pretty-table(@dsWLSymbols.head(6));


my %hash;
for @dsWLSymbols -> $r {
    my $uni = '\\u' ~ $r<CodePoint>.substr(2, *);
    %hash{$r<LongName>} = $uni;
}

spurt($*CWD ~ "/resources/WLToUnicode.raku", %hash.raku);