public class MBMS_Constants {
    // Constant values for test purposes.
    public final static String MBMS_TEST_STRING_VALUE = 'Test String Value';
    public final static Date MBMS_TEST_DATE_200_DAYS_BEFORE_TODAY =  Date.today().addDays(-200);
    public final static Date MBMS_TEST_DATE_10_DAYS_BEFORE_TODAY =  Date.today().addDays(-10);
    public final static Date MBMS_TEST_DATE_TODAY = Date.today();
    public final static Date MBMS_TEST_DATE_10_DAYS_AFTER_TODAY =  Date.today().addDays(10);
    public final static Date MBMS_TEST_DATE_200_DAYS_AFTER_TODAY =  Date.today().addDays(200);
    public final static String MBMS_SEMICOLON = ';';
    
    // Artist roles.
    public final static String MBMS_ROLE_AUTHOR = 'MBMS_Author';
    public final static String MBMS_ROLE_ACTOR = 'MBMS_Actor';
    public final static String MBMS_ROLE_DIRECTOR = 'MBMS_Director';
    public final static String MBMS_ROLE_WRITER = 'MBMS_Writer';

    // Record statuses.
    public final static String MBMS_STATUS_INITIAL = 'Initial';
    public final static String MBMS_STATUS_APPROVED = 'Approved';
    public final static String MBMS_STATUS_REJECTED = 'Rejected';
}