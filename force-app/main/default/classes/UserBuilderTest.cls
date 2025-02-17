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
        
        System.assertNotEquals(null, user, String.format(Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'User' }));
    }
    
    @isTest
    static void insertedBookShouldNotBeNull() {
        User user = [SELECT Id
                     FROM User
                     WHERE Email = :Constants.EMAIL
                     LIMIT 1];
        
        System.assertNotEquals(null, user, String.format(Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'User' }));
    }
    
    @isTest
    static void userShouldHaveLastName() {
        User user = [SELECT LastName
                     FROM User
                     WHERE Email = :Constants.EMAIL
                     LIMIT 1];
        
        System.assertEquals(Constants.LAST_NAME, user.LastName, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'LastName', Constants.LAST_NAME }));
    }
    
    @isTest
    static void userShouldHaveEmail() {
        User user = [SELECT Email
                     FROM User
                     WHERE Email = :Constants.EMAIL
                     LIMIT 1];
        
        System.assertEquals(Constants.EMAIL, user.Email, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'Email', Constants.EMAIL }));
    }
    
    @isTest
    static void userShouldHaveAlias() {
        User user = [SELECT Alias
                     FROM User
                     WHERE Email = :Constants.EMAIL
                     LIMIT 1];
        
        System.assertEquals(Constants.Alias, user.Alias, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'Alias', Constants.Alias }));
    }
    
    @isTest
    static void userShouldHaveUsername() {
        User user = [SELECT Username
                     FROM User
                     WHERE Email = :Constants.EMAIL
                     LIMIT 1];
        
        System.assertEquals(Constants.Username, user.Username, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'Username', Constants.Username }));
    }
    
    @isTest
    static void userShouldHaveCommunityNickname() {
        User user = [SELECT CommunityNickname
                     FROM User
                     WHERE Email = :Constants.EMAIL
                     LIMIT 1];
        
        System.assertEquals(Constants.COMMUNITY_NICKNAME, user.CommunityNickname, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'CommunityNickname', Constants.COMMUNITY_NICKNAME }));
    }
    
    @isTest
    static void userShouldHaveLocaleSidKey() {
        User user = [SELECT LocaleSidKey
                     FROM User
                     WHERE Email = :Constants.EMAIL
                     LIMIT 1];
        
        System.assertEquals(Constants.EN_US_LOCALE, user.LocaleSidKey, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'LocaleSidKey', Constants.EN_US_LOCALE }));
    }
    
    @isTest
    static void userShouldHaveTimeZoneSidKey() {
        User user = [SELECT TimeZoneSidKey
                     FROM User
                     WHERE Email = :Constants.EMAIL
                     LIMIT 1];
        
        System.assertEquals(Constants.TIME_ZONE, user.TimeZoneSidKey, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'TimeZoneSidKey', Constants.TIME_ZONE }));
    }
    
    @isTest
    static void userShouldHaveProfile() {
        User user = [SELECT ProfileId
                     FROM User
                     WHERE Email = :Constants.EMAIL
                     LIMIT 1];
        
        System.assertNotEquals(null, user.ProfileId, String.format(Constants.FIELD_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'ProfileId' }));
    }
    
    @isTest
    static void userShouldHaveLanguageLocaleKey() {
        User user = [SELECT LanguageLocaleKey
                     FROM User
                     WHERE Email = :Constants.EMAIL
                     LIMIT 1];
        
        System.assertEquals(Constants.EN_US_LOCALE, user.LanguageLocaleKey, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'LanguageLocaleKey', Constants.EN_US_LOCALE }));
    }
    
    @isTest
    static void userShouldHaveEmailEncodingKey() {
        User user = [SELECT EmailEncodingKey
                     FROM User
                     WHERE Email = :Constants.EMAIL
                     LIMIT 1];
        
        System.assertEquals(Constants.ENCODING_UTF_8, user.EmailEncodingKey, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'EmailEncodingKey', Constants.ENCODING_UTF_8 }));
    }
}