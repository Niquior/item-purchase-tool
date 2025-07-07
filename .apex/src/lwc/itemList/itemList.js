import {LightningElement, track} from 'lwc';
import getFilteredItemList from '@salesforce/apex/ItemListController.getItemList';

export default class ItemList extends LightningElement {
    @track items;

    connectedCallback() {
        getFilteredItemList({ families: [], types: [], searchKey: ''})
            .then(list => {
                this.items = ['111', '222', '333'];
            })
            .catch(error => {
                console.error('Cannot access list of items', error)
            })
    }
}