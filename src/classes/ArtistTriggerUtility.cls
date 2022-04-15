public class ArtistTriggerUtility {
    public static void updateArtistNames(List<MBMS_Artist__c> artists) {
        for (MBMS_Artist__c artist : artists) {
            artist.Name = String.format('{0} {1}', new List<String> { artist.MBMS_First_Name__c, artist.MBMS_Last_Name__c });
        }
    }
    
    public static void updateArtistStatusComments(List<MBMS_Artist__c> artists) {
        for (MBMS_Artist__c artist : artists) {
            artist.MBMS_Status_Comment__c = MBMS_Constants.MBMS_INITIAL_STATUS_COMMENT;
        }
    }
    
    public static void removeRelatedMovieActors(List<MBMS_Artist__c> artists) {
        Set<Id> artistIds = (new Map<Id, MBMS_Artist__c>(artists)).keySet();
        List<MBMS_Movie_Actor__c> movieActors = [SELECT Id FROM MBMS_Movie_Actor__c WHERE MBMS_Artist__r.Id IN :artistIds];
        
        delete movieActors;
    }

    public static void notifyApprovers(List<MBMS_Artist__c> artists) {
        Group approversQueue = [SELECT Id
                                FROM Group WHERE Type = :MBMS_Constants.QUEUE_GROUP_TYPE
                                AND Name = :MBMS_Constants.APPROVERS_QUEUE
                                LIMIT 1];
        
        List<GroupMember> approvers = [SELECT UserOrGroupId
                                       FROM GroupMember
                                       WHERE GroupId = :approversQueue.Id];

        for (MBMS_Artist__c artist : artists) {
            if (artist.MBMS_Status__c == MBMS_Constants.MBMS_STATUS_APPROVED) {
                continue;
            }

            for (GroupMember approver : approvers) {
                CustomNotification notification = new CustomNotification(MBMS_Constants.PLEASE_TAKE_ACTION, String.format(MBMS_Constants.RECORD_TO_APPROVE_PATTERN, new List<String> { artist.Name, artist.Id }), new Set<String> { approver.UserOrGroupId }, artist.Id);
                notification.send();
            }
        }
    }
}