@isTest
public class SampleDataFactoryTest {
    @isTest
    static void testDataInsert() {
        Test.startTest();
        SampleDataFactory.createAndInsertSampleRecords();
        Test.stopTest();
    }
}