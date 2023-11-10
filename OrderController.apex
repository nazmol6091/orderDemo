public with sharing class OrderController {


    @AuraEnabled(cacheable=true)
    public static ResponseBody getOrdersList(String orderId) {
        
        //getting JSON response here for deserialize
        String json = getMockJSONresponse(orderId);

        ResponseBody responseBody = (ResponseBody)System.JSON.deserialize(json, ResponseBody.class);

        System.debug('responseBody: ' + responseBody);
        System.debug('responseBody2: ' + responseBody);

        return responseBody;
    }
    
    // Mock example of possible JSON response from another system
    public static String getMockJSONresponse(String orderId) {
        return '{"Status":"200",'
        +'"Message":"Order Items are successfully created in the External System with next Data. ",'
        //+'"OrderNumber":"00000100",'
        +'"OrderItems":['
        +'{"ExternalOrderId":"ORDER-IT-145237","Name":"Screen size 21 inch", "Family": "Hardware","SKU":"card-rts-21","OrderDate":"1547250828000"},'
        +'{"ExternalOrderId":"ORDER-IT-612753","Name":"Full HD Screen with 51 inch", "Family": "Hardware","SKU":"card-rtp-51","OrderDate":"1547250828000"}'
        +']}';
 // here

// New logic

    }

    // Wrapper Class for Respone which contains info about Order and list of Order Items
    public class ResponseBody {
        @AuraEnabled public String status;
        @AuraEnabled public String message;
        @AuraEnabled public String orderNumber;
        @AuraEnabled public List<OrderItem> orderItems;
    }

    // Wrapper Class for each Order Item record with all details
    public class OrderItem {
        @AuraEnabled public String externalOrderId;
        @AuraEnabled public String name;
        @AuraEnabled public String family;
        @AuraEnabled public String sku;
        @AuraEnabled public String orderDate;
    }
    
    
}
