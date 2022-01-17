@isTest
private class RequiringActionRecordsControllerTest {
    @testSetup
    static void testDataSetup() {
        Test.startTest();
        MBMS_Artist__c artist = new ArtistBuilder().buildWithAllFieldsAndInsert();
        Test.stopTest();
    }
    
    @isTest
    static void  shouldReturnEmptyListOfRequiringActionRecords() {
        Test.startTest();
        List<MBMS_Artist__c> artists = [SELECT Id FROM MBMS_Artist__c];
        delete artists;
        
        List<sObject> requiringActionRecords = RequiringActionRecordsController.getRequiringActionRecords();
        Test.stopTest();
        
        System.assertEquals(0, requiringActionRecords.size());
    }
    
    @isTest
    static void  shouldReturnNotEmptyListOfRequiringActionRecords() {
        Test.startTest();
        List<MBMS_Artist__c> artists = [SELECT Id FROM MBMS_Artist__c];
        
        for (MBMS_Artist__c artist : artists) {
            artist.MBMS_Status__c = MBMS_Constants.MBMS_STATUS_REJECTED;
        }
        
        update artists;
        
        List<sObject> requiringActionRecords = RequiringActionRecordsController.getRequiringActionRecords();
        Test.stopTest();
        
        System.assert(requiringActionRecords.size() > 0);
        System.assertNotEquals(null, requiringActionRecords.get(0));
    }
}