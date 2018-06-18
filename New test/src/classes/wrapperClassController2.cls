public class wrapperClassController2 {

  public list<ConOpp> wrapaccountList { get; set; }
  
  private final Account acc; 
  
  public wrapperClassController2(){
       if(wrapaccountList==null){
              wrapaccountList = new list<ConOpp>();
              acc = [SELECT Id, Name FROM Account WHERE Id = :ApexPages.currentPage().getParameters().get('id')];
              for(contact c : [select id, name from contact where contact.accountid =: acc.id ]){
                    wrapaccountList.add(new ConOpp(c));
                    system.debug(wrapaccountList);
              }
                    
       }    
  }        
    
//wrapper class define and controller
//--------------------------------------------------------------------------------------------
public class ConOpp {
        public Contact con {get; set;}
        
        public ConOpp(Contact c) {
            con = c;
        }
         
         
}       
//----------------------------------------------------------------------------------------------

}