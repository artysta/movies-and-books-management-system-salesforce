public class UserBuilder {
	private User user;
    
    public UserBuilder create() {
        this.user = new User();
        return this;
    }
    
    public UserBuilder withLastName(String lastName) {
        this.user.LastName = lastName;
        return this;
    }
    
    public UserBuilder withEmail(String email) {
        this.user.Email = email;
        return this;
    }
    
    public UserBuilder withAlias(String alias) {
        this.user.Alias = alias;
        return this;
    }
    
    public UserBuilder withUsername(String username) {
        this.user.Username = username;
        return this;
    }
    
    public UserBuilder withCommunityNickname(String communityNickname) {
        this.user.CommunityNickname = communityNickname;
        return this;
    }
    
    public UserBuilder withLocaleSidKey(String localeSidKey) {
        this.user.LocaleSidKey = localeSidKey;
        return this;
    }
    
    public UserBuilder withTimeZoneSidKey(String timeZoneSidKey) {
        this.user.TimeZoneSidKey = timeZoneSidKey;
        return this;
    }
    
    public UserBuilder withProfile(String profileId) {
        this.user.ProfileId = profileId;
        return this;
    }
    
    public UserBuilder withLanguageLocaleKey(String languageLocaleKey) {
        this.user.LanguageLocaleKey = languageLocaleKey;
        return this;
    }
    
    public UserBuilder withEmailEncodingKey(String emailEncodingKey) {
        this.user.EmailEncodingKey = emailEncodingKey;
        return this;
    }
    
    /*
     Should not be used in the loops due to SOQL limit - it queries profile.
     This method is used to create a single record (with all fields) for test purposes.
     */
    public User buildWithAllFields() {
        Profile profile = [SELECT Id FROM Profile LIMIT 1];
        
        return this
            .withLastName(MBMS_Constants.LAST_NAME)
            .withEmail(MBMS_Constants.EMAIL)
            .withAlias(MBMS_Constants.ALIAS)
            .withUsername(MBMS_Constants.USERNAME)
            .withCommunityNickname(MBMS_Constants.COMMUNITY_NICKNAME)
            .withLocaleSidKey(MBMS_Constants.EN_US_LOCALE)
            .withTimeZoneSidKey(MBMS_Constants.TIME_ZONE)
            .withProfile(profile.Id)
            .withLanguageLocaleKey(MBMS_Constants.EN_US_LOCALE)
            .withEmailEncodingKey(MBMS_Constants.ENCODING_UTF_8)
            .build();
    }
    
    public User buildWithAllFieldsAndInsert() {
        this.user = this.buildWithAllFields();
        insert this.user;
        return this.user;
    }
    
    public User build() {       
        return this.user;
    }
    
    public User buildAndInsert() {       
        insert this.user;
        return this.build();
    }
}