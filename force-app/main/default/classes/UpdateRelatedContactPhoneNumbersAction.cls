public class UpdateRelatedContactPhoneNumbersAction {

	@InvocableMethod(label='Update Related Contact Phone Numbers')
	public static void updateContacts(List<Account> accs) {
		AccountTriggerHandler.updateRelatedContactPhoneNumbers(accs);
	}
}
