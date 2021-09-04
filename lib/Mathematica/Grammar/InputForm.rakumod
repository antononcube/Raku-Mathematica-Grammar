use v6;

use Mathematica::Grammar::InputFormLexerRules;

#|{ "import" : { "InputFormLexerRules" : null } }
role Mathematica::Grammar::InputForm
		does Mathematica::Grammar::InputFormLexerRules {

	token input-form-program {
		||	<expr>
			(	||	<NEWLINE>+
					<expr>?
			)*
		||	<expressionList>
	}
	token expr {
		||	<numberLiteral>
		||	<StringLiteral>
		||	<LPAREN>
			<expr>
			<RPAREN>
		||	<LBRACE>
			<expressionList>
			<RBRACE>
		||	<LANGLE>
			<expressionList>
			<RANGLE>
		||	<LFLOOR>
			<expr>
			<RFLOOR>
		||	<LCEILING>
			<expr>
			<RCEILING>
		||	<LBRACKETINGBAR>
			<expressionList>
			<RBRACKETINGBAR>
		||	<LDOUBLEBRACKETINGBAR>
			<expressionList>
			<RDOUBLEBRACKETINGBAR>
		||	<expr>
			<DOUBLECOLON>
			<StringLiteral>
			(	||	<DOUBLECOLON>
					<StringLiteral>
			)?
		||	<slotExpression>
		||	<outExpression>
		||	<symbol>?
			(	||	<TRIPPLEBLANK>
				||	<DOUBLEBLANK>
				||	<BLANK>
			)
			<expr>?
		||	<symbol>?
			<BLANKDOT>
		||	<symbol>
		||	<DOUBLELESS>
			<StringLiteral>
		||	<expr>
			<QUESTIONMARK>
			<expr>
		||	<expr>
			<LBRACKET>
			<expressionList>
			<RBRACKET>
		||	<expr>
			<accessExpression>
		||	<BoxConstructor>
			<expr>
		||	<expr>
			(	||	<DOUBLEPLUS>
				||	<DOUBLEMINUS>
			)
		||	(	||	<DOUBLEPLUS>
				||	<DOUBLEMINUS>
			)
			<expr>
		||	<expr>
			<ATASTERISK>
			<expr>
		||	<expr>
			<SLASHASTERISK>
			<expr>
		||	<expr>
			<AT>
			<expr>
		||	<expr>
			<TILDE>
			<expr>
			<TILDE>
			<expr>
		||	<expr>
			(	||	<MAP>
				||	<MAPALL>
				||	<DOUBLEAT>
				||	<TRIPPLEAT>
			)
			<expr>
		||	<expr>
			(	||	<BANG>
				||	<DOUBLEBANG>
			)
		||	<expr>
			(	||	<CONJUGATE>
				||	<TRANSPOSE>
				||	<CONJUGATETRANSPOSE>
				||	<HERMITIANCONJUGATE>
			)
		||	<expr>
			<SINGLEQUOTE>+
		||	<expr>
			<LESSGREATER>
			<expr>
		||	<expr>
			<CARET>
			<expr>
		||	<INTEGRAL>
			<expr>
			<DIFFERENTIALD>
			<expr>
		||	<DEL>
			<expr>
		||	<SQUARE>
			<expr>
		||	<expr>
			<SMALLCIRCLE>
			<expr>
		||	<expr>
			<CIRCLEDOT>
			<expr>
		||	<expr>
			<DOUBLEASTERISK>
			<expr>
		||	<expr>
			<CROSS>
			<expr>
		||	<expr>
			<DOT>
			<expr>
		||	(	||	<MINUS>
				||	<PLUS>
				||	<PLUSMINUS>
				||	<MINUSPLUS>
			)
			<expr>
		||	<expr>
			(	||	<SLASH>
				||	<DIVIDE>
			)
			<expr>
		||	<expr>
			<RAWBACKSLASH>
			<expr>
		||	<expr>
			<DIAMOND>
			<expr>
		||	<expr>
			<WEDGE>
			<expr>
		||	<expr>
			<VEE>
			<expr>
		||	<expr>
			<CIRCLETIMES>
			<expr>
		||	<expr>
			<CENTERDOT>
			<expr>
		||	<expr>
			<MultiplicationSymbol>?
			<expr>
		||	<expr>
			<STAR>
			<expr>
		||	<expr>
			<VERTICALTILDE>
			<expr>
		||	<expr>
			<COPRODUCT>
			<expr>
		||	<expr>
			<CAP>
			<expr>
		||	<expr>
			<CUP>
			<expr>
		||	<expr>
			<CIRCLEPLUS>
			<expr>
		||	<expr>
			<CIRCLEMINUS>
			<expr>
		||	<expr>
			(	||	<BINARYPLUS>
				||	<BINARYMINUS>
				||	<BINARYPLUSMINUS>
				||	<BINARYMINUSPLUS>
			)
			<expr>
		||	<expr>
			<INTERSECTION>
			<expr>
		||	<expr>
			<UNION>
			<expr>
		||	<expr>
			<DOUBLESEMICOLON>
			<expr>?
		||	<SPANSEMICOLONS>
			<expr>?
			(	||	<DOUBLESEMICOLON>
					<expr>?
			)*
		||	<expr>
			(	||	<EqualSymbol>
				||	<NotEqualSymbol>
				||	<GreaterEqualSymbol>
				||	<LessEqualSymbol>
				||	<GREATER>
				||	<LESS>
			)
			<expr>
		||	<expr>
			(	||	<VERTICALBAR>
				||	<NOTVERTICALBAR>
				||	<DOUBLEVERTICALBAR>
				||	<NOTDOUBLEVERTICALBAR>
			)
			<expr>
		||	<expr>
			(	||	<TRIPPLEEQUAL>
				||	<EQUALBANGEQUAL>
			)
			<expr>
		||	<expr>
			(	||	<ELEMENT>
				||	<NOTELEMENT>
				||	<SUBSET>
				||	<SUPERSET>
			)
			<expr>
		||	(	||	<BANG>
				||	<NOT>
			)
			<expr>
		||	<expr>
			(	||	<DOUBLEAMP>
				||	<AND>
				||	<NAND>
			)
			<expr>
		||	<expr>
			(	||	<XOR>
				||	<XNOR>
			)
			<expr>
		||	<expr>
			(	||	<OR>
				||	<NOR>
				||	<DOUBLEBAR>
			)
			<expr>
		||	<expr>
			<LRDOUBLEARROW>
			<expr>
		||	<expr>
			(	||	<RDOUBLEARROW>
				||	<LCONTAINS>
			)
			<expr>
		||	<expr>
			(	||	<RIGHTTEE>
				||	<DOUBLERIGHTTEE>
			)
			<expr>
		||	<expr>
			(	||	<LEFTTEE>
				||	<DOUBLELEFTTEE>
				||	<UPTEE>
				||	<DOWNTEE>
			)
			<expr>
		||	<expr>
			<SUCHTHAT>
			<expr>
		||	<expr>
			(	||	<DOUBLEDOT>
				||	<TRIPPLEDOT>
			)
		||	<expr>
			<BAR>
			<expr>
		||	<symbol>
			<RAWCOLON>
			<expr>
		||	<expr>
			<RAWCOLON>
			<expr>
		||	<expr>
			<DOUBLETILDE>
			<expr>
		||	<expr>
			<SLASHSEMI>
			<expr>
		||	<expr>
			(	||	<MINUSGREATER>
				||	<RARROW>
				||	<COLONGREATER>
				||	<COLONARROW>
			)
			<expr>
		||	<expr>
			(	||	<SLASHDOT>
				||	<DOUBLESLASHDOT>
			)
			<expr>
		||	<expr>
			(	||	<PLUSEQUAL>
				||	<MINUSEQUAL>
				||	<ASTERISKEQUAL>
				||	<SLASHEQUAL>
			)
			<expr>
		||	<expr>
			<AMP>
		||	<expr>
			<COLON>
			<expr>
		||	<expr>
			<DOUBLESLASH>
			<expr>
		||	<expr>
			<VERTICALSEPARATOR>
			<expr>
		||	<expr>
			<THEREFORE>
			<expr>
		||	<expr>
			<BECAUSE>
			<expr>
		||	<expr>
			<EQUAL>
			<DOT>
		||	<expr>
			(	||	<EQUAL>
				||	<COLONEQUAL>
				||	<CARETEQUAL>
				||	<CARETCOLONEQUAL>
				||	<FUNCTIONARROW>
			)
			<expr>
		||	<symbol>
			<SLASHCOLON>
			<expr>
			(	||	<EQUAL>
				||	<COLONEQUAL>
			)
			<expr>
		||	<symbol>
			<SLASHCOLON>
			<expr>
			<EQUAL>
			<DOT>
		||	<expr>
			(	||	<DOUBLEGREATER>
				||	<TRIPPLEGREATER>
			)
			<StringLiteral>
		||	<expr>
			<SEMICOLON>
			<expr>?
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
		||	<DIGITS>
			<NumberInBase>
			<numberLiteralPrecision>?
			<numberLiteralExponent>?
		||	(	||	<DIGITS>
				||	<DecimalNumber>
			)
			<numberLiteralPrecision>?
			<numberLiteralExponent>?
	}
	token numberLiteralPrecision {
		||	<DOUBLEBACKQUOTE>
			(	||	<DecimalNumber>
				||	<DIGITS>
			)
		||	<BACKQUOTE>
			(	||	<DecimalNumber>
				||	<DIGITS>
			)?
	}
	token numberLiteralExponent {
		||	(	||	<ASTERISKCARET>
					(	||	<PLUS>
						||	<MINUS>
					)?
					<DIGITS>
			)
	}
	token outExpression {
		||	<PERCENTDIGITS>
		||	<PERCENTS>
	}
	token slotExpression {
		||	<HASHDIGITS>
		||	<HASHStringLiteral>
		||	<DOUBLEHASHDIGITS>
		||	<DOUBLEHASH>
		||	<HASH>
	}
	token expressionList {
		||	<expr>?
			(	||	<COMMA>
					<expr>?
			)*
	}
	token accessExpression {
		||	<LBRACKET>
			<LBRACKET>
			<expressionList>
			<RBRACKET>
			<RBRACKET>
		||	<LBARBRACKET>
			<expressionList>
			<RBARBRACKET>
	}
}
