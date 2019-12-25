({
	helperLoadOptions : function(component) {
        // populate gender options select
		var genderSelect = component.get("c.getGenderOptions");
        genderSelect.setCallback(this, function(response) {
            if(response.getState() === "SUCCESS"){
                component.set("v.genderOptions", response.getReturnValue());
            }
        });
        
        // populate specialization options select
        var specializationSelect = component.get("c.getSpecializationOptions");
        specializationSelect.setCallback(this, function(response){
            if(response.getState() === "SUCCESS"){
                component.set("v.specializationOptions", response.getReturnValue())
            }
        });
        
        // populate language options dual list
        var languageDual = component.get("c.getLanguageOptions");
        languageDual.setCallback(this, function(response){
            if(response.getState() === "SUCCESS"){
                console.log(JSON.serialize(response.getReturnValue));
                //component.set("v.languageOptions", response.getReturnValue());
            }
        })
        
        // enqueue all the actions
        $A.enqueueAction(genderSelect);
        $A.enqueueAction(specializationSelect);
        $A.enqueueAction(languageDual);
	}
})