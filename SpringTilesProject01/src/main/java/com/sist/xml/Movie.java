package com.sist.xml;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Movie {
	private String movieNm;
	private String typeNm;
	private String nationAlt;
	private String genreAlt;
	private Directors directors;
}
