({
	getFilters : function(component, attribute) {
        let func= component.get('c.getAppointmentFilters');
        func.setCallback(this,function(response){
            if(response.getState()=="SUCCESS"){
                component.set(attribute,response.getReturnValue());
            }  
        });
        $A.enqueueAction(func);
        
	},
    updateAppointments : function (component, filter, list){
            let func=component.get('c.getAppointmentsByStatus');
        func.setParams({'Filter':component.find(filter).get('v.value')});
        func.setCallback(this,function(response){
            if(response.getState()=="SUCCESS"){
                component.set(list,response.getReturnValue());
            }
        });
        $A.enqueueAction(func);
}
})