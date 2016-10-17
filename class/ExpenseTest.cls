@isTest

public class ExpenseTest {
 public testMethod static void myTest(){
      
        expense__c expense = new expense__c();
        expense.Amount__c=1000;
        expense.event__c='party';
        expense.Date__c=date.parse('10/14/2016');
        //expense.total_contributed__c='100';
        insert expense;
        Member__c member = new Member__c();
        member.Name='abc';
        member.Email_address__c='abc@abc.com';
        insert member;
        expense_members__c expmem = new expense_members__c();
        expmem.Member__c=member.Id;
        expmem.expenses__c=expense.Id;
        expmem.contribution_amount__c=100;
        insert expmem;
        ExpenseEXT expExt = new ExpenseEXT(new ApexPages.StandardController(expense));
        
        List<expense_members__c> ge = new List<expense_members__c>();
        ge = expExt.getExpMembers();
        //Expense__c expense1 = new Expense__c();
        //expense1 
        //List<ExpenseMember__c> ge1 = new List<ExpenseMember__c>();
        //ge1.add(expense);
        //System.assertEquals(ge1,ge);
}
}