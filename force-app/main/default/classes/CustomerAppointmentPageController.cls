public class CustomerAppointmentPageController {
	@AuraEnabled
    public static void requestAppointment(Appointment__c app){
        insert app;
    }
}