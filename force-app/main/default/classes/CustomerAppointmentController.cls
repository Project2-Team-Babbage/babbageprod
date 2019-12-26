//This Controller will Query the information in the custom Object:
//Appointment__c; The Status__c
public class CustomerAppointmentController {
    
    @AuraEnabled
    public static List<Appointment__c> getAppointmentConfirmed(){
        List<Appointment__c> appointments = [SELECT Name, Doctor__c, Residence__c, Start_Time__c, End_Time__c, Status__c, 
                                             Doctor_Message__c FROM Appointment__c WHERE Status__c = 'Confirmed'];
        /**I still need the following pieces of information: 
         * Residence.Office_Location_c.Full_address_c, Doctor_r.Name,
           Start_time_c, End_time_c, Status_c, Doctor_message_c**/
        return appointments;
    }
    
    @AuraEnabled
    public static List<Appointment__c> getAppointmentPending(){
        List<Appointment__c> appointments = [SELECT Name, Doctor__c, Residence__c, Start_Time__c, End_Time__c, Status__c, 
                                             Doctor_Message__c FROM Appointment__c WHERE Status__c = 'Pending'];
        /**I still need the following pieces of information: 
         * Residence.Office_Location_c.Full_address_c, Doctor_r.Name,
           Start_time_c, End_time_c, Status_c, Doctor_message_c**/
        return appointments;
    }
    
    @AuraEnabled
    public static List<Appointment__c> getAppointmentRescheduled(){
        List<Appointment__c> appointments = [SELECT Name, Doctor__c, Residence__c, Start_Time__c, End_Time__c, Status__c, 
                                             Doctor_Message__c FROM Appointment__c WHERE Status__c = 'Rescheduled'];
        /**I still need the following pieces of information: 
         * Residence.Office_Location_c.Full_address_c, Doctor_r.Name,
           Start_time_c, End_time_c, Status_c, Doctor_message_c**/
        return appointments;
    }
    
    @AuraEnabled
    public static List<Appointment__c> getAppointmentRejected(){
        List<Appointment__c> appointments = [SELECT Name, Doctor__c, Residence__c, Start_Time__c, End_Time__c, Status__c, 
                                             Doctor_Message__c FROM Appointment__c WHERE Status__c = 'Rejected'];
        /**I still need the following pieces of information: 
         * Residence.Office_Location_c.Full_address_c, Doctor_r.Name,
           Start_time_c, End_time_c, Status_c, Doctor_message_c**/
        return appointments;
    }
}