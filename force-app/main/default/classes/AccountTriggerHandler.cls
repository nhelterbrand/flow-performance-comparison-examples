public class AccountTriggerHandler {

	public static void updateRelatedOpportunityNames(List<Account> accounts) {
		Set<Id> accountIdsWithNameChange = new Set<Id>();
		List<Opportunity> oppsToUpdate = new List<Opportunity>();

		for (Account acc : accounts) {
			accountIdsWithNameChange.add(acc.Id);
		}

		for (Opportunity opp : [SELECT Id, Account.Name, Type FROM Opportunity WHERE AccountId IN: accountIdsWithNameChange]) {
			opp.Name = opp.Account.Name + ' - ' + opp.Type;
			oppsToUpdate.add(opp);
		}

		if (!oppsToUpdate.isEmpty()) {
			update oppsToUpdate;
		}
	}

	public static void updateRelatedContactPhoneNumbers(List<Account> accounts) {
		Set<Id> accountIdsWithNumberChange = new Set<Id>();
		List<Contact> contactsToUpdate = new List<Contact>();

		for (Account acc : accounts) {
			accountIdsWithNumberChange.add(acc.Id);
		}

		for (Contact con : [SELECT Id, OtherPhone, Account.Phone FROM Contact WHERE AccountId IN: accountIdsWithNumberChange]) {
			con.OtherPhone = con.Account.Phone;
			contactsToUpdate.add(con);
		}

		if (!contactsToUpdate.isEmpty()) {
			update contactsToUpdate;
		}
	}

	public static void postChatterMessageWhenAccountFaxChanges(List<Account> accounts) {
		List<FeedItem> chatterPostsToInsert = new List<FeedItem>();

		FeedItem post;
		for (Account acc : accounts) {
			post = new FeedItem();
			post.ParentId = acc.Id; // RecordId
			post.Body = UserInfo.getName() + ' changed the Fax field.';

			chatterPostsToInsert.add(post);
		}

		insert chatterPostsToInsert;
	}
}
