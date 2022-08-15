/**
 * Apex anonymous code
BatchUpdateGeneratedData batch = new BatchUpdateGeneratedData();
Database.executeBatch(batch);
 */
public class BatchUpdateGeneratedData implements Database.Batchable<sObject> {

	public final String query;

    public BatchUpdateGeneratedData() {
		query = 'SELECT Id, Name, Fax, Phone FROM Account';
    }

	public Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator(query);
	}

	public void execute(Database.BatchableContext BC, List<Account> accs) {
		String randNum = String.valueOf((Math.random() * 10).intValue());

		for (Account a : accs) {
			a.Name = a.Name + 'x';
			a.Fax = randNum;
			a.Phone = randNum;
		}

		update accs;
	}

	public void finish(Database.BatchableContext BC){}
}
