({
	init : function(component, event, helper) {
		let appointmentByDay=component.get('c.getAppointmentsByDay');
        appointmentByDay.setCallback(this, function(response){
            if(response.getState()=="SUCCESS"){
                component.set("v.appointments",response.getReturnValue());
            }
        });
        let now=new Date();
        let start=new Date();
        let end=new Date();
        start.setHours(0,0,0,0);
        end.setHours(23,59,59,999);
        component.set('v.timeFrameStart',start.setDate(now.getDate()-now.getDay()));
        component.set('v.timeFrameEnd',end.setDate(now.getDate()+(7-now.getDay()-1)));
        $A.enqueueAction(appointmentByDay);
    }
})