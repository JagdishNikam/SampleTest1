global with sharing class ctrlAccController {
    public list<WrapperObject> wrapperlist {get; set;}
    
    public ctrlAccController(){
         wrapperlist = new list<WrapperObject>();
         set<id> accids = new set<id>();
         list<account> accountss = new list<account>();
         //list<contact> Contactss= new list<contact>();
         list<AggregateResult> listagg = [select SUM(Total_vehicle__c)total_vehicle, Transportee__c from Fleet_Info__c group by Transportee__c];
           for(AggregateResult fleet : listagg){
             accids.add(string.valueof(fleet.get('Transportee__c')));
           }
         
           accountss = [select id, name from account where id IN : accids];  
           //contactss = [select id, name, accountid from contact where accountid IN : accids]; 
            map<id, contact> contacts = new  map<id, contact>([select id, name, accountid, MobilePhone from contact where accountid IN : accids]);
            set<id> colorSet = new set<id>();
            colorSet = contacts.keySet();
            system.debug('keyset for contacts'+colorSet );
            wrapperlist = new list<WrapperObject>();
             for(Account acc : accountss) {
                 WrapperObject nwo = new WrapperObject();
                 nwo.acc = acc.Name;
                 wrapperlist.add(nwo);
             }
}
    
public class WrapperObject {
  public string acc {get; set;}   
     
  }
}