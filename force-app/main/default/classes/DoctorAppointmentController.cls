global class DoctorAppointmentController {
	@auraEnabled
    global static List<Appointment__c[]> getAppointmentsByDay(){
        List<Appointment__c[]> appointments = new List<Appointment__C[]>();
        appointments.add([SELECT customer__r.Name, Start_time__c, Description__c, Language_Preference__c, residence__r.office_location__r.Name FROM Appointment__c WHERE DAY_IN_WEEK(Start_time__c)=1 ORDER BY Start_time__c]);
        appointments.add([SELECT customer__r.Name, Start_time__c, Description__c, Language_Preference__c, residence__r.office_location__r.Name FROM Appointment__c WHERE DAY_IN_WEEK(Start_time__c)=2 ORDER BY Start_time__c]);
        appointments.add([SELECT customer__r.Name, Start_time__c, Description__c, Language_Preference__c, residence__r.office_location__r.Name FROM Appointment__c WHERE DAY_IN_WEEK(Start_time__c)=3 ORDER BY Start_time__c]);
        appointments.add([SELECT customer__r.Name, Start_time__c, Description__c, Language_Preference__c, residence__r.office_location__r.Name FROM Appointment__c WHERE DAY_IN_WEEK(Start_time__c)=4 ORDER BY Start_time__c]);
        appointments.add([SELECT customer__r.Name, Start_time__c, Description__c, Language_Preference__c, residence__r.office_location__r.Name FROM Appointment__c WHERE DAY_IN_WEEK(Start_time__c)=5 ORDER BY Start_time__c]);
        appointments.add([SELECT customer__r.Name, Start_time__c, Description__c, Language_Preference__c, residence__r.office_location__r.Name FROM Appointment__c WHERE DAY_IN_WEEK(Start_time__c)=6 ORDER BY Start_time__c]);
        appointments.add([SELECT customer__r.Name, Start_time__c, Description__c, Language_Preference__c, residence__r.office_location__r.Name FROM Appointment__c WHERE DAY_IN_WEEK(Start_time__c)=7 ORDER BY Start_time__c]);
        return appointments;
    }
}