public class RestCallout {
    public static HttpResponse AddBasicAppointment(){
        Http http=new Http();
        HttpRequest request=new HttpRequest();
        request.setEndpoint('https://cunning-fox-e9s5yy-dev-ed.salesforce.com/services/data/v42.0/sobjects/Appointment__c');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        List<Contact> contactList= [SELECT ID FROM CONTACT LIMIT 2];
        List<Residence__c> res=[SELECT ID FROM Residence__c LIMIT 1];
        request.setBody('{"Start_Time":'+DateTime.now()+',"Customer":'+contactList[0].ID+
                        ',"Doctor":'+contactList[0].ID+',"Description":"None","Language":"English","Status":"Pending","Message":"Test","Residence":'+
                        res[0].ID+'}');
        HttpResponse response = http.send(request);
        if(response.getStatuscode()!=201){
            System.assert(false,'Insert failed'+response.getStatusCode()+response.getStatus());
        }
            return response;
    }
}