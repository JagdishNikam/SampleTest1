trigger firstTrigger on Contact (After Update) {
    
    

   for(contact c : trigger.new)
   {
      account acc = [select id from account where id =: c.Accountid];
      list<contact> contactlist = [select id,value__c from contact where accountid =: acc.id];
      acc.value2__c = 0;
      for(contact cn :contactlist) 
      {
         if(cn.value__c != null)
         {
             acc.value2__c = acc.value2__c + cn.value__c;
         }

      }
     update acc;
   }
    
    

}