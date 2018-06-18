trigger note_trigger on Note (after insert, after update) {
    for(note nt: Trigger.new){
          String Title = nt.title;
          id pId = nt.ParentId;
          
           List<contact> c = [select id, name from contact where contact.accountid = : pid ];
    }

}