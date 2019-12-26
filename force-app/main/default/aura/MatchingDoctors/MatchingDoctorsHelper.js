({
	helperHandleChange : function(component) {
		// fire an event that will update the selectedDoctor aura attribute in 
		// CustomerSearchRequestPage
		var changeEvent = component.getEvent("doctorSelected");
        changeEvent.setParams({"selectedDoctor" : component.get("v.chosenDoctor")});
        changeEvent.fire();
	}
})