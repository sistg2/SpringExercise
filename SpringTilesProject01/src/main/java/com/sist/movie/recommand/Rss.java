package com.sist.movie.recommand;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Getter;
import lombok.Setter;

@XmlRootElement
@Getter
@Setter
public class Rss {
	private Channel channel = new Channel();	
}
