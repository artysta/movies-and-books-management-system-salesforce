import { LightningElement, api, wire } from 'lwc';
import getLatestBookNewsByBookId from '@salesforce/apex/BookNewsController.getLatestBookNewsByBookId';

export default class ArtistNewsLWC extends LightningElement {
    @api recordId;
    @wire(getLatestBookNewsByBookId, {bookId: '$recordId'})
    bookNews;
}