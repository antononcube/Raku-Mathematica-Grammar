#!/usr/bin/env perl6

use lib './lib';
use lib '.';

use Mathematica::Grammar;
use Mathematica::Grammar::FullForm;
use Mathematica::Actions::Raku::FullForm;
use Mathematica::Actions::Raku::FullFormLexerRules;

grammar ParseObj
        does Mathematica::Grammar::FullForm {
    rule TOP { <full-form-program>  }
};


sub parse-func(Str:D $program, Str:D :$rule = 'TOP', Bool :$interpret = False) {
    if !$interpret {
        ParseObj.subparse($program, :$rule)
    } else {
        ParseObj.subparse(
                $program,
                :$rule,
                actions => Mathematica::Actions::Raku::FullForm.new).made
    }
}

#say parse-func('ab232', :interpret);
#say parse-func('Plus[a, x]', rule => 'expr');
say parse-func('Plus[a, x]', :interpret);

#say "=" x 60;

#say parse-func('Integrate[Sin[Plus[x,4]],List[x,Set[x,5],U]]', rule => 'expr');