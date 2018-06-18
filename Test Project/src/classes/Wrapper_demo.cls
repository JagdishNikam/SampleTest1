public class Wrapper_demo {
    
    public list<wrapperobject> Lstwrp {get; set;}
    public Wrapper_demo(){
        Lstwrp = new list<wrapperobject>();
        list<account> myacc = [select id, name from account];
        for(integer i=0; i<myacc.size(); i++){
            Lstwrp.add(new wrapperobject(string.valueof(I+1),myacc[i]));
            
        }
        system.debug('**************now list is' +Lstwrp);
    }
    
    public class wrapperobject{
        public account acc {get; set;}
        public string srno {get; set;}
        public boolean checkbox {get; set;}
        public contact con {get; set;}
        public wrapperobject(string a, account acc){
             
             this.acc = acc;
             srno = a;
             
            // con = [select id, name from contact where contact.accountid =: acc.id];
            
            system.debug('**************now list is' +con);
        }
        
        
        
        
}
    
}