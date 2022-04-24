// TODO: remove MBMS prefix from variable names.
public class MBMS_Constants {
    // Constant values for test purposes.
    public final static String MBMS_TEST_STRING_VALUE = 'Test String Value';
    public final static String MBMS_SEMICOLON = ';';
    public final static String LAST_NAME = 'Test Last Name';
    public final static String ALIAS = 'alias';
    public final static String EMAIL = 'test1@test.pl';
    public final static String USERNAME = 'test1@test.pl';
    public final static String COMMUNITY_NICKNAME = 'Community Nickname';
    public final static String EN_US_LOCALE = 'en_US';
    public final static String ENCODING_UTF_8 = 'UTF-8';
    public final static String TIME_ZONE = 'GMT';
    public final static String FIELD_SHOULD_BE_PATTERN = '{0} field should be: {1}.';
    public final static String FIELD_SHOULD_CONTAIN_PATTERN = '{0} field should contain {1} value.';
    public final static String OBJECT_SHOULD_NOT_BE_NULL_PATTERN = '{0} object should not be null.';
    public final static String FIELD_SHOULD_NOT_BE_NULL_PATTERN = '{0} field should not be null.';
    public final static String VALUE_SHOULD_NOT_BE_NULL_PATTERN = '{0} value should not be null.';
    public final static String SIZE_SHOULD_BE_GREATER_THAN_PATTERN = '{0} collection size should be greater than {1}.';
    public final static String SIZE_SHOULD_BE_EQUAL_TO_PATTERN = '{0} collection size should be equal to {1}.';
    public final static String VALUE_SHOULD_BE_EQUAL_TO_PATTERN = '{0} value should be equal to {1}.';
    public final static String VALUE_SHOULD_BE_GREATER_THAN_PATTERN = '{0} value should be greater than {1}.';
    public final static String VALUE_SHOULD_BE_GREATER_OR_EQUAL_TO_PATTERN = '{0} value should be greater or equal to {1}.';
    public final static String VALUE_SHOULD_BE_LESS_OR_EQUAL_TO_PATTERN = '{0} value should be less or equal to {1}.';
    public final static String VALUE_SHOULD_BE_LESS_THAN_PATTERN = '{0} value should be less than {1}.';
    public final static String VALUE_SHOULD_BE_TRUE = '{0} value should be true.';
    public final static String VALUE_SHOULD_BE_FALSE = '{0} value should be false.';
    public final static String NO_ROWS_FOR_ASSIGMENT = 'List has no rows for assignment to SObject';
    public final static String ELEMENT_OF_COLLECTION_SHOULD_NOT_BE_NULL = 'The element of the collection should not be null.';
    public final static String NAME_OF_SOBJECT_SHOULD_BE = 'The name of {0} sObject should be {1}.';
    public final static String SCHEDULED_APEX = 'ScheduledApex';
    public final static String BATCH_APEX = 'BatchApex';
    public final static String CRON_EXP = '0 0 0 15 3 ? *';
    public final static Date MBMS_TEST_DATE_200_DAYS_BEFORE_TODAY =  Date.today().addDays(-200);
    public final static Date MBMS_TEST_DATE_10_DAYS_BEFORE_TODAY =  Date.today().addDays(-10);
    public final static Date MBMS_TEST_DATE_TODAY = Date.today();
    public final static Date MBMS_TEST_DATE_10_DAYS_AFTER_TODAY =  Date.today().addDays(10);
    public final static Date MBMS_TEST_DATE_200_DAYS_AFTER_TODAY =  Date.today().addDays(200);
    public final static Integer MBMS_TEST_NUMBER = 100;

    // Artist roles.
    public final static String MBMS_ROLE_AUTHOR = 'MBMS_Author';
    public final static String MBMS_ROLE_ACTOR = 'MBMS_Actor';
    public final static String MBMS_ROLE_DIRECTOR = 'MBMS_Director';
    public final static String MBMS_ROLE_WRITER = 'MBMS_Writer';
    public final static List<String> MBMS_ROLES_LIST = new List<String> { MBMS_ROLE_AUTHOR, MBMS_ROLE_ACTOR, MBMS_ROLE_DIRECTOR, MBMS_ROLE_WRITER };

    // Record statuses.
    public final static String MBMS_STATUS_INITIAL = 'Initial';
    public final static String MBMS_STATUS_APPROVED = 'Approved';
    public final static String MBMS_STATUS_REJECTED = 'Rejected';
    
    public final static Date MBMS_RECORDS_RETENTION_DATE =  Date.today().addDays(-7);
    
    public final static String MBMS_NAMESPACE_PREFIX = 'MBMS_';
    public final static String MBMS_CUSTOM_OBJECT_SUFFIX = '__c';
    
    public final static String MBMS_INITIAL_STATUS_COMMENT = 'This record is in the initial status.';
    public final static String PLEASE_TAKE_ACTION = 'Please take action.';
    public final static String RECORD_TO_APPROVE_PATTERN = 'Record {0} ({1}) is waiting for your approval.';

    public final static String APPROVERS_QUEUE = 'Approvers Queue';
    public final static String QUEUE_GROUP_TYPE = 'Queue';
}