trigger SuccessMilestoneTrigger on Success_Milestone__c (before insert, before update) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert || Trigger.isUpdate) {
            // Validate milestone dates
            for (Success_Milestone__c milestone : Trigger.new) {
                if (milestone.Target_Date__c < Date.today()) {
                    milestone.addError('Target Date cannot be in the past');
                }
            }
        }
    }
}