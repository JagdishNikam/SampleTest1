trigger sampletest on Opportunity (after update) {
        
    Set<Id> resultIds = new  Set<Id>();
      for (Opportunity opp : Trigger.new) {
              Opportunity oldOpp = Trigger.oldMap.get(opp.Id);  // Access the "old" record by its ID in Trigger.oldMap
              Boolean oldOppIsWon = oldOpp.StageName.equals('Closed Won');  // Trigger.new records are conveniently the "new" versions!
              Boolean newOppIsWon = opp.StageName.equals('Closed Won');
    
    // Check that the field was changed to the correct value
    if (!oldOppIsWon && newOppIsWon) {
          resultIds.add(opp.Id);
          system.debug('here is list of id' +resultIds);
          list<case> mycases = [select id from case WHERE myopp__c IN :resultIds order by LastModifiedDate DESC limit 1];
          system.debug('here is list of cases' +mycases);
    }
  }
}