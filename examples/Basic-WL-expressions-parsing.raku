#!/usr/bin/env perl6

use lib './lib';
use lib '.';

use Mathematica::Grammar;
use Mathematica::Grammar::FullForm;
use Mathematica::Actions::English::FullForm;
use Mathematica::Actions::Raku::FullForm;
use Mathematica::Actions::Raku::FullFormLexerRules;

grammar ParseObj
        does Mathematica::Grammar::FullForm {
    rule TOP { <full-form-program>  }
};


sub parse-func(Str:D $program,
               Str:D :$rule = 'TOP',
               Bool :$interpret = False,
               :$actions = Mathematica::Actions::Raku::FullForm.new ) {
    if !$interpret {
        ParseObj.subparse($program, :$rule)
    } else {
        ParseObj.subparse(
                $program,
                :$rule,
                :$actions).made
    }
}

#say parse-func('ab232', :interpret);
#say parse-func('343.34', rule => 'DecimalNumber');
#say parse-func('Plus[a, x, 124, 343.34]', rule => 'expr');
say parse-func('Plus[a, x, 124, 33.23]', :interpret, actions => Mathematica::Actions::English::FullForm.new );

#say "=" x 60;

#say parse-func('Integrate[Sin[Plus[x,4]],List[x,Set[x,5],U]]', rule => 'expr');