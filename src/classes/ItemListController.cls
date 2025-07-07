public class ItemListController {
	@AuraEnabled(cacheable=true)
	public static List<Item__c> getItemList() {
		return new List<Item__c>();
	}

	@AuraEnabled(cacheable=true)
	public static List<Item__c> getFilteredItemList(List<string> families, List<string> types, string searchKey) {
		List<Item__c> itemList = getItemList();
		List<Item__c> filteredList;

		for (Item__C currentItem : itemList) {
			if (testFilters(currentItem, families, types) && testSearch(currentItem, searchKey)) {
				filteredList.add(currentItem);
			}
		}
		return filteredList;
	}

	public static boolean testFilters(Item__c item, List<string> families, List<string> types) {
		if (!families.isEmpty() && !families.contains(item.Family__c)) return false;
		if (!types.isEmpty() && !types.contains(item.Type__c)) return false;
		return true;
	}

	public static boolean testSearch(Item__C item, string searchKey) {
		return item.Name.contains(searchKey) || item.Description__c.contains(searchKey);
	}
}