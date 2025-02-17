public class SObjectsSelector {
    public static Group getApproversQueue() {
        return [SELECT Id, Name
                FROM Group WHERE Type = :Constants.QUEUE_GROUP_TYPE
                AND Name = :Constants.APPROVERS_QUEUE
                LIMIT 1];
    }
    
    public static List<GroupMember> getGroupMembersByGroupId(Id groupId) {
        return [SELECT UserOrGroupId
                FROM GroupMember
                WHERE GroupId = :groupId];
    }
}