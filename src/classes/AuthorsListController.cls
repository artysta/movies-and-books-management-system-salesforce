public with sharing class AuthorsListController {
    @AuraEnabled
    public static List<MBMS_Author__c> getAuthorsList() {
        return [SELECT Id, Name, MBMS_Birthplace__c,
                MBMS_Date_of_Birth__c, MBMS_Date_of_Death__c
                FROM MBMS_Author__c];
    }
}