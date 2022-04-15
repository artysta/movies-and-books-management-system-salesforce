@isTest
private class CustomNotificationTest {
    @isTest
    static void exceptionShouldNotBeThrown() {
        Test.startTest();
        List<User> users = [SELECT Id FROM User LIMIT 1];
        CustomNotification notification = new CustomNotification('TEST TITLE', 'TEST BODY', new Set<String> { users[0].Id }, null);

        Integer exceptionsCount = 0;

        try {
            notification.send();
        } catch (Exception e) {
            exceptionsCount++;
            System.assertNotEquals(null, e, String.format(MBMS_Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'Exception' }));
        }

        Test.stopTest();

        System.assertEquals(0, exceptionsCount, String.format(MBMS_Constants.VALUE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'exceptionsCount', '0' }));
    }
}