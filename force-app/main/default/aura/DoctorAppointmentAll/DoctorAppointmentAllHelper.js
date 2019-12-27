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
                let responseData=response.getReturnValue();
                
                //copy fields to base level for lightning datatable
                for(let i=0;i<responseData.length;i++){
                    responseData[i].Customer_Name=responseData[i].Customer__r.Name;
                    responseData[i].Customer_Phone=responseData[i].Customer__r.Phone;
                    responseData[i].Office_Name=responseData[i].Residence__r.Office_Location__r.Name;
                }
                console.log(responseData);
                component.set(list,responseData);
                
            }
        });
        $A.enqueueAction(func);
    },
    sortData : function(component, field, direction, list){
        let table=component.get(list);
        let reverseDirection = direction !== 'asc';
        table.sort(this.sortBy(field,reverseDirection));
        component.set(list,table);
    },
    //function by developer.salesforce.com
    sortBy: function (field, reverse, primer) {
        var key = primer ?
            function(x) {return primer(x[field])} :
        function(x) {return x[field]};
        //checks if the two rows should switch places
        reverse = !reverse ? 1 : -1;
        return function (a, b) {
            return a = key(a), b = key(b), reverse * ((a > b) - (b > a));
        }
    }
})