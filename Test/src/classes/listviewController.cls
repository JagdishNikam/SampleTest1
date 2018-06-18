public class listviewController {
   @AuraEnabled
    public static List<ListView> getListViews() {
       List<ListView> listviews = [SELECT Id, Name FROM ListView WHERE SobjectType = 'Account' limit 5];
       return listviews;
    }
}