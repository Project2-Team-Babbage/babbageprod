({
    updateAppointment: function(component, row){
        let func=component.get('c.updateAppointment');
        let draftValues=component.find("appointmentTable").get("v.draftValues")
        let updateValues=row;
        for(let i=0;i<draftValues.length;i++)
            if(draftValues[i].Id==row.Id)
            {
                draftValues[i].Status__c=updateValues.Status__c;
                updateValues=draftValues[i];
                component.find("appointmentTable").set("v.draftValues",draftValues.splice[i]);
                break;
            }
        func.setParams({'appointment':updateValues});
        func.setCallback(this,function(response){
            if(response.getState()=="SUCCESS"){
                this.updateAppointments(component);
            }
        });
        $A.enqueueAction(func);  
    },
    approveAppointment: function(component,row){
        row.Status__c='Confirmed';
        this.updateAppointment(component,row);
    },
    denyAppointment: function(component,row){
        row.Status__c='Rejected';
        this.updateAppointment(component,row);
    },
    getStatusList : function(component, attribute) {
        let func= component.get('c.getAppointmentStatusValues');
        func.setCallback(this,function(response){
            if(response.getState()=="SUCCESS"){
                component.set(attribute,response.getReturnValue());
            }  
        });
        $A.enqueueAction(func);
        
    },
    getRowActions: function(component,row,callback){
        let actions=[];
        let approve={
            'label':'Approve and Update',
            'iconName':'utility:check',
            'name':'approve'
        };
        let deny={
            'label':'Deny and Update',
            'iconName':'utility:close',
            'name':'deny'
        };
        let update={
            'label':'Update',
            'iconName':'utility:picklist_type',
            'name':'update'
        };
        if(row.Status__c!='Pending')
        {
            deny.disabled=true;
            approve.disabled=true;
        }
        actions.push(approve);
        actions.push(deny);
        actions.push(update);
        
        setTimeout($A.getCallback(function () {
            callback(actions);
        }), 10);
    },
    updateAppointments : function (component){
        let func=component.get('c.getAppointmentsByStatus');
        func.setParams({'Status':component.find('statusselect').get('v.value'),
                        'TimeFrame':component.find('timeselect').get('v.value'),
                        'Period':component.find('periodselect').get('v.value')});
        func.setCallback(this,function(response){
            if(response.getState()=="SUCCESS"){
                let responseData=response.getReturnValue();
                
                //copy fields to base level for lightning datatable
                for(let i=0;i<responseData.length;i++){
                    responseData[i].Customer_Name=responseData[i].Customer__r.Name;
                    responseData[i].Customer_Phone=responseData[i].Customer__r.Phone;
                    responseData[i].Office_Name=responseData[i].Residence__r.Office_Location__r.Name;
                }
                component.set('v.AppointmentsList',responseData);
                
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