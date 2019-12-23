public class DataFactory{

    public static void CreateAll(integer n){
        CreateUsers(n);
        CreateAccounts(n);
        CreateOfficeLocations(n);
        CreateContacts(n);
        CreateAppointments(n);
        CreateSearches(n);
        CreateDoctorsSurveys(n);
        CreateOfficeSurveys(n);        
    }
    public static void CreateUsers(integer n){

    }
    public static void CreateAccounts(integer n){

    }
    public static void CreateContacts(integer n){
        try{
            CreateDoctors(Integer.valueof(Math.Ceil(n/2)),2,true);
        }
        catch(exception e){
            System.assert(false,'Failed to create doctors: '+e.getMessage());
        }
        try{
            createCustomers(Integer.valueof(Math.Floor(n/2)));
        }
        catch(exception e){
            System.assert(false,'Failed to create customers: '+e.getMessagE());
        }
    }
    public static void CreateDoctors(integer n, integer numResidences, boolean randomNumResidences){

    }
    public static void CreateCustomers(integer n){

    }
    public static void CreateAppointments(integer n){

    }
    public static void CreateOfficeLocations(integer n){

    }
    public static void CreateResidences(integer n, ID doctorID){

    }
    public static void CreateOfficeSurveys(integer n){

    }
    public static void CreateDoctorsSurveys(integer n){

    }
    public static void CreateSearches(integer n){

    }
}