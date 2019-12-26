//This Controller will Query the information in the custom Object:
//Appointment__c; The Status__c
public class CustomerAppointmentController {
	/**Need to write method that will query the Appointment__c Object
	then pull the picklist value of the Status__c field to inform
	the cusomer on the status of the appointment they requested**/
    
    @AuraEnabled
    public static List<Appointment__c> getAppointmentStatus(){
        List<Appointment__c> appointments = [SELECT Name FROM Appointment__c];
        /**I still need the following pieces of information: 
         * Residence.Office_Location_c.Full_address_c, Doctor_r.Name,
           Start_time_c, End_time_c, Status_c, Doctor_message_c**/
        return appointments;
    }
}