package eu.yoannfleury.interfaces;

import javax.jws.WebService;
import javax.ws.rs.Path;

@WebService
public interface HelloWorldInterface {
    @Path("index")
    String index();
}