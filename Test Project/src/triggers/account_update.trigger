trigger account_update on Account (before insert,After Update) {
    
    if(trigger.isAfter && trigger.isupdate){
        set<id> Accountids = new set<id>();
        list<contact> ContactUpdate = new list<contact>();
        for(account a : trigger.new){
            if((a.test__c != trigger.oldmap.get(a.id).test__c) && a.test__c == true){
                Accountids.add(a.id);
            }
        }
        
    if(!Accountids.isEmpty()){
    Map<id,Account> Accountlist = new Map<id,Account>( [select id,(select id, test__c from contacts), test__c  from Account where id IN : Accountids]);
    
        for(account a :Accountlist.values()){
            for(contact c : a.contacts){
                    c.test__c = true;
                    ContactUpdate.add(c);
            }
        }
        }
        if(!ContactUpdate.isEmpty()){
        update ContactUpdate;
        }
    }
       
    
}