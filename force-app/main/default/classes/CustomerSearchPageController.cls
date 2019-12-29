public class CustomerSearchPageController {
 @AuraEnabled
    public static List<Contact> dsearch(string searchquery){
        return Database.query(searchquery);
        
    }
  
    
   
    
    
}