public with sharing class updateopp {

    public updateopp(ApexPages.StandardSetController controller) {
    }

     public list<opportunity> getopportunities() {
            return [SELECT id, name, StageName, CloseDate from Opportunity where id =: ApexPages.currentPage().getParameters().get('id')]; 
        } 
}