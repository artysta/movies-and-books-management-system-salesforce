import { LightningElement, api, wire } from 'lwc';
import getLatestBookNews from '@salesforce/apex/BookNewsController.getLatestBookNews';

export default class BookNewsLWC extends LightningElement {
    @wire(getLatestBookNews) bookNews;
}