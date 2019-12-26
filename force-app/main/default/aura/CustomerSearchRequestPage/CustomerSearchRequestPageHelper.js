({
    helperHandleCustomerSearchResults : function(component, event) {
        // the event is carrying a list of residences that are going to be put into the
        // duallistbox in the MatchingDoctors component, but we're going to format
        // everything all pretty-like so that the options in the duallistbox look like
        // Doctor Name, Office Location Name
        var residencesList = event.getParam("matchingDoctorResidences");
        
        // declare and populate list of strings that will have elements in form
        // Doctor Name, Office Location Name
        var selectOptions = [];
        var i;
        var tempString = "";
        for(i = 0; i < residencesList.length; i++){
            tempString = residencesList[i].Doctor__r.Name + ", " + 
                residencesList[i].Office_Location__r.Name;
            selectOptions.push({value:residencesList[i].Id, 
                                label:tempString});
            tempString = "";
        }
        
        // set it in the component
        component.set("v.matchingDoctorsList", selectOptions);
    },
    
    helperHandleDoctorSelected : function(component, event) {
        // the event is carrying a string in the format Doctor Name, Office Location 
        // Name that is going to be put into the
        // record form in the CustomerRequestPage component, but we're going to format
        // everything all pretty-like so that the options in the duallistbox look like
        // Doctor Name, Office Location Name
    }
})