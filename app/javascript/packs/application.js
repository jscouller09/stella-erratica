import "bootstrap";
import "../plugins/flatpickr";
import "flatpickr/dist/themes/airbnb.css"
import { updateTotal } from '../helpers/invoiceupdater';

const datesdata = document.querySelector('.class')

datesdata.addEventListener('click', (event) => {
  event.preventDefault();
  const dates = document.getElementById('search_starts');
  const daterange = dates.value;
  console.log(daterange);
  const firstdate = daterange.slice(0, 10);
  const lastdate = daterange.slice(14, 24);
  const start = new Date(`${firstdate}`);
  const end = new Date(`${lastdate}`);
  const duration = (end - start)/86400000 + 1;
  const counter = document.getElementById('counter');
  counter.value = duration;
  updateTotal(duration);
  console.log(duration);
});




