trigger MovieTrigger on MBMS_Movie__c (before insert) {
    for (MBMS_Movie__c movie : Trigger.New) {
        movie.Name = movie.MBMS_Title__c;
    }   
}