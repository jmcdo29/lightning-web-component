public with sharing class AccountController {
    public AccountController() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getRelatedContacts(Id searchId) {
        return [
            SELECT
                Name
                ,Title
                ,Email
                ,Phone
            FROM Contact
            WHERE id = :searchId
            WITH SECURITY_ENFORCED
        ];
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [
            SELECT
                Name
                ,AnnualRevenue
                ,Industry
            FROM Account
            WITH SECURITY_ENFORCED
            ORDER BY Name
        ];
    }
}
