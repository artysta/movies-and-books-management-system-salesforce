public class BookTriggerUtility {
    public static void updateBookNames(List<MBMS_Book__c> books) {
        for (MBMS_Book__c book : books) {
            book.Name = book.MBMS_Title__c;
        }
    }
    
    public static void updateBookStatusComments(List<MBMS_Book__c> books) {
        for (MBMS_Book__c book : books) {
            book.MBMS_Status_Comment__c = Constants.INITIAL_STATUS_COMMENT;
        }
    }

    public static void updatePreviousStatus(List<MBMS_Book__c> oldBooks, List<MBMS_Book__c> newBooks) {
        for (Integer i = 0; i < newBooks.size(); i++) {
            newBooks[i].MBMS_Previous_Status__c = oldBooks[i].MBMS_Status__c;
        }
    }

    public static void notifyApprovers(List<MBMS_Book__c> books) {
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
        
        for (MBMS_Book__c book : books) {
            if (book.MBMS_Status__c == book.MBMS_Previous_Status__c) {
                continue;
            }

            if (book.MBMS_Status__c == Constants.STATUS_APPROVED) {
                continue;
            }
            
            book.OwnerId = approversQueue.Id;

            new CustomNotificationBuilder().create()
                .withTitle(Constants.PLEASE_TAKE_ACTION)
                .withBody(String.format(Constants.RECORD_TO_APPROVE_PATTERN, new List<String> { book.Name, book.Id }))
                .withDefaultNotificationType()
                .withTargetId(book.Id)
                .build()
                .send(approversIds);
        }
    }
}