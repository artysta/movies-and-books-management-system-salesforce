import { LightningElement, api, wire } from 'lwc';
import getLatestArtistNews from '@salesforce/apex/ArtistNewsController.getLatestArtistNews';

export default class ArtistNewsLWC extends LightningElement {
    @wire(getLatestArtistNews) artistNews;
}