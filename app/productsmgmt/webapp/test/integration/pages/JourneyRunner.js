sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/demo/productsmgmt/test/integration/pages/ProductsList",
	"com/demo/productsmgmt/test/integration/pages/ProductsObjectPage"
], function (JourneyRunner, ProductsList, ProductsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/demo/productsmgmt') + '/test/flp.html#app-preview',
        pages: {
			onTheProductsList: ProductsList,
			onTheProductsObjectPage: ProductsObjectPage
        },
        async: true
    });

    return runner;
});

