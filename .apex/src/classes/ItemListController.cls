public class ItemListController {
	@AuraEnabled(cacheable=true)
	public static string[] getItemList() {
		string[] iList = new string[3];
		iList[0] = '111';
		iList[1] = '222';
		iList[2] = '333';
		return iList;
	}

	@AuraEnabled(cacheable=true)
	public static List<Item__c> getFilteredItemList(string searchKey, List<string> filters) {
		return new List<Item__c>();
	}
}