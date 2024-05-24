package com.unbosque.lexer;

import java_cup.runtime.*;

%%

%class Lexer

%line
%column

%cup

%{
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }

    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

LineTerminator = \r|\n|\r\n

WhiteSpace     = {LineTerminator} | [ \t\f]

PLAN_ENTRENAMIENTO = "PlanEntrenamiento"
ENTRENAMIENTO = "Entrenamiento"
CALENTAMIENTO = "Calentamiento"
TACTICA = "Tactica"
JUEGO_LIBRE = "JuegoLibre"
PERSONA = "Persona"
ASIGNACION = "Asignacion"
PERSON_ID = "\"[EJ]\d{3}\""
REPETITIONS = "\(x\d+\)"
TEAM = "\d+\s+vs\s+\d+"
PASS_CONDITION = "\d+\s+goles\s+y\s+pasa"
PERSON_ROLE = "Entrenador|Jugador"
PERSON_ATTRIBUTES = "[Nombre|Rol]+:"
STRING_ATTRIBUTES = "\"[a-zA-Z·ÈÌÛ˙¡…Õ”⁄0-9\\s]+\""
ASIGNATION_TOKEN = "\ba\b"
ACTIVITY = "[a-zA-Z·ÈÌÛ˙¡…Õ”⁄]+"
SEMICOLON = ";"
COLON = ":"
COMMA = ","

%%

<YYINITIAL> {
    {WhiteSpace} { 
        /* Ignore whitespace */
    }
    {PLAN_ENTRENAMIENTO} {
        System.out.print(yytext()); return symbol(sym.PLAN_ENTRENAMIENTO, yytext());
    }
    {ENTRENAMIENTO} {
        System.out.print(yytext()); return symbol(sym.ENTRENAMIENTO, yytext());
    }
    {CALENTAMIENTO} {
        System.out.print(yytext()); return symbol(sym.CALENTAMIENTO, yytext());
    }
    {TACTICA} {
        System.out.print(yytext()); return symbol(sym.TACTICA, yytext());
    }
    {JUEGO_LIBRE} {
        System.out.print(yytext()); return symbol(sym.JUEGO_LIBRE, yytext());
    }
    {PERSONA} {
        System.out.print(yytext()); return symbol(sym.PERSONA, yytext());
    }
    {ASIGNACION} {
        System.out.print(yytext()); return symbol(sym.ASIGNACION, yytext());
    }
    {PERSON_ID} {
        System.out.print(yytext()); return symbol(sym.PERSON_ID, yytext());
    }
    {REPETITIONS} {
        System.out.print(yytext()); return symbol(sym.REPETITIONS, yytext());
    }
    {TEAM} {
        System.out.print(yytext()); return symbol(sym.TEAM, yytext());
    }
    {PASS_CONDITION} {
        System.out.print(yytext()); return symbol(sym.PASS_CONDITION, yytext());
    }
    {PERSON_ROLE} {
        System.out.print(yytext()); return symbol(sym.PERSON_ROLE, yytext());
    }
    {PERSON_ATTRIBUTES} {
        System.out.print(yytext()); return symbol(sym.PERSON_ATTRIBUTES, yytext());
    }
    {STRING_ATTRIBUTES} {
        System.out.print(yytext()); return symbol(sym.STRING_ATTRIBUTES, yytext());
    }
    {ASIGNATION_TOKEN} {
        System.out.print(yytext()); return symbol(sym.ASIGNATION_TOKEN, yytext());
    }
    {ACTIVITY} {
        System.out.print(yytext()); return symbol(sym.ACTIVITY, yytext());
    }
    {SEMICOLON} {
        System.out.print(yytext()); return symbol(sym.SEMICOLON, yytext());
    }
    {COLON} {
        System.out.print(yytext()); return symbol(sym.COLON, yytext());
    }
    {COMMA} {
        System.out.print(yytext()); return symbol(sym.COMMA, yytext());
    }
    [^] { 
        throw new Error("Illegal character <" + yytext() + ">"); 
    }
}
