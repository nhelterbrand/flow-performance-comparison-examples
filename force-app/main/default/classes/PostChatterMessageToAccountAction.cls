public class PostChatterMessageToAccountAction {

	@InvocableMethod(label='Post Chatter Message to Account')
	public static void postChatter(List<Account> accs) {
		AccountTriggerHandler.postChatterMessageWhenAccountFaxChanges(accs);
	}
}
