package com.sist.net;
import java.net.*;

public class Client {
	public static void main(String[] args) throws Exception {
		Socket s = new Socket("localhost", 3355);
	}
}
