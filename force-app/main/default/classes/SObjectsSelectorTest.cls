@isTest
private class SObjectsSelectorTest {
    @testSetup
    static void testDataSetup() {
        Test.startTest();
        new UserBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        Test.stopTest();
    }
    
    @isTest
    static void shouldReturnApproversQueue() {
        Test.startTest();
        Group approversQueue = SObjectsSelector.getApproversQueue();
        Test.stopTest();
        
        System.assertNotEquals(null, approversQueue, String.format(Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'approversQueue' }));
        System.assertEquals(Constants.APPROVERS_QUEUE, approversQueue.Name, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'Name', Constants.APPROVERS_QUEUE }));
    }
    
    @isTest
    static void shouldReturnGroupMembers() {
        User user = [
            SELECT
                Id
            FROM User
            WHERE Email = :Constants.EMAIL
            LIMIT 1
        ];
        
        Group queue = SObjectsSelector.getApproversQueue();
        
        GroupMember groupMember = new GroupMember();
        groupMember.UserOrGroupId = user.Id;
        groupMember.GroupId = queue.Id;
        insert groupMember;
        
        Test.startTest();
        List<GroupMember> groupMembers = SObjectsSelector.getGroupMembersByGroupId(queue.Id);
        Test.stopTest();

        System.assert(groupMembers.size() > 0, String.format(Constants.SIZE_SHOULD_BE_GREATER_THAN_PATTERN, new List<String> { 'groupMembers', '0' }));
    }
}