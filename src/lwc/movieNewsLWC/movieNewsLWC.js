import { LightningElement, api, wire } from 'lwc';
import getLatestMovieNews from '@salesforce/apex/MovieNewsController.getLatestMovieNews';

export default class MovieNewsLWC extends LightningElement {
    @wire(getLatestMovieNews) movieNews;
}