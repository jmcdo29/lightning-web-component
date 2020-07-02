public with sharing class ContactController {
    public ContactController() {

    }
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {
        // uncomment the following line for the final challenge
        // throw new AuraHandledException('Forced error');
        // comment this return for the final challenge
        return [
            SELECT
                FirstName
                ,LastName
                ,Email
            FROM Contact
            WITH SECURITY_ENFORCED
            ORDER BY FirstName
        ];
    }
}
