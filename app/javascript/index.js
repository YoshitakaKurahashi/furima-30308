window.addEventListener('load', function(){
  const moneyInput = document.getElementById("item-price");
  const salesCommission = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  moneyInput.addEventListener('input', function(){
    num1 = moneyInput.value * 0.1;
    num2 = moneyInput.value * 0.9;
    salesCommission.innerHTML = Number(num1).toLocaleString();
    profit.innerHTML = Number(num2).toLocaleString();
  });
})


