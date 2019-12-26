global class DoctorAppointmentController {
	@auraEnabled
    global static List<Appointment__c[]> getAppointmentsByDay(DateTime startDay, Datetime endDay){
        List<Appointment__c[]> appointments = new List<Appointment__C[]>();
        appointments.add([SELECT customer__r.Name, Start_time__c, Description__c, Language_Preference__c, residence__r.office_location__r.Name FROM Appointment__c WHERE DAY_IN_WEEK(Start_time__c)=1 AND Start_time__c>=:startDay AND Start_Time__C<=:EndDay ORDER BY Start_time__c]);
        appointments.add([SELECT customer__r.Name, Start_time__c, Description__c, Language_Preference__c, residence__r.office_location__r.Name FROM Appointment__c WHERE DAY_IN_WEEK(Start_time__c)=2 AND Start_time__c>=:startDay AND Start_Time__C<=:EndDay ORDER BY Start_time__c]);
        appointments.add([SELECT customer__r.Name, Start_time__c, Description__c, Language_Preference__c, residence__r.office_location__r.Name FROM Appointment__c WHERE DAY_IN_WEEK(Start_time__c)=3 AND Start_time__c>=:startDay AND Start_Time__C<=:EndDay ORDER BY Start_time__c]);
        appointments.add([SELECT customer__r.Name, Start_time__c, Description__c, Language_Preference__c, residence__r.office_location__r.Name FROM Appointment__c WHERE DAY_IN_WEEK(Start_time__c)=4 AND Start_time__c>=:startDay AND Start_Time__C<=:EndDay ORDER BY Start_time__c]);
        appointments.add([SELECT customer__r.Name, Start_time__c, Description__c, Language_Preference__c, residence__r.office_location__r.Name FROM Appointment__c WHERE DAY_IN_WEEK(Start_time__c)=5 AND Start_time__c>=:startDay AND Start_Time__C<=:EndDay ORDER BY Start_time__c]);
        appointments.add([SELECT customer__r.Name, Start_time__c, Description__c, Language_Preference__c, residence__r.office_location__r.Name FROM Appointment__c WHERE DAY_IN_WEEK(Start_time__c)=6 AND Start_time__c>=:startDay AND Start_Time__C<=:EndDay ORDER BY Start_time__c]);
        appointments.add([SELECT customer__r.Name, Start_time__c, Description__c, Language_Preference__c, residence__r.office_location__r.Name FROM Appointment__c WHERE DAY_IN_WEEK(Start_time__c)=7 AND Start_time__c>=:startDay AND Start_Time__C<=:EndDay ORDER BY Start_time__c]);
        return appointments;
    }
}