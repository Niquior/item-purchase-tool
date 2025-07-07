public class upperBarController {
	@AuraEnabled(cacheable=true)
	public static Account getAccount(Id id) {
		if (id != null)
			return [SELECT Id, Name, Industry
					FROM Account
					WHERE Id = :id
					LIMIT 1];
		else
			throw new NullPointerException();
	}

	@AuraEnabled(cacheable=true)
	public static User getUser(Id id) {
		if (id != null)
			return [SELECT IsManager__c
			FROM User
			WHERE Id = :id
			LIMIT 1];
		else
			throw new NullPointerException();
	}
}