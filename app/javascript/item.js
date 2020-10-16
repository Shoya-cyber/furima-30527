function item () {
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  itemPrice.addEventListener('input', function(){
    addTaxPrice.innerHTML = Math.floor(itemPrice.value * 0.1);
    profit.innerHTML = Math.floor(itemPrice.value * 0.9);
  });
};
window.addEventListener('load', item);