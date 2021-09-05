
use v6;

class Mathematica::Actions::Raku::FullFormLexerRules {

    method Name($/) {
        make $<LetterForm>>>.made.join() ~ ( $<LetterFormOrDigit> ?? $<LetterFormOrDigit>>>.made.join !! '');
    }

    method LetterFormOrDigit($/) { make $/.values[0].made; }
    method LetterForm($/) { make $/.values[0].made; }
    method Letter($/) { make $/.Str; }
    method Letterlike($/) { make $/.Str }
    method LetterName($/) { make $<LetterInner>.made }
    method LetterInner($/) { make $/.values[0].made; }
    
    method GreekLetterInner($/) { make $/.values[0].made; }
    method LowerCaseGreekInner($/) { make $/.Str }
    method UpperCaseGreekInner($/) { make $/.Str }
    method VariantGreekInner($/) { make $/.Str }
    method ArchaicGreekInner($/) { make $/.Str }

    method VariantLetterInner($/) { make $/.values[0].made; }
    method LanguageNotationInner($/) { make $/.Str }
    method DoubledLetterInner($/) { make $/.Str }
    method SpecialLetterBasedInner($/) { make $/.Str }
    method DotlessLetterInner($/) { make $/.Str }

    method DecimalNumber($/) { make $/.Str }
    method NumberInBase($/) { make $/.Str }
    method DIGITS($/) { make $/.Str }
    method DIGIT($/) { make $/.Str }

    method StringLiteral($/) { make $<StringCharacters> ?? $/.Str !! '' }
    method StringCharacters($/) { make $/.Str }
    method StringCharacter($/) { make $/.Str }
    method HexDigit($/) { make $/.Str }

    method PLUS($/) { make $/.Str }
    method MINUS($/) { make $/.Str }
    method COMMENT($/) {
        make $<LCOMMENT>.made ~ $/.Str ~ $<RCOMMENT>.made
    }
    method LBRACKET($/) { make '(' }
    method RBRACKET($/) { make ')' }
    method COMMA($/) { make ',' }
    method LCOMMENT($/)	{ make '#`(' }
    method RCOMMENT($/)  { ')' }
    method DOUBLEBACKQUOTE($/) { make '``' }
    method BACKQUOTE($/) { make '`' }
    method SINGLEQUOTE($/) { make '\'' }
    method QUOTE($/) { make '"' }
    method RAWCOLON($/) { make ':' }
    method RAWBACKSLASH($/) { make '\\' }
    method DOUBLECARET($/) { make '^^' }
    method ASTERISKCARET($/) { make '*^' }
    method DOT($/) { make '.' }
    method NEWLINE($/) { make '\n' }
    method CONTINUATION($/) { make '\x[f3b1]' }
    method WHITESPACE($/) { make ' ' }
    method SpaceCharacter($/) { make ' ' }
}
