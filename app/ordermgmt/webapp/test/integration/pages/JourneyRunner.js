sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/demo/ordermgmt/test/integration/pages/OrdersList",
	"com/demo/ordermgmt/test/integration/pages/OrdersObjectPage",
	"com/demo/ordermgmt/test/integration/pages/OrderItemsObjectPage"
], function (JourneyRunner, OrdersList, OrdersObjectPage, OrderItemsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/demo/ordermgmt') + '/test/flp.html#app-preview',
        pages: {
			onTheOrdersList: OrdersList,
			onTheOrdersObjectPage: OrdersObjectPage,
			onTheOrderItemsObjectPage: OrderItemsObjectPage
        },
        async: true
    });

    return runner;
});

