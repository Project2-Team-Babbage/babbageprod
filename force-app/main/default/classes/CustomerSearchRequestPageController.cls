public class CustomerSearchRequestPageController{
    // function to return matching doctors based on soql query
    @AuraEnabled
    public static List<Residence__c> returnMatchingDoctors(string searchquery){
        return Database.query(searchquery);  
    }
    
    // function to insert search record when user clicks 'Search' button on CustomerSearchPage
    @AuraEnabled
    public static void insertSearchRecord(Search__c searchToInsert){
        insert searchToInsert;
    }
    
    // function to return gender options for CustomerSearchPage
    @AuraEnabled
    public static List<String> getGenderOptions(){
        List<Schema.PicklistEntry> picklistValues = Contact.Sex__c.getDescribe().getPicklistValues();
        List<String> returnedOptions = new List<String>();
        for(Schema.PicklistEntry spe : picklistValues){
            returnedOptions.add(spe.getValue());
        }
        return returnedOptions;
    }
    
    // function to return specialization options for CustomerSearchPage
    @AuraEnabled
    public static List<String> getSpecializationOptions(){
        List<Schema.PicklistEntry> picklistValues = 
            Contact.Specialization__c.getDescribe().getPicklistValues();
        List<String> returnedOptions = new List<String>();
        for(Schema.PicklistEntry spe : picklistValues){
            returnedOptions.add(spe.getValue());
        }
        return returnedOptions;
    }
    
    // function to return language options for CustomerSearchPage
    @AuraEnabled
    public static List<String> getLanguageOptions(){
        List<Schema.PicklistEntry> picklistValues = 
            Contact.Language__c.getDescribe().getPicklistValues();
        List<String> returnedOptions = new List<String>();
        for(Schema.PicklistEntry spe : picklistValues){
            returnedOptions.add(spe.getValue());
        }
        return returnedOptions;
    }
    
    // function to return language options for CustomerRequestPage
    @AuraEnabled
    public static List<String> getDoctorLanguages(String doctorId){
        Contact doctor = [SELECT Id, Language__c FROM Contact WHERE Id=:doctorId LIMIT 1];
        return doctor.Language__c.split(';');
    }
}