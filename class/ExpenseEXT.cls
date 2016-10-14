public with sharing class ExpenseEXT {
    public expense__c expObj{get;set;}
    public List<expense_members__c> memExp{get;set;}

    public ExpenseEXT(ApexPages.StandardController controller) {
        expObj = (expense__c)controller.getRecord();
        memExp = getExpMembers();
    }
    
    public List<expense_members__c> getExpMembers(){
        return [Select contribution_amount__c,Member__r.Name from expense_members__c where expenses__c =: expObj.Id];
    }
}