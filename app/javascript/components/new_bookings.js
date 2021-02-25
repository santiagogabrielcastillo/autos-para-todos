const startDate = document.getElementById("start_date");
const finishDate = document.getElementById("finish_date");
const automobilePrice = document.getElementById("total_price");
const price = automobilePrice.dataset.price;

const finishDateChange = () => {
  finishDate.addEventListener('input', (event) => {
    // si diffDates < 0, sacar fecha de fin y reiniciar costo
    const diffDates = (new Date(finishDate.value) - new Date(startDate.value));
    if (diffDates > 0) {
      const days = (diffDates / 86400000);
      if (days <= 1) {
        automobilePrice.innerText = `$${price}`;
      } else {
        const total_price = days * price;
        automobilePrice.innerText = `$${total_price}`;
      }
    }
  });
};

const startDateChange = () => {
  startDate.addEventListener('input', (event) => {
    if (finishDate.value) {
      const diffDates = (new Date(finishDate.value) - new Date(startDate.value));
      if (diffDates > 0) {
        const days = (diffDates / 86400000);
        if (days <= 1 || days === NaN) {
          automobilePrice.innerText = `$${price}`;
        } else {
          const total_price = days * price;
          automobilePrice.innerText = `$${total_price}`;
        }
      } else {
        finishDate.value = "";
      } 
    } else {
      automobilePrice.innerText = `$${price}`;
    }    
  });
};


const calculateDates = () => {
  automobilePrice.innerText = `$${price}`;
  finishDateChange();
  startDateChange();
};

export { calculateDates };
