public class MoviePhotoTriggerUtility {
    public static void updateMoviePhotoStatusComments(List<MBMS_Movie_Photo__c> moviePhotos) {
        for (MBMS_Movie_Photo__c moviePhoto : moviePhotos) {
            moviePhoto.MBMS_Status_Comment__c = Constants.INITIAL_STATUS_COMMENT;
        }
    }

    public static void updatePreviousStatus(List<MBMS_Movie_Photo__c> oldMoviePhotos, List<MBMS_Movie_Photo__c> newMoviePhotos) {
        for (Integer i = 0; i < newMoviePhotos.size(); i++) {
            newMoviePhotos[i].MBMS_Previous_Status__c = oldMoviePhotos[i].MBMS_Status__c;
        }
    }

    public static void notifyApprovers(List<MBMS_Movie_Photo__c> moviePhotos) {
        Group approversQueue = SObjectsSelector.getApproversQueue();
        List<GroupMember> approvers = SObjectsSelector.getGroupMembersByGroupId(approversQueue.Id);

        Set<String> approversIds = new Set<String>();
        
        for (GroupMember approver : approvers) {
            approversIds.add(approver.UserOrGroupId);
        }
        
        for (MBMS_Movie_Photo__c moviePhoto : moviePhotos) {
            if (moviePhoto.MBMS_Status__c.equals(moviePhoto.MBMS_Previous_Status__c)) {
                continue;
            }

            if (moviePhoto.MBMS_Status__c.equals(Constants.STATUS_APPROVED)) {
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