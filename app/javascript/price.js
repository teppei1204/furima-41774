function setPriceEventListener() {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  if (!priceInput) return;

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const tax = Math.floor(inputValue * 0.1);
    const profit = inputValue - tax;

    addTaxDom.innerHTML = tax.toLocaleString();
    profitDom.innerHTML = profit.toLocaleString();
});
}

document.addEventListener('DOMContentLoaded', setPriceEventListener);
document.addEventListener('turbo:load', setPriceEventListener);
document.addEventListener('turbo:render', setPriceEventListener);