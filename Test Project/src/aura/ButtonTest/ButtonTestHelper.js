({
	getRecord : function() {
        
        var action = component.get("c.getdata");

        action.setParams({
            title : component.get("v.title")
        });
        action.setCallback(this, function(a) {
            if (a.getState() === "SUCCESS") {
                component.set("v.title", a.getReturnValue());
            } else if (a.getState() === "ERROR") {
                $A.log("Errors", a.getError());
            }
        });
        
        $A.enqueueAction(action);
    }
})