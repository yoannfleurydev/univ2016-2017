package eu.yoannfleury.client;


import eu.yoannfleury.HelloWorldServiceLocator;
import eu.yoannfleury.HelloWorld_PortType;

public class HelloWorldClient {
    public static void main(String[] argv) {
        try {
            HelloWorldServiceLocator locator = new HelloWorldServiceLocator();
            HelloWorld_PortType service = locator.getHelloWorld();

            String response = service.sayHelloWorldFrom("IntelliJ Client");
            System.out.println(response);
        } catch (javax.xml.rpc.ServiceException ex) {
            ex.printStackTrace();
        } catch (java.rmi.RemoteException ex) {
            ex.printStackTrace();
        }
    }
}