public class ArtistTriggerUtility {
    public static void updateArtistNames(List<MBMS_Artist__c> artists) {
        for (MBMS_Artist__c artist : artists) {
            artist.Name = String.format('{0} {1}', new List<String> { artist.MBMS_First_Name__c, artist.MBMS_Last_Name__c });
        }
    }
    
    public static void updateArtistStatusComments(List<MBMS_Artist__c> artists) {
        for (MBMS_Artist__c artist : artists) {
            artist.MBMS_Status_Comment__c = Constants.INITIAL_STATUS_COMMENT;
        }
    }

    public static void updatePreviousStatus(List<MBMS_Artist__c> oldArtists, List<MBMS_Artist__c> newArtists) {
        for (Integer i = 0; i < newArtists.size(); i++) {
            newArtists[i].MBMS_Previous_Status__c = oldArtists[i].MBMS_Status__c;
        }
    }
    
    public static void removeRelatedMovieActors(List<MBMS_Artist__c> artists) {
        Set<Id> artistIds = (new Map<Id, MBMS_Artist__c>(artists)).keySet();
        List<MBMS_Movie_Actor__c> movieActors = [SELECT Id FROM MBMS_Movie_Actor__c WHERE MBMS_Artist__r.Id IN :artistIds];
        
        delete movieActors;
    }
    
    public static void notifyApprovers(List<MBMS_Artist__c> artists) {
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
        
        for (MBMS_Artist__c artist : artists) {
            if (artist.MBMS_Status__c == artist.MBMS_Previous_Status__c) {
                continue;
            }

            if (artist.MBMS_Status__c == Constants.STATUS_APPROVED) {
                continue;
            }

            artist.OwnerId = approversQueue.Id;

            new CustomNotificationBuilder().create()
                .withTitle(Constants.PLEASE_TAKE_ACTION)
                .withBody(String.format(Constants.RECORD_TO_APPROVE_PATTERN, new List<String> { artist.Name, artist.Id }))
                .withDefaultNotificationType()
                .withTargetId(artist.Id)
                .build()
                .send(approversIds);
        }
    }
}