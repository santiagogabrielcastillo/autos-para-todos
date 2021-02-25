

const finishDateChange = (finishDate, startDate, automobilePrice) => {
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

const startDateChange = (finishDate, startDate, automobilePrice) => {
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
  const automobilePrice = document.getElementById("total_price");
  const startDate = document.getElementById("start_date");
  const finishDate = document.getElementById("finish_date");
  
  if (automobilePrice) {
    const price = automobilePrice.dataset.price;
    automobilePrice.innerText = `$${price}`;
    finishDateChange(finishDate, startDate, automobilePrice);
    startDateChange(finishDate, startDate, automobilePrice);
  };
};

export { calculateDates };
