import { LightningElement, api, wire } from 'lwc';
import getLatestMovieNewsByMovieId from '@salesforce/apex/MovieNewsController.getLatestMovieNewsByMovieId';

export default class ArtistNewsLWC extends LightningElement {
    @api recordId;
    @wire(getLatestMovieNewsByMovieId, {movieId: '$recordId'})
    movieNews;
}