public class SinglepicklistforMyAccount{
    public list<account> displayCustomer {get; set;}
    public string string1 {get; set;}
    public string string2 {get; set;}
    
    public SinglepicklistforMyAccount(){
        displayCustomer = new List<Account>([SELECT Id, Name from account limit 20]);
    }
    
    public List<SelectOption> getallCustomer(){
        List<SelectOption> options = new List<SelectOption>();
        list<string> check = new list<string>();
        for(account j : [SELECT id, type from account]){
            if(j.type!=null){
               
                check.add(j.type);
              options.add(new SelectOption(j.type, j.type));
            }
           }    
        return options;
            
 }
    public List<SelectOption> getallCustomer2(){
        List<SelectOption> options = new List<SelectOption>();
        
        for(account j : [SELECT industry from account]){
            if(j.industry!=null){
              options.add(new SelectOption(j.industry, j.industry));
            }
           }    
        return options;
            
 }
    public void save(){
       
        displayCustomer = [select id, name from account where type =:string1 AND industry =: string2 ];
        
        
    }
    
}