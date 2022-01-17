trigger ArtistTrigger on MBMS_Artist__c (before insert) {
    for (MBMS_Artist__c artist : Trigger.New) {
        artist.Name = String.format('{0} {1}', new List<String> { artist.MBMS_First_Name__c, artist.MBMS_Last_Name__c });
    }   
}