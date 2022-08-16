const updateCounter = (counter, count) => {
  counter.dataset.count = count;
  counter.innerText = count;
};

const updateGuestCounter = (counter, count) => {
  counter.dataset.guestcount = count;
  counter.innerText = count;
};

const updateInput = (priceCents) => {
  const input = document.getElementById('price-input');
  input.value = priceCents;
};

const updateCTA = (priceCents) => {
  const button = document.getElementById('submit');
  button.value = `$ Pay ${priceCents}`;
};

const updateForm = (event) => {
  const offset = Number.parseInt(event.currentTarget.dataset.offset, 10);
  const counter = document.getElementById('counter');
  const count = Number.parseInt(counter.dataset.count, 10) + offset;
  const unitPriceCents = document.getElementById('price').dataset.amountCents;
  const guestCounter = document.getElementById('guestCounter');
  const guestCount = Number.parseInt(guestCounter.dataset.guestcount, 10)
  const priceCents = guestCount * unitPriceCents * count;

  if (count >= 1) {
    updateCounter(counter, count);
    updateInput(priceCents);
    updateCTA(priceCents);
  } else {
    event.preventDefault();
  }
};

const updateGuestForm = (event) => {
  const offset = Number.parseInt(event.currentTarget.dataset.offset, 10);
  const guestCounter = document.getElementById('guestCounter');
  const guestCount = Number.parseInt(guestCounter.dataset.guestcount, 10) + offset;
  document.getElementById('guestValue').value = guestCount;
  const unitPriceCents = document.getElementById('price').dataset.amountCents;
  const counter = document.getElementById('counter');
  const count = Number.parseInt(counter.dataset.count, 10)
  const priceCents = guestCount * unitPriceCents * count;
  if (guestCount >= 1) {
    updateGuestCounter(guestCounter, guestCount);
    updateInput(priceCents);
    updateCTA(priceCents);
  } else {
    event.preventDefault();
  }
};

const updateFormOnButtonClick = (button) => {
  button.addEventListener('click', updateForm);
};

const buttons = document.querySelectorAll('.incrementer');
buttons.forEach(updateFormOnButtonClick);

const updateGuestFormOnButtonClick = (button) => {
  button.addEventListener('click', updateGuestForm);
};

const guestButtons = document.querySelectorAll('.increase');
guestButtons.forEach(updateGuestFormOnButtonClick);
