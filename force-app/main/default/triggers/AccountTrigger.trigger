trigger AccountTrigger on Account (after update) {

	if (Trigger.isAfter && Trigger.isUpdate) {
		// update the related Opportunity Name when the Account's Name changes
		AccountTriggerHandler.updateRelatedOpportunityNames(Trigger.new, Trigger.oldMap);

		// update the related Contact's Office phone numbers when the Account's phone number changes
		AccountTriggerHandler.updateRelatedContactPhoneNumbers(Trigger.new, Trigger.oldMap);

		// post a chatter message to the Account when the Account's ?? changes
		AccountTriggerHandler.postChatterMessageWhenAccountChanges(Trigger.new, Trigger.oldMap);
	}
}