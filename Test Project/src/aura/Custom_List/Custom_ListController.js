({
gotoList : function (component, event, helper) {
    var action = component.get("c.getListViews");
    console.log('I am in controller');
    action.setCallback(this, function(response){
        var state = response.getState();
        console.log('clicked');
        if (state === "SUCCESS") {
            var listviews = response.getReturnValue();
            var navEvent = $A.get("e.force:navigateToList");
            navEvent.setParams({
                "listViewId": listviews.Id,
                "listViewName": null,
                "scope": "Account"
            });
            navEvent.fire();
        }
    });
    $A.enqueueAction(action);
},
})