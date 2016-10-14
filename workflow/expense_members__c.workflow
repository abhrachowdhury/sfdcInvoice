<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>email</fullName>
        <description>email</description>
        <protected>false</protected>
        <recipients>
            <field>email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/letterhead_email</template>
    </alerts>
    <alerts>
        <fullName>emailsend</fullName>
        <description>emailsend</description>
        <protected>false</protected>
        <recipients>
            <field>email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/expensedetails</template>
    </alerts>
    <fieldUpdates>
        <fullName>Email_Field_Update</fullName>
        <field>email__c</field>
        <formula>Member__r.Email_address__c</formula>
        <name>Email Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>email</fullName>
        <field>email__c</field>
        <formula>Member__r.Email_address__c</formula>
        <name>email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>emailflow</fullName>
        <actions>
            <name>Email_Field_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>member__c.Email_address__c</field>
            <operation>notEqual</operation>
            <value>null</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>emailpdfflow</fullName>
        <actions>
            <name>emailsend</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>expense_members__c.Name</field>
            <operation>notEqual</operation>
            <value>null</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>send email</fullName>
        <actions>
            <name>email</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>expense_members__c.Name</field>
            <operation>notEqual</operation>
            <value>null</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
