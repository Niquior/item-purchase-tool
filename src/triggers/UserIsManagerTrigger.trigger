trigger UserIsManagerTrigger on User (before update) {
	for (User user : Trigger.new) {
		if (Trigger.oldMap.get(user.Id).IsManager != user.IsManager__c) {
			if (UserInfo.getUserId() != '005gK0000045VIbQAM') {
				user.addError('You are prohibited to edit IsManager__c field');
			}
		}
	}
}