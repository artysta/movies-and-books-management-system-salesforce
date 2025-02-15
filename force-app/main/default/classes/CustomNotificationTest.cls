@isTest
private class CustomNotificationTest {
    @isTest
    static void exceptionShouldNotBeThrown() {
        List<User> users = [SELECT Id FROM User LIMIT 1];
        Messaging.CustomNotification notification = new CustomNotificationBuilder().create()
            .withTitle(Constants.TEST_STRING_VALUE)
            .withBody(Constants.TEST_STRING_VALUE)
            .withDefaultNotificationType()
            .withTargetId(users[0].Id)
            .build();

        Integer exceptionsCount = 0;

        Test.startTest();
        try {
            notification.send(new Set<String> { users[0].Id });
        } catch (Exception e) {
            exceptionsCount++;
            System.assertNotEquals(null, e, String.format(Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'Exception' }));
        }
        Test.stopTest();

        System.assertNotEquals(null, notification, String.format(Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'Messaging.CustomNotification' }));
        System.assertEquals(0, exceptionsCount, String.format(Constants.VALUE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'exceptionsCount', '0' }));
    }
}