#!/usr/bin/env perl6

use lib './lib';
use lib '.';

use Mathematica::Grammar;
use Mathematica::Grammar::FullForm;

grammar ParseObj
        does Mathematica::Grammar::FullForm {
    rule TOP { <full-form-program> }
};


sub parse-func(Str:D $program, Str:D :$rule = 'TOP', Bool :$interpret = False) {
    if !$interpret {
        ParseObj.subparse($program, :$rule)
    } else {
        ParseObj.subparse(
                $program,
                :$rule,
                actions => Mathematica::Actions::FullForm.new).made
    }
}

say parse-func('Plus[a, x]', rule=>'expr');

say parse-func('Plus[a, x]', rule=>'expr');