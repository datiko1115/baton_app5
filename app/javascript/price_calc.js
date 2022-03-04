function price_calc (){
  if (document.getElementById('item-price') != null){
    const form = document.getElementById("item-price");
    form.addEventListener("input", () => {
      const form_inside = form.value;
      const price_fee  = document.getElementById("add-tax-price");
      price_fee.innerHTML = Math.round(form_inside * 0.1);

      const price_profit  = document.getElementById("profit");
      price_profit.innerHTML = Math.round(form_inside - form_inside * 0.1);
    });
  }
};

window.addEventListener('load', price_calc);

// 読み込まれたページに'item-price'というid名の要素があれば発火
// document.getElementById('item-price') != null