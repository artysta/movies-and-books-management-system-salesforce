import { LightningElement, api, wire } from 'lwc';
import getLatestArtistNewsByArtistId from '@salesforce/apex/ArtistNewsController.getLatestArtistNewsByArtistId';

export default class ArtistNewsLWC extends LightningElement {
    @api recordId;
    @wire(getLatestArtistNewsByArtistId, {artistId: '$recordId'})
    artistNews;
}