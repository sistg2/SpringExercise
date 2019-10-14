package com.sist.net;
import java.util.*;
import java.net.*;

public class Server implements Runnable {
	private ServerSocket ss;
	
	public Server() {
		try {
			ss = new ServerSocket(3355);
			System.out.println("Server Start...");
		} catch (Exception ex) {}
	}
	
	public void run() {
		try {
			while(true) {
				Socket s = ss.accept();
				System.out.println("Client IP : " + s.getInetAddress().getHostAddress());
				System.out.println("Client Port : " + s.getPort());
			}
		} catch (Exception ex) {}
	}
	
	public static void main(String[] args) {
		Server server = new Server();
		new Thread(server).start();
	}
}
