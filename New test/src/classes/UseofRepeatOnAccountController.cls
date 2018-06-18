public class UseofRepeatOnAccountController {
    public List<Account> accountList{get;set;}
   
    public UseofRepeatOnAccountController() {
        accountList = new List<Account>();
        accountList = [SELECT id, Name,(SELECT LastName ,FirstName From Contacts)From Account WHERE ID='001280000132bfw' limit 5] ;
    }
}