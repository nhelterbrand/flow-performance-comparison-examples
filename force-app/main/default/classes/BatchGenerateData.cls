/**
 * Apex anonymous code
BatchGenerateData batch = new BatchGenerateData();
Database.executeBatch(batch);
 */
public class BatchGenerateData implements Database.Batchable<Integer> {

	public Iterable<Integer> start(Database.batchableContext info){
		return new IntegerIterator(500);
	}

	public void execute(Database.batchableContext info, List<Integer> scope){
		List<Account> accountsToCreate = new List<Account>();
		List<Contact> contactsToCreate = new List<Contact>();
		List<Opportunity> oppsToCreate = new List<Opportunity>();

		Account a;
		Contact c;
		Opportunity o;
		for (Integer i : scope) {
			a = new Account();
			a.Name = 'TestAccount' + i;
			a.Fax = '' + i;
			a.Phone = '' + i;

			for (Integer j = 0; j < 3; j++) {
				c = new Contact();
				c.AccountId = a.Id;
				c.FirstName = 'test';
				c.LastName = 'name'+ i + j;

				o = new Opportunity();
				o.AccountId = a.Id;
				o.Name = 'testopp' + i + j;
				o.StageName = 'Prospecting';
				o.CloseDate = Date.today().addDays(4);

				contactsToCreate.add(c);
				oppsToCreate.add(o);
			}

			accountsToCreate.add(a);
		}

		insert accountsToCreate;
		insert contactsToCreate;
		insert oppsToCreate;
	}


	public void finish(Database.BatchableContext BC){
	}

	public class IntegerIterator implements Iterable<Integer>, Iterator<Integer> {
		Integer counter;

		public IntegerIterator(Integer counter) {
			this.counter = counter;
		}

		public Boolean hasNext() { return counter > 0; }

		public Integer next() { return counter--; }

		public Iterator<Integer> iterator() { return this; }
	}
}
