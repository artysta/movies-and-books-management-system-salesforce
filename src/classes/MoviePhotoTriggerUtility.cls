public class MoviePhotoTriggerUtility {
    public static void updateMoviePhotoStatusComments(List<MBMS_Movie_Photo__c> moviePhotos) {
        for (MBMS_Movie_Photo__c moviePhoto : moviePhotos) {
            moviePhoto.MBMS_Status_Comment__c = Constants.INITIAL_STATUS_COMMENT;
        }
    }

    public static void notifyApprovers(List<MBMS_Movie_Photo__c> moviePhotos) {
        Group approversQueue = [SELECT Id
                                FROM Group WHERE Type = :Constants.QUEUE_GROUP_TYPE
                                AND Name = :Constants.APPROVERS_QUEUE
                                LIMIT 1];
        
        List<GroupMember> approvers = [SELECT UserOrGroupId
                                       FROM GroupMember
                                       WHERE GroupId = :approversQueue.Id];

        Set<String> approversIds = new Set<String>();
        
        for (GroupMember approver : approvers) {
            approversIds.add(approver.UserOrGroupId);
        }
        
        for (MBMS_Movie_Photo__c moviePhoto : moviePhotos) {
            if (moviePhoto.MBMS_Status__c == Constants.STATUS_APPROVED) {
                continue;
            }
            
            moviePhoto.OwnerId = approversQueue.Id;
            
            new CustomNotificationBuilder().create()
                .withTitle(Constants.PLEASE_TAKE_ACTION)
                .withBody(String.format(Constants.RECORD_TO_APPROVE_PATTERN, new List<String> { moviePhoto.Name, moviePhoto.Id }))
                .withDefaultNotificationType()
                .withTargetId(moviePhoto.Id)
                .build()
                .send(approversIds);
        }
    }
}