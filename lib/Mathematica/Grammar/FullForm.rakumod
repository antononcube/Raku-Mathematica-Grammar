use v6;

use Mathematica::Grammar::FullFormLexerRules;

#|{ "import" : { "FullFormLexerRules" : null } }
role Mathematica::Grammar::FullForm
		does Mathematica::Grammar::FullFormLexerRules {

	token full-form-program {
		||	<expr>
			[	||	<NEWLINE>+
					<expr>?
			]*
	}
	# Original version
	#`(
	token expr {
		||	<numberLiteral>
		||	<StringLiteral>
		||	<symbol>
		||	<expr>
			<LBRACKET>
			<expressionList>
			<RBRACKET>
	} )
	token expr-head {
		||	<numberLiteral>
		||	<StringLiteral>
		||	<symbol>
	}
	regex expr {
		<expr-head> \h* [ <LBRACKET> \h* <expressionList> \h* <RBRACKET> ]+ || <expr-head>
	}
	regex expressionList {
		||	<expr>+ % [ \h* <COMMA> \h* ]
	}
	token symbol {
		||	<context>?
			<Name>
	}
	token context {
		||	<BACKQUOTE>?
			<Name>
			<BACKQUOTE>
		||	<Name>
			<BACKQUOTE>
			<Name>
			<BACKQUOTE>
	}
	token numberLiteral {
		||	<MINUS>?
			<DIGITS>
			<NumberInBase>
			<numberLiteralPrecision>?
			<numberLiteralExponent>?
		||	<MINUS>?
			(	||	<DIGITS>
				||	<DecimalNumber>
			)
			<numberLiteralPrecision>?
			<numberLiteralExponent>?
	}
	token numberLiteralPrecision {
		||	<DOUBLEBACKQUOTE>
			[	||	<DecimalNumber>
				||	<DIGITS>
			]
		||	<BACKQUOTE>
			[	||	<DecimalNumber>
				||	<DIGITS>
			]?
	}
	token numberLiteralExponent {
		||	[	||	<ASTERISKCARET>
					[	||	<PLUS>
						||	<MINUS>
					]?
					<DIGITS>
			]
	}
}
