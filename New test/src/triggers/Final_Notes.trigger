trigger Final_Notes on Note (after insert) {

   set<id> Account_ID = new set<id>();
   
      for(note no : trigger.new){   
           String parentIdString = String.valueof(no.parentId);
             if(parentIdString.substring(0,3) == '001'){
                  Account_ID.add(no.parentid);
             }
      }
      
      list<contact> con_list = [select id, name from contact where contact.accountid =: Account_ID];
      
       Map<Id,List<Contact>> mapAccountWiseContact = new Map<Id,List<Contact>>();

      
      for( Contact cont : con_list )
            {
                if(mapAccountWiseContact.containsKey(cont.accountid))
                {
                    List<Contact> lstCont = mapAccountWiseContact.get(cont.accountid);
                    lstCont.add(cont);
                }
                else
                {
                    List<Contact> lstCont = new List<Contact>();
                    lstCont.add(cont);
                    mapAccountWiseContact.put(cont.accountid,lstCont);
                }
            }
            
        for(note n1 : trigger.new)
            {
                if(n1.parentid != null && mapAccountWiseContact.containsKey(n1.parentid))
                {
                    List<Contact> lstContacts = mapAccountWiseContact.get(n1.parentid);
                    
                    for(Contact cont : lstContacts)
                    {
                        list<note> mynew_note = [select parentid from note where parentid =: cont.id];    
                              for(note nn : mynew_note){
                                  nn.parentid = n1.parentid;
                                  
                              }                   
                    }
                }
             }
            
        
            
            
      
       
       
}