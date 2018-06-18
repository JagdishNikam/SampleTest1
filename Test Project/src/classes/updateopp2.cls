public with sharing class updateopp2 {

    public opportunity opportunities;

    public updateopp2(ApexPages.StandardSetController controller) {
    }

     public list<opportunity> getopportunities() {
            return [SELECT id, name, StageName, CloseDate from Opportunity where id =: ApexPages.currentPage().getParameters().get('id')]; 
        } 
      
     public PageReference save() { 
          update opportunities; 
          return null;   
     }
     
}