import { LightningElement, track } from 'lwc';

export default class LightningExampleInputDate extends LightningElement {

    @track date1;
    @track date2;
    @track expiryDate;
    @track timeVal = '0:0:0';
    timeIntervalInstance;


    function expiryDate(date_string) {
        var expiration = moment(date_string).format("YYYY-MM-DD");
        var current_date = moment().format("YYYY-MM-DD");
        var days = moment(expiration).diff(current_date, 'days');
        return days;
      }
      
      alert("Days remaining = " + expiryDate("2018-05-05"));
      console.log("Days remaining = " + expiryDate("2018-05-05"));
    
}
