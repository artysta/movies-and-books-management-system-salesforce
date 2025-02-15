public with sharing class RequiringActionRecordsController {
    @AuraEnabled
    public static List<sObject> getRequiringActionRecords() {
        List<sObject> result = new List<sObject>();
        
        result.addAll(ArtistsListController.getRequiringActionArtists());
        result.addAll(BooksListController.getRequiringActionBooks());
        result.addAll(MoviesListController.getRequiringActionMovies());
        result.addAll(MoviePhotosListController.getRequiringActionPhotos());

        return result;
    }
    
    @AuraEnabled
    public static Boolean areRequiringActionRecordsAvailable() { 
        return getRequiringActionRecords().size() > 0;
    }

    @AuraEnabled
    public static Boolean shouldUserBeAbleToSeeTheComponent() {
        List<GroupMember> groupMembers = [SELECT GroupId FROM GroupMember WHERE UserOrGroupId = :UserInfo.getUserId()];
        
        Set<Id> userGroupsIds = new Set<Id>();
        
        for (GroupMember member : groupMembers) {
            userGroupsIds.add(member.GroupId);
        }
        
        List<Group> queues = [SELECT Name FROM Group WHERE Id IN :userGroupsIds];
        
        for (Group queue : queues) {
            if (queue.Name == Constants.APPROVERS_QUEUE) {
                return true;
            }
        }
        
        return false;
    }
}