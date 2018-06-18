trigger TC1 on Contact (After insert,After update) {
    
    Set<Id> s = new Set<Id>();
    List<Account> ac = new List<Account>();
    Map<Id,List<Contact>> m = new Map<Id,List<Contact>>();
    for(Contact con: trigger.new){
        s.add(con.AccountId);
    }
    List<Account> accounts = [Select Id, NoOfContacts__c , (Select Id from Contacts) from Account where Id IN: s];
    for(Account acc: accounts){
        List<Contact> contacts = acc.getSObjects('Contacts');
        m.put(acc.Id,contacts);
    }
    for(Account a: accounts){
        a.NoOfContacts__c = m.get(a.Id).size();
        ac.add(a);
    }
    if(!ac.isEmpty())
        update ac;
}