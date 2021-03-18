public with sharing class timer 
{
    @AuraEnabled(cacheable=true)
    public static String getOppData(Id recId)
    {
        // validate input
        System.assert(recId != null);

        Schema.SObjectType sObjectType = recId.getSObjectType();
        String objType = String.valueOf(sObjectType);
        System.debug('objType'+objType);
        try 
        {
            String query = 'SELECT Expiry_Date__c FROM '+ objType +' WHERE Id=' + '\'' + recId + '\'' + ' Limit 1';
            SObject records = Database.query( query );
            String str = JSON.serialize(records);
            return str;

        } catch(Exception e) 
        {
            System.debug(e);
            return 'Error';
        }
        
    }
}