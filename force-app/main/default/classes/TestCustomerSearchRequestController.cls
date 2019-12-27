@isTest
public class TestCustomerSearchRequestController {
    @isTest static void testReturnMatchingDoctors(){
        // test with no specifications, gender specified, language specified, specialization specified
        String male = 'Male';
        String spanish = 'Spanish';
        String proctologist = 'Proctologist';
        String generalTest = 'SELECT Id FROM Residence__c';
        String genderTest = 'SELECT Id FROM Residence__c WHERE Doctor__r.Sex__c=\'' + male + '\'';
        String languageTest = 'SELECT Id FROM Residence__c WHERE Doctor__r.Language__c INCLUDES(\'' +
            spanish + '\')';
        String specializationTest = 'SELECT Id FROM Residence__c WHERE Doctor__r.Specialization__c=\'' +
            proctologist + '\'';
        List<Residence__c> generalResults = CustomerSearchRequestPageController.returnMatchingDoctors(
            generalTest);
        List<Residence__c> genderResults = CustomerSearchRequestPageController.returnMatchingDoctors(
            genderTest);
        List<Residence__c> languageResults = CustomerSearchRequestPageController.returnMatchingDoctors(
            languageTest);
        List<Residence__c> specializationResults = CustomerSearchRequestPageController.returnMatchingDoctors(
            specializationTest);
        Id expectedId = [SELECT Id FROM Residence__c LIMIT 1].Id;
        System.assertEquals(expectedId, generalResults[0].Id);
        System.assertEquals(expectedId, genderResults[0].Id);
        System.assertEquals(expectedId, languageResults[0].Id);
        System.assertEquals(expectedId, specializationResults[0].Id);
    }
    
    @isTest static void testInsertSearchRecord(){
        // test insertion of search record
        Contact testCustomer = [SELECT Id FROM Contact WHERE Name='Test Customer' LIMIT 1];
        Search__c testSearch = new Search__c(Contact__c=testCustomer.Id);
        CustomerSearchRequestPageController.insertSearchRecord(testSearch);
        testSearch = [SELECT Id, Contact__c FROM Search__c LIMIT 1];
        System.assertEquals(testCustomer.Id, testSearch.Contact__c);
    }
    
    @isTest static void testGetGenderOptions(){
        // returned options should be male and female
        List<String> expectedGenderOptions = new List<String>();
        expectedGenderOptions.add('Male');
        expectedGenderOptions.add('Female');
        List<String> actualGenderOptions = CustomerSearchRequestPageController.getGenderOptions();
        System.assertEquals(expectedGenderOptions, actualGenderOptions);
    }
    
    @isTest static void testGetSpecializationOptions(){
        // returned options should be Cardiologist, Chiropractor, General Practitioner, Oncologist,	OBGYN,
        // and Proctologist
        List<String> expectedSpecializationOptions = new List<String>();
        expectedSpecializationOptions.add('Cardiologist');
        expectedSpecializationOptions.add('Chiropractor');
        expectedSpecializationOptions.add('General Practitioner');
        expectedSpecializationOptions.add('Oncologist');
        expectedSpecializationOptions.add('OBGYN');
        expectedSpecializationOptions.add('Proctologist');
        List<String> actualSpecializationOptions = 
            CustomerSearchRequestPageController.getSpecializationOptions();
        System.assertEquals(expectedSpecializationOptions, actualSpecializationOptions);
    }
    
    @isTest static void testGetLanguageOptions(){
        // returned options should be English, Spanish, French, and Chinese
        List<String> expectedLanguageOptions = new List<String>();
        expectedLanguageOptions.add('English');
        expectedLanguageOptions.add('Spanish');
        expectedLanguageOptions.add('French');
        expectedLanguageOptions.add('Chinese');
        List<String> actualLanguageOptions = CustomerSearchRequestPageController.getLanguageOptions();
        System.assertEquals(expectedLanguageOptions, actualLanguageOptions);
    }
    
    @isTest static void testGetDoctorLanguages(){
        // returned languages should be English and Spanish
        List<String> expectedLanguages = new List<String>();
        expectedLanguages.add('English');
        expectedLanguages.add('Spanish');
        Contact testDoctor = [SELECT Id FROM Contact WHERE LastName='Doctor' LIMIT 1];
        List<string> actualLanguages = CustomerSearchRequestPageController.getDoctorLanguages(testDoctor.Id);
        System.assertEquals(expectedLanguages, actualLanguages);
    }
    
    @testSetup static void testFactory(){
        // insert a doctor to test their languages
        Account testAccount = new Account(Name='Test');
        insert testAccount;
        testAccount = [SELECT Id FROM Account WHERE Name='Test' LIMIT 1];
        //RecordType doctor = New RecordType(Name='Doctor', sObjectType='Contact');
        //insert doctor;
		Id recordTypeId=[SELECT ID FROM RecordType WHERE Name='Doctor' and sObjectType='Contact' LIMIT 1].Id;
        Contact testDoctor = new Contact(AccountId=testAccount.Id, FirstName='Test', LastName='Doctor', 
                                         Sex__c='Male', Specialization__c='Proctologist', 
                                         Email='test@gmail.com', Language__c='English;Spanish', RecordTypeId=recordTypeId);
        insert testDoctor;
        
        // insert a residence to test the function that returns matching doctors
        Office_Location__c testOffice = new Office_Location__c(Name='Test', Zip_Code__c=12345, State__c='PA',
                                                               City__c='Meadville', 
                                                               Street_Address__c='12345 Way');
        insert testOffice;
        testOffice = [SELECT Id FROM Office_Location__c WHERE Name='Test' LIMIT 1];
        testDoctor = [SELECT Id FROM Contact WHERE Name='Test Doctor' LIMIT 1];
        Residence__c testResidence = new Residence__c(Doctor__c=testDoctor.Id, 
                                                      Office_Location__c=testOffice.Id);
        insert testResidence;
        
        // insert a customer to test the function that inserts search records
        recordTypeId=[SELECT ID FROM RecordType WHERE Name='Customer' and sObjectType='Contact' LIMIT 1].Id;
        Contact testCustomer = new Contact(AccountId=testAccount.Id, Email='test@gmail.com', 
                                           FirstName='Test', LastName='Customer', RecordTypeId=recordTypeId);
        insert testCustomer;
    }
}