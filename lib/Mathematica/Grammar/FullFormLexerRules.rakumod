use v6;

#|{ "type" : "lexer" }
role Mathematica::Grammar::FullFormLexerRules {
	token Name {
		||	<LetterForm>+
			<LetterFormOrDigit>*
	}
	token LetterFormOrDigit {
		||	<LetterForm>
		||	<DIGIT>
	}
	token LetterForm {
		||	<Letter>
		||	<Letterlike>
		||	<LetterName>
	}
	token Letter {
		||	<[ a .. z ]>
		||	<[ A .. Z ]>
	}
	token Letterlike {
		||	<[ \x[0024] \x[00a1] \x[00a2] \x[00a3] \x[00a5] \x[00a7] \x[00a9] \x[00ab] \x[00ae] \x[00b0] \x[00b5] \x[00b6] \x[00b8] \x[00bb] \x[00bf] \x[02c7] \x[02d8] \x[2013] \x[2014] \x[2020] \x[2021] \x[2022] \x[2026] \x[2032] \x[2033] \x[2035] \x[2036] \x[2060] \x[20ac] \x[210f] \x[2122] \x[2127] \x[212b] \x[21b5] \x[2205] \x[221e] \x[221f] \x[2220] \x[2221] \x[2222] \x[22ee] \x[22ef] \x[22f0] \x[22f1] \x[2300] \x[2318] \x[231a] \x[23b4] \x[23b5] \x[2500] \x[2502] \x[25a0] \x[25a1] \x[25aa] \x[25ae] \x[25af] \x[25b2] \x[25b3] \x[25bc] \x[25bd] \x[25c0] \x[25c6] \x[25c7] \x[25cb] \x[25cf] \x[25e6] \x[25fb] \x[25fc] \x[2605] \x[2639] \x[263a] \x[2660] \x[2661] \x[2662] \x[2663] \x[266d] \x[266e] \x[266f] \x[2736] \x[f3a0] \x[f3b8] \x[f3b9] \x[f527] \x[f528] \x[f720] \x[f721] \x[f722] \x[f723] \x[f725] \x[f749] \x[f74a] \x[f74d] \x[f74e] \x[f74f] \x[f750] \x[f751] \x[f752] \x[f753] \x[f754] \x[f755] \x[f756] \x[f757] \x[f760] \x[f763] \x[f766] \x[f768] \x[f769] \x[f76a] \x[f76b] \x[f76c] \x[f7d4] \x[f800] \x[f801] \x[f802] \x[f803] \x[f804] \x[f805] \x[f806] \x[f807] \x[f808] \x[f809] \x[f80a] \x[f80b] \x[f80c] \x[f80d] \x[f80e] \x[f80f] \x[f810] \x[f811] \x[f812] \x[f813] \x[f814] \x[f815] \x[f816] \x[f817] \x[f818] \x[f819] \x[f81a] \x[f81b] \x[f81c] \x[f81d] \x[f81e] \x[f81f] \x[f820] \x[f821] \x[f822] \x[f823] \x[f824] \x[f825] \x[f826] \x[f827] \x[f828] \x[f829] \x[f82a] \x[f82b] \x[f82c] \x[f82d] \x[f82e] \x[f82f] \x[f830] \x[f831] \x[f832] \x[f833] \x[fe35] \x[fe36] \x[fe37] \x[fe38] ]>
	}
	token LetterName {
		||	<RAWBACKSLASH>
			<LBRACKET>
			<LetterInner>
			<RBRACKET>
	}
	token LetterInner {
		||	<GreekLetterInner>
		||	<VariantLetterInner>
	}
	token GreekLetterInner {
		||	<LowerCaseGreekInner>
		||	<UpperCaseGreekInner>
		||	<VariantGreekInner>
		||	<ArchaicGreekInner>
	}
	token LowerCaseGreekInner {
		||	'Alpha'
		||	'Beta'
		||	'Gamma'
		||	'Delta'
		||	'Epsilon'
		||	'Zeta'
		||	'Eta'
		||	'Theta'
		||	'Iota'
		||	'Lambda'
		||	'Kappa'
		||	'Mu'
		||	'Nu'
		||	'Xi'
		||	'Omicron'
		||	'Pi'
		||	'Sigma'
		||	'Tau'
		||	'Upsilon'
		||	'Phi'
		||	'Chi'
		||	'Psi'
		||	'Omega'
	}
	token UpperCaseGreekInner {
		||	'CapitalAlpha'
		||	'CapitalBeta'
		||	'CapitalGamma'
		||	'CapitalDelta'
		||	'CapitalEpsilon'
		||	'CapitalZeta'
		||	'CapitalEta'
		||	'CapitalTheta'
		||	'CapitalIota'
		||	'CapitalLambda'
		||	'CapitalKappa'
		||	'CapitalMu'
		||	'CapitalNu'
		||	'CapitalXi'
		||	'CapitalOmicron'
		||	'CapitalPi'
		||	'CapitalSigma'
		||	'CapitalTau'
		||	'CapitalUpsilon'
		||	'CapitalPhi'
		||	'CapitalChi'
		||	'CapitalPsi'
		||	'CapitalOmega'
	}
	token VariantGreekInner {
		||	'CurlyEpsilon'
		||	'CurlyTheta'
		||	'CurlyKappa'
		||	'CurlyPi'
		||	'CurlyRho'
		||	'FinalSigma'
		||	'CurlyPhi'
		||	'CurlyCapitalUpsilon'
	}
	token ArchaicGreekInner {
		||	'Digamma'
		||	'Koppa'
		||	'Stigma'
		||	'CapitalDigamma'
		||	'CapitalKoppa'
		||	'CapitalStigma'
		||	'CapitalSampi'
	}
	token VariantLetterInner {
		||	<LanguageNotationInner>
		||	<DoubledLetterInner>
		||	<SpecialLetterBasedInner>
		||	<DotlessLetterInner>
	}
	token LanguageNotationInner {
		||	'ImaginaryI'
		||	'ConstantC'
		||	'DifferentialD'
		||	'ExponentialE'
		||	'ImaginaryJ'
	}
	token DoubledLetterInner {
		||	'DoubledGamma'
		||	'DoubledPi'
	}
	token SpecialLetterBasedInner {
		||	'Micro'
		||	'Anstrom'
		||	'HBar'
		||	'WeierstrassP'
	}
	token DotlessLetterInner {
		||	'DotlessI'
		||	'DotlessJ'
		||	'ScriptDotlessI'
		||	'ScriptDotlessJ'
	}
	token DecimalNumber {
		|	<DIGITS>
			<DOT>
			<DIGIT>*
		|	<DIGIT>*
			<DOT>
			<DIGITS>
	}
	token NumberInBase {
		||	<DOUBLECARET>
			[	||	<DigitInAnyBase>+
					<DOT>?
					<DigitInAnyBase>*
				||	<DigitInAnyBase>*
					<DOT>?
					<DigitInAnyBase>+
			]
	}
	token DIGITS {
		||	<DIGIT>+
	}
	token DIGIT {
		||	<[ 0 .. 9 ]>
	}
	token DigitInAnyBase {
		||	<DIGIT>
		||	<[ a .. z ]>
	}
	token StringLiteral {
		||	<QUOTE>
			<StringCharacters>?
			<QUOTE>
	}
	token StringCharacters {
		||	<StringCharacter>+
	}
	token StringCharacter {
		||	<-[ " \\ ]>
		||	<EscapeSequence>
	}
	token EscapeSequence {
		||	<RAWBACKSLASH>
			<[ b t n f r " \' \\ ]>
		||	<UnicodeEscape>
	}
	token UnicodeEscape {
		||	<RAWBACKSLASH>
			<RAWCOLON>
			<HexDigit>
			<HexDigit>
			<HexDigit>
			<HexDigit>
	}
	token HexDigit {
		||	<[ 0 .. 9 ]>
	}
	token PLUS {
		||	'+'
	}
	token MINUS {
		||	'-'
	}
	token COMMENT {
		||	<LCOMMENT>
			.*?
			<RCOMMENT>
	}
	token LBRACKET {
		||	'['
	}
	token RBRACKET {
		||	']'
	}
	token COMMA {
		||	','
	}
	token LCOMMENT {
		||	'(*'
	}
	token RCOMMENT {
		||	'*)'
	}
	token DOUBLEBACKQUOTE {
		||	'``'
	}
	token BACKQUOTE {
		||	'`'
	}
	token SINGLEQUOTE {
		||	'\''
	}
	token QUOTE {
		||	'"'
	}
	token RAWCOLON {
		||	':'
	}
	token RAWBACKSLASH {
		||	'\\'
	}
	token DOUBLECARET {
		||	'^^'
	}
	token ASTERISKCARET {
		||	'*^'
	}
	token DOT {
		||	'.'
	}
	token NEWLINE {
		||	'\n'
	}
	token CONTINUATION {
		||	'\x[f3b1]'
	}
	token WHITESPACE {
		||	[	||	<[ \t \r ]>
				||	<SpaceCharacter>
			]
	}
	token SpaceCharacter {
		||	' '
		||	'\x[2009]'
		||	'\x[200a]'
		||	'\x[205f]'
		||	'\x[2005]'
		||	'\x[f380]'
		||	<[ \x[f382] .. \x[f384] ]>
		||	'\x[2423]'
	}
}
