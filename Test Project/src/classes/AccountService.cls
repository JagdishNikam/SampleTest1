global class AccountService{
    webservice static string CreateCustomer(string name, string phone, string city){
        Account obja = new account();
        obja.name = name;
        obja.phone = phone;
        obja.billingcity = city;
        Insert obja;
        
        if(obja.id != null){
           return 'success';
        }else{
           return 'failure';
        }
    
    
    }




}