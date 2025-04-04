public class MovieTriggerUtility {
    public static void updateMovieNames(List<MBMS_Movie__c> movies) {
        for (MBMS_Movie__c movie : movies) {
            movie.Name = movie.MBMS_Title__c;
        }
    }
    
    public static void updateMovieStatusComments(List<MBMS_Movie__c> movies) {
        for (MBMS_Movie__c movie : movies) {
            movie.MBMS_Status_Comment__c = Constants.INITIAL_STATUS_COMMENT;
        }
    }

    public static void updatePreviousStatus(List<MBMS_Movie__c> oldMovies, List<MBMS_Movie__c> newMovies) {
        for (Integer i = 0; i < newMovies.size(); i++) {
            newMovies[i].MBMS_Previous_Status__c = oldMovies[i].MBMS_Status__c;
        }
    }
    
    public static void removeRelatedMovieActors(List<MBMS_Movie__c> movies) {
        Set<Id> movieIds = (new Map<Id, MBMS_Movie__c>(movies)).keySet();
        List<MBMS_Movie_Actor__c> movieActors = [
            SELECT
                Id
            FROM MBMS_Movie_Actor__c
            WHERE MBMS_Artist__r.Id IN :movieIds
        ];
        
        delete movieActors;
    }

    public static void notifyApprovers(List<MBMS_Movie__c> movies) {
        Group approversQueue = SObjectsSelector.getApproversQueue();
        List<GroupMember> approvers = SObjectsSelector.getGroupMembersByGroupId(approversQueue.Id);

        Set<String> approversIds = new Set<String>();
        
        for (GroupMember approver : approvers) {
            approversIds.add(approver.UserOrGroupId);
        }
        
        for (MBMS_Movie__c movie : movies) {
            if (movie.MBMS_Status__c == movie.MBMS_Previous_Status__c) {
                continue;
            }

            if (movie.MBMS_Status__c == Constants.STATUS_APPROVED) {
                continue;
            }
            
            movie.OwnerId = approversQueue.Id;
            
            new CustomNotificationBuilder().create()
                .withTitle(Constants.PLEASE_TAKE_ACTION)
                .withBody(String.format(Constants.RECORD_TO_APPROVE_PATTERN, new List<String> { movie.Name, movie.Id }))
                .withDefaultNotificationType()
                .withTargetId(movie.Id)
                .build()
                .send(approversIds);
        }
    }
}