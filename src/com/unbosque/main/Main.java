package com.unbosque.main;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.StringReader;

import com.unbosque.parser.parser;
import com.unbosque.lexer.Lexer;


public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String line, dsrdoc = "";
		FileReader fr;
		try {
			fr = new FileReader("GenEntrenoPrincipal.dsr");
			BufferedReader br = new BufferedReader(fr);
			while ((line = br.readLine()) != null) {
				dsrdoc += line + "\n";
			}
			br.close();
			fr.close();
			StringReader sr = new StringReader(dsrdoc);
			Lexer lex = new Lexer(sr);
			parser p = new parser(lex);
			System.out.println(p.parse());
			
			FileWriter fw = new FileWriter("Training.html");
			fw.write(p.document.toString());
			fw.close();				
			
		} catch (Exception ex) {
		 ex.printStackTrace();
		}
	}

}
