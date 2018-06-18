trigger Contacttrigger on Contact (After Update) {
   for(contact c : trigger.new){
      account acc = [select id from account where id =: c.Accountid];
      list<contact> contactlist = [select id, Price__c from contact where accountid =: acc.id];
      acc.Total_Contacts__c = 0;
      for(contact cn :contactlist) {
         if(cn.Price__c != null){
             acc.Total_Contacts__c = acc.Total_Contacts__c + cn.Price__c;
         }
          
      }
     update acc;
   }
}