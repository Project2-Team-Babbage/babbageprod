({
	init : function(component, event, helper) {
		helper.getFilters(component, "v.FilterOptions");
        
        component.set("v.AppointmentsColumns", 
        [{ label: 'Start time', fieldName: 'Start_Time__c', Type: 'DateTime'},
          {label: 'End time', fieldName: 'End_Time__c', Type:'Datetime'},
         {label: 'Status', fieldName: 'Status__c', Type:'String'}]);
        
        helper.updateAppointments(component, "filterselect", "v.AppointmentsList");
	},
    updateAppointments: function(component,event,helper){
        helper.updateAppointments(component, "filterselect", "v.AppointmentsList");
    }
})