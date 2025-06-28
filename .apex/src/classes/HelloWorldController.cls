public class HelloWorldController {

	@AuraEnabled
	public static string getHelloWorld(string name) {
		return 'Hello World, ' + name + '!';
	}

}