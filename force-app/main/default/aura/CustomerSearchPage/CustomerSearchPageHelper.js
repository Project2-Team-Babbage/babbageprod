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
                var returnedOptions = response.getReturnValue();
                var selectOptions = [];
                var i;
                for(i = 0; i < returnedOptions.length; i++){
                    selectOptions.push({value:returnedOptions[i], 
                                        label:returnedOptions[i]});
                }
                component.set("v.languageOptions", selectOptions);
            }
        })
        
        // enqueue all the actions
        $A.enqueueAction(genderSelect);
        $A.enqueueAction(specializationSelect);
        $A.enqueueAction(languageDual);
	},
    
    helperHandleSearch : function(component){
        // validate and populate search object
        // fields needed
        // language__c
        // sex__c
        // specialization__c
        // contact__c
        
    }
})