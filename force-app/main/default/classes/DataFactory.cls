public class DataFactory{
    enum UserType {Doctor,Customer}
    static string defaultEmail='test@test.com';
    static string[] LastNameList=new List<String>{
        'Smith','Johnson','Williams',
        'Jones','Brown','Davis',
        'Miller','Wilson','Moore',
        'Taylor','Anderson','Thomas',
        'Hall','Allen','Young',
        'Hernandaz','Sanchez','Morris'
    };
    static string[] FirstNameMaleList=new List<String>{
        'James','John','Robert',
        'Michael','William','David',
        'Richard','Joseph','Thomas',
        'Charles','Christopher','Daniel'
    };
    static string[] FirstNameFemaleList=new List<String>{
        'Mary','Patricia','Jennifer',
        'Linda','Elizabeth','Barbara',
        'Susan','Jessica','Sarah',
        'Karen','Nancy','Margaret'
    };

    //includes Washington DC as DC
    static string[] StateList=new List<String>{
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

    static string[] StreetNameList=new List<String>{
        'Generic st',
        'Boring rd',
        'Sample st'
    };

    static string[] CityList=new List<String>{
        'GenericVille',
        'BoringTown',
        'SampleWay'
    };

    static string[] OfficeNameList=new List<String>{
        'Generic Plus',
        'Boring Central',
        'Sample Office'
    };

    public static void CreateAll(integer n){
        CreateOfficeLocations(n);
        CreateContacts(n);
        CreateAppointments(n);
        CreateSearches(n);
        CreateDoctorsSurveys(n);
        CreateOfficeSurveys(n);        
    }
    public static void CreateUsers(integer n, UserType type){
        ID profileID= [SELECT ID FROM Profile WHERE Name='Babbage Customer User' LIMIT 1].ID;
        Account userAccount=[SELECT ID FROM Account WHERE name=':type.name() Account' LIMIT 1];
        if(userAccount==null)
        {
            userAccount=new Account();
            userAccount.name=type.Name()+' Account';
            insert userAccount;
        }

        List<Contact> insertList=new List<Contact>();
        for(integer i=0;i<n;i++){
            User u=new User();
            u.profileID=profileID;
            u.email=defaultEmail;
            u.LastName=LastNameList[Integer.valueof(Math.random()*LastNameList.size())];
            //u.FirstName=FirstNameMaleList[Integer.valueof(Math.random()*FirstNameMaleList.size())];
            if(type==UserType.Doctor){


            }
            else if(type==UserType.Customer){

            }
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
        List<Office_Location__c> officeList=new List<Office_Location__c>();
        for (integer i=0;i<n;i++){
            Office_Location__c office = new Office_Location__c();
            office.street_address__c=Integer.valueof((Math.Random()*9999))+' '+
                StreetNameList[Integer.valueof(Math.Random()*StreetNameList.size())];
            office.Name=OfficeNameList[Integer.valueof(Math.Random()*OfficeNameList.size())];
            office.city__c=CityList[Integer.valueof(Math.Random()*CityList.size())];
            office.State__c=StateList[Integer.valueof(Math.Random()*StateList.size())];
            office.zip_code__c=String.valueof(Integer.valueof(Math.Random()*99999));
            office.phone__c=(Math.mod(Integer.valueof(Math.Random()*999),899)+100)+'-'+
                (Math.mod(Integer.valueof(Math.Random()*999),899)+100)+'-'+
                (Math.mod(Integer.valueof(Math.Random()*9999),8999)+1000);
                
            officeList.add(office);
        }
        insert officeList;
    }
    public static void CreateResidences(integer n, ID doctorID){
        //get doc list
        //get office list

    }
    public static void CreateOfficeSurveys(integer n){

    }
    public static void CreateDoctorsSurveys(integer n){

    }
    public static void CreateSearches(integer n){

    }
    public static void DeleteAllRecords(){
        DELETE [SELECT ID FROM Office_Location__c];
    }
}