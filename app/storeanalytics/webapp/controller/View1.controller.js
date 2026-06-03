sap.ui.define([
    "sap/ui/core/mvc/Controller"
], (Controller) => {
    "use strict";

    return Controller.extend("com.demo.storeanalytics.controller.View1", {
        onInit() {
              var StoreWiseSalesChart = this.byId("StoreWiseSales");
            StoreWiseSalesChart.setVizProperties({
                plotArea:{
                    dataLabel:{
                        visible:true,
                        type:"value"
                    }
                },
                title:{
                    visible:true,
                    text:"Store Wise Sales"
                }
            });

            var ProductWiseSalesChart = this.byId("ProductWiseSales");
            ProductWiseSalesChart.setVizProperties({
                plotArea:{
                    dataLabel:{
                        visible:true,
                        type:"value"
                    }
                },
                title:{
                    visible:true,
                    text:"Product Wise Sales"
                }
            });

            var LowStockProducts = this.byId("LowStockProducts");
            LowStockProducts.setVizProperties({
                plotArea:{
                    dataLabel:{
                        visible:true,
                        type:"value"
                    }
                },
                title:{
                    visible:true,
                    text:"Low Stock Alert"
                }
            });

            var Top3Orders = this.byId("Top3Orders");
            Top3Orders.setVizProperties({
                plotArea:{
                    dataLabel:{
                        visible:true,
                        type:"value"
                    }
                },
                title:{
                    visible:true,
                    text:"Top 3 Orders"
                }
            })
 
 
        }
    });
});