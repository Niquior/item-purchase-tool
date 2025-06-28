public class ItemListController {
	@AuraEnabled
	public static string[] getItemList() {
		string[] iList = new string[3];
		iList[0] = '111';
		iList[1] = '222';
		iList[2] = '333';
		return iList;
	}
}