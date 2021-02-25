const startDate = document.getElementById("start_date");
const finishDate = document.getElementById("finish_date");
const automobilePrice = document.getElementById("total_price");


const calculateDates = () => {
  finishDate.addEventListener('input', (event) => {
    const diffDates = (new Date(finishDate.value) - new Date(startDate.value));
    const days = (diffDates / 86400000);
    const price = automobilePrice.dataset.price;
    if (days <= 1) {
      automobilePrice.innerText = `$${price}`;
    } else {
      const total_price = days * price;
      automobilePrice.innerText = `$${total_price}`;
    }
  });
};

export { calculateDates };
