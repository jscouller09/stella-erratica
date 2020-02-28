import "../plugins/flatpickr";
const total = document.querySelector('.total');
const field = document.querySelector('#counter');
const value = field.addEventListener('input', (event) => {
   updateTotal()
});

// Function that return the correct price
const updateTotal = (duration) => {
  const unitPriceCents = document.getElementById('price').dataset.amountCents;
  const priceCents = unitPriceCents / 100 ;
  total.innerText = `${ (priceCents * duration + 1000)}`;
};
// Function that take the dataset value and add it to the counter
// const updateCounter = (counter, count) => {
//   counter.dataset.count = count;
//   counter.value = count;
// };
// Function that
// const updateInput = (priceCents) => {
//   const input = document.getElementById('price-input');
//   input.value = priceCents;
// };

// const updateCTA = (priceCents) => {
//   const button = document.getElementById('submit');
//   button.value = `BOOK THIS PLANET FOR ${priceCents / 100}QUIDS`;
// };


const updateForm = (event) => {
  const offset = Number.parseInt(event.currentTarget.dataset.offset, 10);
  const field = document.querySelector('.field')
  const counter = document.getElementById('counter');
  const count = Number.parseInt(counter.dataset.count, 10) + offset;
  const unitPriceCents = document.getElementById('price').dataset.amountCents;
  const priceCents = unitPriceCents * count;

  if (count >= 1) { {}
    event.preventDefault();
    updateCounter(counter, count);
    updateInput(priceCents);
    updateCTA(priceCents);

  } else {
    event.preventDefault();
  }
};

// const updateFormOnButtonClick = (button) => {
//   button.addEventListener('click', updateForm);
// };

// const buttons = document.querySelectorAll('.incrementer');
// buttons.forEach(updateFormOnButtonClick);


// TODO export function
export { updateTotal };
