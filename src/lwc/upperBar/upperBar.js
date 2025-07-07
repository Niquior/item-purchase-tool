import {LightningElement, api, wire} from 'lwc';
import getAccount from '@salesforce/apex/upperBarController.getAccount';
import getUser from '@salesforce/apex/upperBarController.getUser';

const ACCOUNT_FIELDS = [
    'Account.Name',
    'Account.AccountNumber',
    'Account.Industry'
];

export default class UpperBar extends LightningElement {
    @api recordId;

    accountData;
    error;

    @wire(getAccount, { id: '$recordId'})
    wiredAccount({ error, data }) {
        if (data) {
            this.accountData = data;
            this.error = undefined;
        }
        else if (error) {
            this.accountData = undefined;
            this.error = error;
            console.error('Account error' , error);
        }
    }

    @wire(getUser, { id: '$recordId'})

    get accName() {
        console.log('Name: ' + this.accountData?.Name || 'xxx')
        return this.accountData?.Name || 'xxx';
    }

    get accNumber() {
        console.log('Id: ' + this.accountData?.Id || 'xxx')
        return this.accountData?.Id || 'xxx';
    }

    get accIndustry() {
        console.log('Industry: ' + this.accountData?.Industry || 'xxx')
        return this.accountData?.Industry || 'xxx';
    }

    get isManager() {
        console.log('Is Manager: ' + this.accountData?.IsManager__c || false);
        return this.accountData?.IsManager__c || false;
    }


    connectedCallback() {    }
}