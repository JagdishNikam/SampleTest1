trigger Casetrigger on Case (After Update) {
    set<id> caseids = new set<id>();
    list<case> caselist = new list<case>();
    for(case c : trigger.new){
       caseids.add(c.id);
    }
    
    list<case> caselist1 = [select id from case where id IN : caseids];
    
   
}