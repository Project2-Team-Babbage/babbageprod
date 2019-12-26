global class DoctorAppointmentController {
	@auraEnabled
    global static List<Appointment__c[]> getAppointmentsByDay(DateTime startDay, Datetime endDay){
        List<Appointment__c[]> appointments = new List<Appointment__C[]>();
        for(integer i=1;i<=7;i++)
        appointments.add([SELECT customer__r.Name, customer__r.email, Start_time__c, Description__c, Language_Preference__c, residence__r.office_location__r.Name FROM Appointment__c WHERE DAY_IN_WEEK(Start_time__c)=:i AND Start_time__c>=:startDay AND Start_Time__C<=:EndDay ORDER BY Start_time__c]);
        return appointments;
    }
}