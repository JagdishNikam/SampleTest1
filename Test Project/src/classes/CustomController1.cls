public class CustomController1{

       public Account acct;
       
          public account getacct(){
             
             return acct;    
       }
       
       public void setacct(string rating){
           acct.Account_rating__c=rating;
       }
       
       public List<opportunity> Childopps{
          get{
                     string acctId=ApexPages.currentPage().getParameters().get('ID');
                     childopps= [select Name, Amount, StageName, Closedate from opportunity where AccountId= :acctId];
                     return childopps;
             } 
                
              set;
       }
       
      
       
       public customcontroller1(){
       
           string acctId=ApexPages.currentPage().getParameters().get('ID');
           Acct = [Select Account_rating__c from Account where id= :acctId];
           
       }
       
       public pagereference save(){
          update Acct;
          return new pagereference('/' +acct.id);
       
       }
}