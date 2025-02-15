public class CustomNotificationBuilder {
    private Messaging.CustomNotification notification;
    
    public CustomNotificationBuilder create() {
        this.notification = new Messaging.CustomNotification();
        return this;
    }
    
    public CustomNotificationBuilder withTitle(String title) {
		this.notification.setTitle(title);
        return this;
    }
    
    public CustomNotificationBuilder withBody(String body) {
        this.notification.setBody(body);
        return this;
    }
    
    public CustomNotificationBuilder withNotificationType(CustomNotificationType customNotificationType) {
        this.notification.setNotificationTypeId(customNotificationType.Id);
        return this;
    }
    
    public CustomNotificationBuilder withDefaultNotificationType() {
        this.notification.setNotificationTypeId(this.getDefaultNotificationType().Id);
        return this;
    }
    
    public CustomNotificationBuilder withTargetId(Id targetId) {
        this.notification.setTargetId(targetId);
        return this;
    }
    
    public Messaging.CustomNotification build() {
        return this.notification;
    }
    
    public void send(Set<String> usersIds) {
        this.notification.send(usersIds);
    }
    
    private CustomNotificationType getDefaultNotificationType() {
        return [SELECT Id FROM CustomNotificationType LIMIT 1];
    }
}