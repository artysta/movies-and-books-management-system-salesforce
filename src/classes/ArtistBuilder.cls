public class ArtistBuilder {
    private MBMS_Artist__c artist;
    
    public ArtistBuilder() {
        this.artist = new MBMS_Artist__c();
    }
    
    public ArtistBuilder withName(String name) {
        this.artist.Name = name;
        return this;
    }
    
    public ArtistBuilder withFirstName(String firstName) {
        this.artist.MBMS_First_Name__c = firstName;
        return this;
    }
    
    public ArtistBuilder withLastName(String lastName) {
        this.artist.MBMS_Last_Name__c = lastName;
        return this;
    }
    
    public ArtistBuilder withBirthplace(String birthplace) {
        this.artist.MBMS_Birthplace__c = birthplace;
        return this;
    }
    
    public ArtistBuilder withDateOfBirth(Date dateOfBirth) {
        this.artist.MBMS_Date_of_Birth__c = dateOfBirth;
        return this;
    }
    
    public ArtistBuilder withDateOfDeath(Date dateOfDeath) {
        this.artist.MBMS_Date_of_Death__c = dateOfDeath;
        return this;
    }
    
    public ArtistBuilder withDescription(String description) {
        this.artist.MBMS_Description__c = description;
        return this;
    }
    
    public ArtistBuilder withRoles(List<String> roles) {
        this.artist.MBMS_Roles__c = String.join(roles, ';');
        return this;
    }

    public ArtistBuilder withStatus(String status) {
        this.artist.MBMS_Status__c = status;
        return this;
    }
    
    public MBMS_Artist__c buildWithAllFields() {
        return this
            .withName(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withFirstName(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withLastName(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withBirthplace(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withDateOfBirth(MBMS_Constants.MBMS_TEST_DATE_200_DAYS_BEFORE_TODAY)
            .withDateOfDeath(MBMS_Constants.MBMS_TEST_DATE_10_DAYS_BEFORE_TODAY)
            .withDescription(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withRoles(new List<String> { MBMS_Constants.MBMS_ROLE_AUTHOR, MBMS_Constants.MBMS_ROLE_ACTOR })
            .withStatus(MBMS_Constants.MBMS_STATUS_APPROVED)
            .build();
    }
    
    public MBMS_Artist__c buildWithAllFieldsAndInsert() {
        this.artist = this.buildWithAllFields();
        insert artist;
        return artist;
    }
    
    public MBMS_Artist__c build() {       
        return this.artist;
    }
    
    public MBMS_Artist__c buildAndInsert() {       
        insert this.artist;
        return this.build();
    }
}