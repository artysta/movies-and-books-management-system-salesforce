public class NewsUtilitiesFuture {
    private static List<String> contentList = new List<String>();
    
    // Prepare some "random" data using api.
    @future(callout = true)
    public static void updateFieldsFuture(Set<Id> newsIds){
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://loripsum.net/api');
        request.setMethod('GET');
        Http http = new Http();
        HTTPResponse response = new HTTPResponse();
        
        for (Integer i = 0; i < 10; i++) {
            response = http.send(request);
            String responseBody = response.getBody();
            contentList.add(responseBody.replaceAll('<p>', '').replaceAll('</p>', ''));
        }
        
        updateFields(newsIds);
    }
    
    private static void updateFields(Set<Id> newsIds) {
        List<MBMS_Artist_News__c> artistNewsList = [SELECT Id FROM MBMS_Artist_News__c WHERE Id = :newsIds];
        List<MBMS_Book_News__c> bookNewsList = [SELECT Id FROM MBMS_Book_News__c WHERE Id = :newsIds];
        List<MBMS_Movie_News__c> movieNewsList = [SELECT Id FROM MBMS_Movie_News__c WHERE Id = :newsIds];
                
        for (MBMS_Artist_News__c artistNews : artistNewsList) {
            artistNews.MBMS_Content__c = contentList.get(MBMS_Utilities.getRandomNumber(contentList.size() - 1));
        }
        
        for (MBMS_Book_News__c bookNews : bookNewsList) {
            bookNews.MBMS_Content__c = contentList.get(MBMS_Utilities.getRandomNumber(contentList.size() - 1));
        }
        
        for (MBMS_Movie_News__c movieNews : movieNewsList) {
            movieNews.MBMS_Content__c = contentList.get(MBMS_Utilities.getRandomNumber(contentList.size() - 1));
        }
        
        update artistNewsList;
        update bookNewsList;
        update movieNewsList;
    }
}