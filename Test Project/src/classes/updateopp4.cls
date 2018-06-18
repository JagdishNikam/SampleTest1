public with sharing class updateopp4 {

    public opportunity opportunities;

    public updateopp4() {
    }

     public list<opportunity> getopportunities() {
            return [SELECT id, name, StageName, CloseDate from Opportunity where id =: ApexPages.currentPage().getParameters().get('id')]; 
        } 
      
     public PageReference save() { 
          update opportunities; 
          return null;   
     }
     
}