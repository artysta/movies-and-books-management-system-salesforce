@isTest
private class BooksListControllerTest {
    @testSetup
    static void testDataSetup() {
        MBMS_Book__c book = new BookBuilder()
            .withName(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withTitle(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withStatus(MBMS_Constants.MBMS_STATUS_REJECTED)
            .buildAndInsert();
    }
    
    @isTest
    static void shouldReturnNotEmptyListOfBooks() {
        Test.startTest();
        List<MBMS_Book__c> booksList = BooksListController.getBooksList();
        Test.stopTest();
        
        System.assert(booksList.size() > 0);
        System.assertNotEquals(null, booksList[0]);
    }
    
    @isTest
    static void shouldReturnNotEmptyListOfRequiringActionBooks() {
        Test.startTest();
        List<MBMS_Book__c> booksList = BooksListController.getRequiringActionBooks();
        Test.stopTest();
        
        System.assert(booksList.size() > 0);
        System.assertNotEquals(null, booksList[0]);
    }
}