@isTest
private class BooksListControllerTest {
    @testSetup
    static void testDataSetup() {
        Test.startTest();
        new BookBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        Test.stopTest();
    }
    
    @isTest
    static void shouldReturnEmptyListOfBooks() {
        MBMS_Book__c book = [
            SELECT
                Id
            FROM MBMS_Book__c
            LIMIT 1
        ];
        
        delete book;
        
        Test.startTest();
        List<MBMS_Book__c> booksList = BooksListController.getBooksList();
        Test.stopTest();
        
        System.assertEquals(0, booksList.size(), String.format(Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'booksList', '0' }));
    }
    
    @isTest
    static void shouldReturnNotEmptyListOfBooks() {
        Test.startTest();
        List<MBMS_Book__c> booksList = BooksListController.getBooksList();
        Test.stopTest();
        
        System.assert(booksList.size() > 0, String.format(Constants.SIZE_SHOULD_BE_GREATER_THAN_PATTERN, new List<String> { 'bookList', '0' }));
        System.assertNotEquals(null, booksList[0], String.format(Constants.ELEMENT_OF_COLLECTION_SHOULD_NOT_BE_NULL, new List<String> { 'booksList' }));
    }
    
    @isTest
    static void shouldReturnEmptyListOfRequiringActionBooks() {
        MBMS_Book__c book = [
            SELECT
                Id
            FROM MBMS_Book__c
            LIMIT 1
        ];
        
        book.MBMS_Status__c = Constants.STATUS_APPROVED;
        update book;
        
        Test.startTest();
        List<MBMS_Book__c> booksList = BooksListController.getRequiringActionBooks();
        Test.stopTest();
        
        System.assertEquals(0, booksList.size(), String.format(Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'booksList', '0' }));
    }
    
    @isTest
    static void shouldReturnNotEmptyListOfRequiringActionBooks() {
        List<MBMS_Book__c> booksFromDb = [
            SELECT
                Id
            FROM MBMS_Book__c
        ];
        
        for (MBMS_Book__c book : booksFromDb) {
            book.MBMS_Status__c = Constants.STATUS_REJECTED;
        }
        
        update booksFromDb;
        
        Test.startTest();
        List<MBMS_Book__c> booksList = BooksListController.getRequiringActionBooks();
        Test.stopTest();
        
        System.assert(booksList.size() > 0, String.format(Constants.SIZE_SHOULD_BE_GREATER_THAN_PATTERN, new List<String> { 'booksList', '0' }));
        System.assertNotEquals(null, booksList[0], String.format(Constants.ELEMENT_OF_COLLECTION_SHOULD_NOT_BE_NULL, new List<String> { 'booksList' }));
    }
    
    @isTest
    static void booksShouldNotBeAvailable() {
        MBMS_Book__c book = [
            SELECT
                Id
            FROM MBMS_Book__c
            LIMIT 1
        ];
        
        delete book;
        
        Test.startTest();
        Boolean areBooksAvailable = BooksListController.areBooksAvailable();
        Test.stopTest();
        
        System.assert(!areBooksAvailable, String.format(Constants.VALUE_SHOULD_BE_FALSE, new List<String> { 'areBooksAvailable' }));
    }
    
    @isTest
    static void booksShouldBeAvailable() {
        Test.startTest();
        Boolean areBooksAvailable = BooksListController.areBooksAvailable();
        Test.stopTest();
        
        System.assert(areBooksAvailable, String.format(Constants.VALUE_SHOULD_BE_TRUE, new List<String> { 'areBooksAvailable' }));
    }
}