public class ArtistBuilder {
    private MBMS_Artist__c artist;
    
    public ArtistBuilder() {
        this.artist = new MBMS_Artist__c();
    }
    
    public ArtistBuilder withName(String name) {
        this.artist.Name = name;
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
    
    public MBMS_Artist__c buildAndInsert() {       
        insert artist;
        return artist;
    }
}