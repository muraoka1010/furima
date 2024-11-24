const price = () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

   const tax = Math.floor(inputValue * 0.1); 
    addTaxDom.innerHTML = tax;
  })
 
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);