public class CustomerSearchRequestPageController{
    @AuraEnabled
    public static void requestAppointment(Appointment__c app){
        insert app;
    }

    @AuraEnabled
    public static List<Contact> dsearch(string searchquery){
        return Database.query(searchquery);  
    }
    
    @AuraEnabled
    public static List<String> getGenderOptions(){
        List<Schema.PicklistEntry> picklistValues = Contact.Sex__c.getDescribe().getPicklistValues();
        List<String> returnedOptions = new List<String>();
        for(Schema.PicklistEntry spe : picklistValues){
            returnedOptions.add(spe.getValue());
        }
        return returnedOptions;
    }
    
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
    
    @AuraEnabled
    public static List<Object> getLanguageOptions(){
        List<Schema.PicklistEntry> picklistValues = 
            Contact.Language__c.getDescribe().getPicklistValues();
        List<Object> returnedOptions = new List<Object>();
        Map<String, String> tempMap = new Map<String, String>();
        
        for(Schema.PicklistEntry spe : picklistValues){
            tempMap.put('label', spe.getLabel());
            tempMap.put('value', spe.getValue());
            returnedOptions.add(tempMap);
            tempMap = new Map<String, String>();
        }
        return returnedOptions;
        
  /*           <aura:attribute name="options" type="List" default="[
        { label: 'English', value: 'en' },
        { label: 'German', value: 'de' },
        { label: 'Spanish', value: 'es' },
        { label: 'French', value: 'fr' },
        { label: 'Italian', value: 'it' },
        { label: 'Japanese', value: 'ja' }]"/> */

    }
}