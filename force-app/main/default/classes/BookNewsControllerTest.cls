@isTest
public class BookNewsControllerTest {
    @testSetup
    static void testDataSetup() {
        Test.startTest();
        new BookNewsBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        Test.stopTest();
    }
    
    @isTest
    static void shouldThrowException() {
        MBMS_Book_News__c bookNews = [
            SELECT
                Id
            FROM MBMS_Book_News__c
            LIMIT 1
        ];
        
        delete bookNews;
        
        Integer exceptionsCount = 0;
        
        Test.startTest();
        try {
            bookNews = BookNewsController.getLatestBookNews();
        } catch (Exception e) {
            exceptionsCount++;
            System.assertNotEquals(null, e, String.format(Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'Exception' }));
            System.assertEquals('List has no rows for assignment to SObject', e.getMessage(), Constants.NO_ROWS_FOR_ASSIGMENT);
        }
        Test.stopTest();
        
        System.assert(exceptionsCount > 0, String.format(Constants.VALUE_SHOULD_BE_GREATER_THAN_PATTERN, new List<String> { 'exceptionsCount', '0' }));
    }
    
    @isTest
    static void shouldReturnBookNews() {
        Test.startTest();
        MBMS_Book_News__c bookNews = BookNewsController.getLatestBookNews();
        Test.stopTest();
        
        System.assertNotEquals(null, bookNews, String.format(Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Book_News__c' }));
    }
    
    @isTest
    static void shouldReturnBookNewsByBookId() {
        MBMS_Book__c book = [
            SELECT
                Id
            FROM MBMS_Book__c
            LIMIT 1
        ];
        
        Test.startTest();
        MBMS_Book_News__c bookNews = BookNewsController.getLatestBookNewsByBookId(book.Id);
        Test.stopTest();
        
        System.assertNotEquals(null, bookNews, String.format(Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Book_News__c' }));
    }
}