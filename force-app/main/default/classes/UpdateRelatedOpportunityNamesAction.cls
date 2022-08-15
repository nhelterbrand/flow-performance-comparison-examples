public class UpdateRelatedOpportunityNamesAction {

	@InvocableMethod(label='Update Related Opportunity Names')
	public static void updateOpps(List<Account> accs) {
		AccountTriggerHandler.updateRelatedOpportunityNames(accs);
	}
}
