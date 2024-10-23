public with sharing class SuccessMilestoneService {
    public static void validateMilestones(List<Success_Milestone__c> milestones) {
        for (Success_Milestone__c milestone : milestones) {
            if (milestone.Target_Date__c < Date.today()) {
                milestone.addError('Target Date cannot be in the past');
            }
        }
    }
    
    public static List<Success_Milestone__c> getMilestonesByCustomerSuccess(Id customerSuccessId) {
        return [
            SELECT Id, Name, Status__c, Target_Date__c
            FROM Success_Milestone__c
            WHERE Customer_Success_Record__c = :customerSuccessId
            ORDER BY Target_Date__c ASC
        ];
    }
}