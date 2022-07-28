public with sharing class AccountTriggerHandler {

	public static void updateRelatedOpportunityNames(List<Account> accounts, Map<Id, Account> oldAccountMap) {
		Set<Id> accountIdsWithNameChange = new Set<Id>();
		List<Opportunity> oppsToUpdate = new List<Opportunity>();

		for (Account acc : accounts) {
			if (acc.Name != null && acc.Name != oldAccountMap.get(acc.Id).Name) {
				accountIdsWithNameChange.add(acc.Id);
			}
		}

		for (Opportunity opp : [SELECT Id, Account.Name, Type FROM Opportunity WHERE AccountId IN: accountIdsWithNameChange]) {
			opp.Name = opp.Account.Name + ' - ' + opp.Type;
			oppsToUpdate.add(opp);
		}

		if (!oppsToUpdate.isEmpty()) {
			update oppsToUpdate;
		}
	}

	public static void updateRelatedContactPhoneNumbers(List<Account> accounts, Map<Id, Account> oldAccountMap) {

	}

	public static void postChatterMessageWhenAccountChanges(List<Account> accounts, Map<Id, Account> oldAccountMap) {

	}
}
