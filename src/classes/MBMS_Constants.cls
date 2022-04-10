// TODO: remove MBMS prefix from variable names.
public class MBMS_Constants {
    // Constant values for test purposes.
    public final static String MBMS_TEST_STRING_VALUE = 'Test String Value';
    public final static String MBMS_SEMICOLON = ';';
    public final static String FIELD_SHOULD_BE_PATTERN = '{0} field should be: {1}.';
    public final static String FIELD_SHOULD_CONTAIN_PATTERN = '{0} field should contain {1} value.';
    public final static String FIELD_SHOULD_NOT_BE_NULL_PATTERN = '{0} field should not be null.';
    public final static String SIZE_SHOULD_BE_GREATER_THAN_0_PATTERN = '{0} collection size should be greater than 0.';
    public final static String SIZE_SHOULD_BE_EQUAL_TO_0_PATTERN = '{0} collection size should be equal to 0.';
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
}