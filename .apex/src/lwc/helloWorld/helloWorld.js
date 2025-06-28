import {LightningElement} from 'lwc';
import getHelloWorld from '@salesforce/apex/HelloWorldController.getHelloWorld'

export default class HelloWorld extends LightningElement {

    greeting;

    connectedCallback() {
        getHelloWorld({name: 'Nika'})
            .then(result => {
                this.greeting = result;
            })
            .catch(error => {
                console.error(error);
            })
    }
}