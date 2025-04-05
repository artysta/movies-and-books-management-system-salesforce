@isTest
public class SampleDataFactoryTest {
    @isTest
    static void testDataInsert() {
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new SampleDataHttpResponseGenerator());
        SampleDataFactory.createAndInsertSampleRecords();
        Test.stopTest();
    }
}