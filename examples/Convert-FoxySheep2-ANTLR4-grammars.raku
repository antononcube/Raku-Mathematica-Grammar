#!/usr/bin/env perl6

use ANTLR4::Grammar;

sub MAIN(Str:D :$dirName = '', Str:D :$outputDirName = '', Bool :$export = False) {

    my $dirNameLocal = $dirName.chars == 0 ?? $*HOME.Str ~ '/' ~ 'GitHub/rocky/FoxySheep2/grammar' !! $dirName;
    my $outputDirNameLocal = $outputDirName.chars == 0 ?? $*CWD !! $outputDirName;

    for <FullForm FullFormLexerRules InputForm InputFormLexerRules> -> $fileName {
        my $fullFileName = $dirNameLocal ~ '/' ~ $fileName ~ '.g4';

        if $export {
            spurt($outputDirNameLocal ~ '/' ~ $fileName ~ '.raku', ANTLR4::Grammar.file-to-string($fullFileName))
        } else {
            say ANTLR4::Grammar.file-to-string($fullFileName);
        }
    }

}