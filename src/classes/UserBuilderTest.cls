@isTest
public class UserBuilderTest {
    @testSetup
    static void testDataSetup() {
        Test.startTest();
        new UserBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        Test.stopTest();
    }
    
    @isTest
    static void userShouldNotBeNull() {        
        User user = new UserBuilder()
            .create()
            .build();
        
        System.assertNotEquals(null, user, String.format(MBMS_Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'User' }));
    }
    
    @isTest
    static void insertedBookShouldNotBeNull() {
        User user = [SELECT Id
                     FROM User
                     WHERE Email = :MBMS_Constants.EMAIL
                     LIMIT 1];
        
        System.assertNotEquals(null, user, String.format(MBMS_Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'User' }));
    }
    
    @isTest
    static void userShouldHaveLastName() {
        User user = [SELECT LastName
                     FROM User
                     WHERE Email = :MBMS_Constants.EMAIL
                     LIMIT 1];
        
        System.assertEquals(MBMS_Constants.LAST_NAME, user.LastName, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'LastName', MBMS_Constants.LAST_NAME }));
    }
    
    @isTest
    static void userShouldHaveEmail() {
        User user = [SELECT Email
                     FROM User
                     WHERE Email = :MBMS_Constants.EMAIL
                     LIMIT 1];
        
        System.assertEquals(MBMS_Constants.EMAIL, user.Email, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'Email', MBMS_Constants.EMAIL }));
    }
    
    @isTest
    static void userShouldHaveAlias() {
        User user = [SELECT Alias
                     FROM User
                     WHERE Email = :MBMS_Constants.EMAIL
                     LIMIT 1];
        
        System.assertEquals(MBMS_Constants.Alias, user.Alias, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'Alias', MBMS_Constants.Alias }));
    }
    
    @isTest
    static void userShouldHaveUsername() {
        User user = [SELECT Username
                     FROM User
                     WHERE Email = :MBMS_Constants.EMAIL
                     LIMIT 1];
        
        System.assertEquals(MBMS_Constants.Username, user.Username, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'Username', MBMS_Constants.Username }));
    }
    
    @isTest
    static void userShouldHaveCommunityNickname() {
        User user = [SELECT CommunityNickname
                     FROM User
                     WHERE Email = :MBMS_Constants.EMAIL
                     LIMIT 1];
        
        System.assertEquals(MBMS_Constants.COMMUNITY_NICKNAME, user.CommunityNickname, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'CommunityNickname', MBMS_Constants.COMMUNITY_NICKNAME }));
    }
    
    @isTest
    static void userShouldHaveLocaleSidKey() {
        User user = [SELECT LocaleSidKey
                     FROM User
                     WHERE Email = :MBMS_Constants.EMAIL
                     LIMIT 1];
        
        System.assertEquals(MBMS_Constants.EN_US_LOCALE, user.LocaleSidKey, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'LocaleSidKey', MBMS_Constants.EN_US_LOCALE }));
    }
    
    @isTest
    static void userShouldHaveTimeZoneSidKey() {
        User user = [SELECT TimeZoneSidKey
                     FROM User
                     WHERE Email = :MBMS_Constants.EMAIL
                     LIMIT 1];
        
        System.assertEquals(MBMS_Constants.TIME_ZONE, user.TimeZoneSidKey, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'TimeZoneSidKey', MBMS_Constants.TIME_ZONE }));
    }
    
    @isTest
    static void userShouldHaveProfile() {
        User user = [SELECT ProfileId
                     FROM User
                     WHERE Email = :MBMS_Constants.EMAIL
                     LIMIT 1];
        
        System.assertNotEquals(null, user.ProfileId, String.format(MBMS_Constants.FIELD_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'ProfileId' }));
    }
    
    @isTest
    static void userShouldHaveLanguageLocaleKey() {
        User user = [SELECT LanguageLocaleKey
                     FROM User
                     WHERE Email = :MBMS_Constants.EMAIL
                     LIMIT 1];
        
        System.assertEquals(MBMS_Constants.EN_US_LOCALE, user.LanguageLocaleKey, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'LanguageLocaleKey', MBMS_Constants.EN_US_LOCALE }));
    }
    
    @isTest
    static void userShouldHaveEmailEncodingKey() {
        User user = [SELECT EmailEncodingKey
                     FROM User
                     WHERE Email = :MBMS_Constants.EMAIL
                     LIMIT 1];
        
        System.assertEquals(MBMS_Constants.ENCODING_UTF_8, user.EmailEncodingKey, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'EmailEncodingKey', MBMS_Constants.ENCODING_UTF_8 }));
    }
}