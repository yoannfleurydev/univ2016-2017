package eu.yoannfleury.controllers;

import eu.yoannfleury.interfaces.HelloWorldInterface;

import javax.jws.WebService;
import javax.ws.rs.Path;

@WebService(endpointInterface = "eu.yoannfleury.interfaces.HelloWorldInterface")
@Path("/")
public class HelloWorld implements HelloWorldInterface {
    public String index() {
        System.out.println("Appel de index");
        return "Salut toi!";
    }
}