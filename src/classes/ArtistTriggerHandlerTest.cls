@isTest
private class ArtistTriggerHandlerTest {
    @testSetup
    static void testDataSetup() {
        MBMS_Artist__c artist = new ArtistBuilder().buildWithAllFieldsAndInsert();
    }
    
    @isTest
    static void triggerShouldUpdateArtistName() {
        Test.startTest();
        MBMS_Artist__c artist = [SELECT Name, MBMS_First_Name__c, MBMS_Last_Name__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        Test.stopTest();
        
        String expectedName = String.format('{0} {1}', new List<String> { artist.MBMS_First_Name__c, artist.MBMS_Last_Name__c });
        
        System.assertEquals(expectedName, artist.Name);
    }
}