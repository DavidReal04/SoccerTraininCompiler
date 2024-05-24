package com.unbosque.ast;

import java.util.ArrayList;

public class Document extends HTMLNode{
	public Document(String tag, String text, ArrayList<TagAttribute> attributes) {
        super(tag, text, attributes);
    }
}
