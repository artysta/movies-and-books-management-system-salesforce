public class BookTriggerUtility {
    public static void updateBookNames(List<MBMS_Book__c> books) {
        for (MBMS_Book__c book : books) {
            book.Name = book.MBMS_Title__c;
        }
    }
    
    public static void updateBookStatusComments(List<MBMS_Book__c> books) {
        for (MBMS_Book__c book : books) {
            book.MBMS_Status_Comment__c = MBMS_Constants.MBMS_INITIAL_STATUS_COMMENT;
        }
    }

    public static void notifyApprovers(List<MBMS_Book__c> books) {
        Group approversQueue = [SELECT Id
                                FROM Group WHERE Type = :MBMS_Constants.QUEUE_GROUP_TYPE
                                AND Name = :MBMS_Constants.APPROVERS_QUEUE
                                LIMIT 1];
        
        List<GroupMember> approvers = [SELECT UserOrGroupId
                                       FROM GroupMember
                                       WHERE GroupId = :approversQueue.Id];

        Set<String> approversIds = new Set<String>();
        
        for (GroupMember approver : approvers) {
            approversIds.add(approver.UserOrGroupId);
        }
        
        for (MBMS_Book__c book : books) {
            if (book.MBMS_Status__c == MBMS_Constants.MBMS_STATUS_APPROVED) {
                continue;
            }
            
            book.OwnerId = approversQueue.Id;

            new CustomNotificationBuilder().create()
                .withTitle(MBMS_Constants.PLEASE_TAKE_ACTION)
                .withBody(String.format(MBMS_Constants.RECORD_TO_APPROVE_PATTERN, new List<String> { book.Name, book.Id }))
                .withDefaultNotificationType()
                .withTargetId(book.Id)
                .build()
                .send(approversIds);
        }
    }
}