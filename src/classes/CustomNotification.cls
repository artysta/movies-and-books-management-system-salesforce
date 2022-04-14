public class CustomNotification {
    private String title;
    private String body;
    private Set<String> usersIds;
    private String targetRecordId;
    
    public CustomNotification(String title, String body, Set<String> usersIds, String targetRecordId) {
        this.title = title;
        this.body = body;
        this.usersIds = usersIds;
        this.targetRecordId = targetRecordId;
    }
    
    public void send() {
        Messaging.CustomNotification notification = new Messaging.CustomNotification();        
        CustomNotificationType notificationType = [SELECT Id
                                                   FROM CustomNotificationType
                                                   LIMIT 1];
        
        notification.setTitle(title);
        notification.setBody(body);
        notification.setNotificationTypeId(notificationType.Id); 
        notification.setTargetId(targetRecordId);
        
        try {
            notification.send(usersIds);
        } catch (Exception e) {
            System.debug('Notification not sent. Exception has been thrown: ' + e.getMessage());
        }
    }
}