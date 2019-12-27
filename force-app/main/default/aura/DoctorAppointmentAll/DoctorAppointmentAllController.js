({
    init : function(component, event, helper) {
        helper.getFilters(component, "v.FilterOptions");
        
        component.set("v.AppointmentsColumns", 
                      [{label:'Patient Name', fieldName:'Customer_Name', type: 'string', sortable:true},
                       {label:'Appointment Description',fieldName:'Description__c', type: 'string'},
                       {label:'Language Preference', fieldName:'Language_Preference__c', type: 'string', sortable:true},
                       {label:'Your Message', fieldName:'Doctor_Message__c',type:'string'},
                       {label:'Appointment Office', fieldName:'Office_Name',type: 'string', sortable:true},     
                       {label: 'Start time', fieldName: 'Start_Time__c', type: 'date', typeAttributes:{
                           year: "2-digit",
                           month: "numeric",
                           day: "2-digit",
                           hour: "2-digit",
                           minute: "2-digit",
                           hour12: true
                       }, sortable:true},
                       {label: 'End time', fieldName: 'End_Time__c', type:'date', typeAttributes:{
                           year: "2-digit",
                           month: "numeric",
                           day: "2-digit",
                           hour: "2-digit",
                           minute: "2-digit",
                           hour12: true
                       }, sortable:true},
                       {label: 'Status', fieldName: 'Status__c', Type:'String', sortable:true},
                       {label: 'Phone Number', fieldName:'Customer_Phone', Type:'phone', sortable:true}
                      ]);
        component.find('filterselect').set('v.value','All');
        helper.updateAppointments(component, "filterselect", "v.AppointmentsList");
    },
    updateAppointments: function(component,event,helper){
        
        helper.updateAppointments(component, "filterselect", "v.AppointmentsList");
    },
    refreshAppointments: function(component,event,helper){
        component.set('v.AppointmentsList',null);
        helper.updateAppointments(component, "filterselect", "v.AppointmentsList");
    },
    updateSort: function(component,event,helper){
        let field=event.getParam('fieldName');
        let direction=event.getParam('sortDirection');
        component.set("v.SortCategory",field);
        component.set("v.SortDirection",direction);
        helper.sortData(component,field,direction, "v.AppointmentsList");
    }
})