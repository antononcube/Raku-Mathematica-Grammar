
use Mathematica::Grammar::FullForm;
use Mathematica::Grammar::InputForm;

grammar Mathematica::Grammar
        does Mathematica::Grammar::FullForm {

#    rule TOP {
#        <full-form-program>    | <input-form-program>
#    }

    rule TOP {
        <full-form-program>
    }
}