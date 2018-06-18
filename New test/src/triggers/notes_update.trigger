trigger notes_update on Account (after update) {
     if(trigger.isafter){

            for(account c : trigger.new){
               list<contact> con = [select id, name from contact where id =:c.id];
               system.debug('*********notelist1******'+con);
               list<opportunity> op = [select id, name from opportunity where id =: c.id];
               list<note> no  = [select body, title, parentid from note where parentid =: c.id];
                        for(contact p: con) {
                               list<note> notelist1 = [select body, title, parentid from note where parentid =: p.id];
                               system.debug('*********notelist1******'+notelist1);
                               for(note l : notelist1){
                                  l.parentid = c.id;
                                  insert notelist1;
                               
                               }
                        }
            }
    }   
     
}