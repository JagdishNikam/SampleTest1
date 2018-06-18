({
    updateChildAttr: function(cmp) {
        cmp.set("v.parentAttr", "updated child attribute");
    },
    onChildAttrChange: function(cmp, evt) {
        console.log("childAttr has changed");
        console.log("old value: " + evt.getParam("oldValue"));
        console.log("current value: " + evt.getParam("value"));
    }
})