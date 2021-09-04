use v6;

#|{ "type" : "lexer" }
role Mathematica::Grammar::InputFormLexerRules {
	token BINARYPLUS {
		||	'binaryplus'
	}
	token BINARYMINUS {
		||	'binaryminus'
	}
	token BINARYMINUSPLUS {
		||	'binaryminusplus'
	}
	token BINARYPLUSMINUS {
		||	'binaryplusminus'
	}
	token SPANSEMICOLONS {
		||	'spansemicolons'
	}
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
		||	'Rho'
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
		||	'CapitalRho'
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
		||	<DIGITS>
			<DOT>
			<DIGIT>*
		||	<DIGIT>*
			<DOT>
			<DIGITS>
	}
	token NumberInBase {
		||	<DOUBLECARET>
			(	||	<DigitInAnyBase>+
					<DOT>?
					<DigitInAnyBase>*
				||	<DigitInAnyBase>*
					<DOT>?
					<DigitInAnyBase>+
			)
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
	token COMMENT {
		||	<LCOMMENT>
			.*?
			<RCOMMENT>
	}
	token LPAREN {
		||	'('
			#|{self.incrementBracketLevel(1);}
	}
	token RPAREN {
		||	')'
			#|{self.incrementBracketLevel(-1);}
	}
	token LBRACE {
		||	'{'
			#|{self.incrementBracketLevel(1);}
	}
	token RBRACE {
		||	'}'
			#|{self.incrementBracketLevel(-1);}
	}
	token LBRACKET {
		||	'['
			#|{self.incrementBracketLevel(1);}
	}
	token RBRACKET {
		||	'\]'
			#|{self.incrementBracketLevel(-1);}
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
	token LANGLE {
		||	'\x[2329]'
			#|{self.incrementBracketLevel(1);}
	}
	token RANGLE {
		||	'\x[232a]'
			#|{self.incrementBracketLevel(-1);}
	}
	token LFLOOR {
		||	'\x[230a]'
			#|{self.incrementBracketLevel(1);}
	}
	token RFLOOR {
		||	'\x[230b]'
			#|{self.incrementBracketLevel(-1);}
	}
	token LCEILING {
		||	'\x[2308]'
			#|{self.incrementBracketLevel(1);}
	}
	token RCEILING {
		||	'\x[2309]'
			#|{self.incrementBracketLevel(-1);}
	}
	token DOUBLEBAR {
		||	'||'
	}
	token BAR {
		||	'|'
	}
	token LBARBRACKET {
		||	'\x[301a]'
			#|{self.incrementBracketLevel(1);}
	}
	token RBARBRACKET {
		||	'\x[301b]'
			#|{self.incrementBracketLevel(-1);}
	}
	token LBRACKETINGBAR {
		||	'\x[f603]'
			#|{self.incrementBracketLevel(1);}
	}
	token RBRACKETINGBAR {
		||	'\x[f604]'
			#|{self.incrementBracketLevel(-1);}
	}
	token LDOUBLEBRACKETINGBAR {
		||	'\x[f605]'
			#|{self.incrementBracketLevel(1);}
	}
	token RDOUBLEBRACKETINGBAR {
		||	'\x[f606]'
			#|{self.incrementBracketLevel(-1);}
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
	token DOUBLELESS {
		||	'<<'
	}
	token TRIPPLEGREATER {
		||	'>>>'
	}
	token DOUBLEGREATER {
		||	'>>'
	}
	token TRIPPLEEQUAL {
		||	'==='
	}
	token EQUALBANGEQUAL {
		||	'=!='
	}
	token EqualSymbol {
		||	<LONGEQUAL>
		||	<DOUBLEEQUAL>
	}
	token LONGEQUAL {
		||	'\x[f7d9]'
	}
	token DOUBLEEQUAL {
		||	'=='
	}
	token EQUAL {
		||	'='
	}
	token NotEqualSymbol {
		||	<BANGEQUAL>
		||	<NOTEQUAL>
	}
	token BANGEQUAL {
		||	'!='
	}
	token NOTEQUAL {
		||	'\x[2260]'
	}
	token GreaterEqualSymbol {
		||	<RAWGREATEREQUAL>
		||	<GREATEREQUAL>
		||	<GREATERSLANTEQUAL>
	}
	token RAWGREATEREQUAL {
		||	'>='
	}
	token GREATEREQUAL {
		||	'\x[2265]'
	}
	token GREATERSLANTEQUAL {
		||	'\x[2a7e]'
	}
	token LessEqualSymbol {
		||	<RAWLESSEQUAL>
		||	<LESSEQUAL>
		||	<LESSSLANTEQUAL>
	}
	token RAWLESSEQUAL {
		||	'<='
	}
	token LESSEQUAL {
		||	'\x[2264]'
	}
	token LESSSLANTEQUAL {
		||	'\x[2a7d]'
	}
	token LESS {
		||	'<'
	}
	token GREATER {
		||	'>'
	}
	token VERTICALBAR {
		||	'\x[f3d0]'
	}
	token NOTVERTICALBAR {
		||	'\x[f3d1]'
	}
	token DOUBLEVERTICALBAR {
		||	'\x[2225]'
	}
	token NOTDOUBLEVERTICALBAR {
		||	'\x[2226]'
	}
	token ELEMENT {
		||	'\x[2208]'
	}
	token NOTELEMENT {
		||	'\x[2209]'
	}
	token SUBSET {
		||	'\x[2282]'
	}
	token SUPERSET {
		||	'\x[2283]'
	}
	token NOT {
		||	'\x[00ac]'
	}
	token DOUBLEAMP {
		||	'&&'
	}
	token AND {
		||	'\x[2227]'
	}
	token NAND {
		||	'\x[22bc]'
	}
	token XOR {
		||	'\x[22bb]'
	}
	token XNOR {
		||	'\x[f4a2]'
	}
	token OR {
		||	'\x[2228]'
	}
	token NOR {
		||	'\x[22bd]'
	}
	token LRDOUBLEARROW {
		||	'\x[29e6]'
	}
	token RDOUBLEARROW {
		||	'\x[f523]'
	}
	token LCONTAINS {
		||	'\x[2970]'
	}
	token RIGHTTEE {
		||	'\x[22a2]'
	}
	token DOUBLERIGHTTEE {
		||	'\x[22a8]'
	}
	token LEFTTEE {
		||	'\x[22a3]'
	}
	token DOUBLELEFTTEE {
		||	'\x[2ae4]'
	}
	token UPTEE {
		||	'\x[22a5]'
	}
	token DOWNTEE {
		||	'\x[22a4]'
	}
	token SUCHTHAT {
		||	'\x[220d]'
	}
	token THEREFORE {
		||	'\x[2234]'
	}
	token BECAUSE {
		||	'\x[2235]'
	}
	token TRIPPLEDOT {
		||	'...'
	}
	token DOUBLEDOT {
		||	'..'
	}
	token QUESTIONMARK {
		||	'?'
	}
	token TRIPPLEBLANK {
		||	'___'
	}
	token DOUBLEBLANK {
		||	'__'
	}
	token BLANKDOT {
		||	'_.'
	}
	token BLANK {
		||	'_'
	}
	token PERCENTDIGITS {
		||	<PERCENT>
			<DIGITS>
	}
	token PERCENTS {
		||	<PERCENT>+
	}
	token PERCENT {
		||	'%'
	}
	token DOUBLECOLON {
		||	'::'
	}
	token RAWCOLON {
		||	':'
	}
	token DOUBLETILDE {
		||	'~~'
	}
	token SLASHSEMI {
		||	'/;'
	}
	token MINUSGREATER {
		||	'->'
	}
	token RARROW {
		||	'\x[f522]'
	}
	token COLONGREATER {
		||	':>'
	}
	token COLONARROW {
		||	'\x[f51f]'
	}
	token SLASHDOT {
		||	'/.'
	}
	token DOUBLESLASHDOT {
		||	'//.'
	}
	token HASHDIGITS {
		||	<HASH>
			<DIGITS>
	}
	token HASHStringLiteral {
		||	<HASH>
			<StringLiteral>
	}
	token DOUBLEHASHDIGITS {
		||	<DOUBLEHASH>
			<DIGITS>
	}
	token DOUBLEHASH {
		||	'##'
	}
	token HASH {
		||	'#'
	}
	token PLUSEQUAL {
		||	'+='
	}
	token MINUSEQUAL {
		||	'-='
	}
	token ASTERISKEQUAL {
		||	'*='
	}
	token SLASHEQUAL {
		||	'/='
	}
	token AMP {
		||	'&'
	}
	token CARETCOLONEQUAL {
		||	'^:='
	}
	token COLONEQUAL {
		||	':='
	}
	token CARETEQUAL {
		||	'^='
	}
	token SLASHCOLON {
		||	'/:'
	}
	token FUNCTIONARROW {
		||	'\x[f4a1]'
	}
	token DOT {
		||	'.'
	}
	token DOUBLECARET {
		||	'^^'
	}
	token CARET {
		||	'^'
	}
	token ASTERISKCARET {
		||	'*^'
	}
	token DOUBLEPLUS {
		||	'++'
	}
	token DOUBLEMINUS {
		||	'--'
	}
	token TRIPPLEAT {
		||	'@@@'
	}
	token DOUBLEAT {
		||	'@@'
	}
	token ATASTERISK {
		||	'@*'
	}
	token AT {
		||	'@'
	}
	token MAP {
		||	'/@'
	}
	token SLASHASTERISK {
		||	'/*'
	}
	token MAPALL {
		||	'//@'
	}
	token DOUBLEBANG {
		||	'!!'
	}
	token BANG {
		||	'!'
	}
	token LESSGREATER {
		||	'<>'
	}
	token INTEGRAL {
		||	'\x[222b]'
	}
	token DIFFERENTIALD {
		||	'\x[f74C]'
	}
	token CROSS {
		||	'\x[f4a0]'
	}
	token RAWBACKSLASH {
		||	'\\'
	}
	token INTERSECTION {
		||	'\x[22c2]'
	}
	token UNION {
		||	'\x[22c3]'
	}
	token DOUBLESEMICOLON {
		||	';;'
			#|{self.checkDoubleSemicolon();}
	}
	token SEMICOLON {
		||	';'
	}
	token TRANSPOSE {
		||	'\x[f3c7]'
	}
	token CONJUGATETRANSPOSE {
		||	'\x[f3c9]'
	}
	token HERMITIANCONJUGATE {
		||	'\x[f3ce]'
	}
	token CONJUGATE {
		||	'\x[f3c8]'
	}
	token TILDE {
		||	'~'
	}
	token DEL {
		||	'\x[2207]'
	}
	token SQUARE {
		||	'\x[f520]'
	}
	token SMALLCIRCLE {
		||	'\x[2218]'
	}
	token CIRCLEDOT {
		||	'\x[2299]'
	}
	token DOUBLEASTERISK {
		||	'**'
	}
	token BACKSLASH {
		||	'\x[2216]'
	}
	token DIAMOND {
		||	'\x[22c4]'
	}
	token WEDGE {
		||	'\x[22c0]'
	}
	token VEE {
		||	'\x[22c1]'
	}
	token CIRCLETIMES {
		||	'\x[2297]'
	}
	token CENTERDOT {
		||	'\x[00b7]'
	}
	token STAR {
		||	'\x[22c6]'
	}
	token VERTICALTILDE {
		||	'\x[2240]'
	}
	token COPRODUCT {
		||	'\x[2210]'
	}
	token CAP {
		||	'\x[2322]'
	}
	token CUP {
		||	'\x[2323]'
	}
	token CIRCLEPLUS {
		||	'\x[2295]'
	}
	token CIRCLEMINUS {
		||	'\x[2296]'
	}
	token COLON {
		||	'\x[2236]'
	}
	token DOUBLESLASH {
		||	'//'
	}
	token VERTICALSEPARATOR {
		||	'\x[f432]'
	}
	token PLUS {
		||	'+'
			#|{ self.checkAdditiveOp(InputFormParser.BINARYPLUS); }
	}
	token MINUS {
		||	'-'
			#|{ self.checkAdditiveOp(InputFormParser.BINARYMINUS); }
	}
	token PLUSMINUS {
		||	'\x[00b1]'
			#|{ self.checkAdditiveOp(InputFormParser.BINARYPLUSMINUS); }
	}
	token MINUSPLUS {
		||	'\x[2213]'
			#|{ self.checkAdditiveOp(InputFormParser.BINARYMINUSPLUS); }
	}
	token FormBox {
		||	'\\`'
	}
	token InterpretedBox {
		||	'\\!'
	}
	token BoxFraction {
		||	'\\/'
	}
	token BoxLeftBoxParenthesis {
		||	'\\('
	}
	token BoxOtherscript {
		||	'\\%'
	}
	token BoxOverscript {
		||	'\\&'
	}
	token BoxRightBoxParenthesis {
		||	'\\)'
	}
	token BoxSqrt {
		||	'\\@'
	}
	token BoxSubscript {
		||	'\\_'
	}
	token BoxSuperscript {
		||	'\\^'
	}
	token BoxUnderscript {
		||	'\\+'
	}
	token BoxConstructor {
		||	'\\*'
	}
	token SLASH {
		||	'/'
	}
	token DIVIDE {
		||	'\x[00f7]'
	}
	token MultiplicationSymbol {
		||	<ASTERISK>
		||	<TIMES>
	}
	token ASTERISK {
		||	'*'
	}
	token TIMES {
		||	'\x[00d7]'
	}
	token NEWLINE {
		||	'\n'
			#|{ self.checkNewline();}
	}
	token CONTINUATION {
		||	'\x[f3b1]'
	}
	token WHITESPACE {
		||	(	||	<[ \t \r ]>
				||	<SpaceCharacter>
			)
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
