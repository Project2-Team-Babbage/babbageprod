public class DataFactory{
    enum UserType {Doctor,Customer}
    string[] LastNameList=new List<String>{
        'Smith','Johnson','Williams',
        'Jones','Brown','Davis',
        'Miller','Wilson','Moore',
        'Taylor','Anderson','Thomas',
        'Hall','Allen','Young',
        'Hernandaz','Sanchez','Morris'
    };
    string[] FirstNameMaleList=new List<String>{
        'James','John','Robert',
        'Michael','William','David',
        'Richard','Joseph','Thomas',
        'Charles','Christopher','Daniel'
    };
    string[] FirstNameFemaleList=new List<String>{
        'Mary','Patricia','Jennifer',
        'Linda','Elizabeth','Barbara',
        'Susan','Jessica','Sarah',
        'Karen','Nancy','Margaret'
    };

    //includes Washington DC as DC
    string[] StateList=new List<String>{
        'AL','AK','AZ','AR','CA',
        'CO','CT','DE','DC','FL',
        'GA','HI','ID','IL','IN',
        'IA','KS','KY','LA','ME',
        'MD','MA','MI','MN','MS',
        'MO','MT','NE','NV','NH',
        'NJ','NM','NY','NC','ND',
        'OH','OK','OR','PA','RI',
        'SC','SD','TN','TX','UT',
        'VT','VA','WA','WV','WI','WY'
    };

    string[] StreetNameList=new List<String>{
        'Generic st',
        'Boring rd',
        'Sample st',
    };

    string[] CityList=new List<String>{
        'GenericVille',
        'BoringTown',
        'SampleWay'
    };

    public static void CreateAll(integer n){
        CreateOfficeLocations(n);
        CreateContacts(n);
        CreateAppointments(n);
        CreateSearches(n);
        CreateDoctorsSurveys(n);
        CreateOfficeSurveys(n);        
    }
    public static void CreateUserAccounts(integer n, UserType type){
        ID profileID= [SELECT ID FROM Profile WHERE Name='Babbage Customer User' LIMIT 1].ID;
        if(type==UserType.Doctor){
            User u=new User();
            u.profileID=profileID;
        }
        else if(type==UserType.Customer){

        }
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