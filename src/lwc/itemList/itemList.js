import {LightningElement, track} from 'lwc';
import getItemList from '@salesforce/apex/ItemListController.getItemList';

export default class ItemList extends LightningElement {
    @track items;

    connectedCallback() {
        getItemList()
            .then(list => {
                this.items = ['111', '222', '333'];
            })
            .catch(error => {
                console.error(error)
            })
    }
}