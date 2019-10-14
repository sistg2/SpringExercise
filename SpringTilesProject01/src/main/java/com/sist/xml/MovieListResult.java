package com.sist.xml;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@XmlRootElement
public class MovieListResult {
	private MovieList movieList;
}
