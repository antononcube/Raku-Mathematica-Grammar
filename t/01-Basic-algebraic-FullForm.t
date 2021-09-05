use Test;

use lib './lib';
use lib '.';

use Mathematica::Grammar;
use Mathematica::Grammar::FullForm;

grammar ParseObj
        does Mathematica::Grammar::FullForm {
    rule TOP { <full-form-program> }
};


sub parse-func(Str:D $program, Str:D :$rule = 'full-form-program') {
    ParseObj.subparse($program, :$rule)
}

##===========================================================

plan 5;

## 1
ok parse-func('45'), '45';

## 2
ok parse-func('Abc'), '45';

## 3
ok parse-func('Plus[4,Times[-3,x],Power[ x,2]]'), 'Plus[4,Times[-3,x],Power[x,2]]';

## 4
ok parse-func('Plus[\[Alpha], \[Beta]]'), 'Plus[\[Alpha], \[Beta]]';

## 5
ok parse-func('Integrate[Sin[Plus[x,4]],List[x,Set[x,5],U]]'), 'Integrate[Sin[Plus[x,4]],List[x,Set[x,5],U]]';

done-testing;
