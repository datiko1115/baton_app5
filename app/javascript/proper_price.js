function proper_price (){
  if (document.getElementById('item-select') != null){
    const select_form = document.getElementById("item-select");
 
    select_form.addEventListener("change", () => {
    const form_id = select_form.selectedIndex;
    const form_txt = select_form.options[form_id].text;

    const splited_txt = form_txt.split('/')
    
    const proper_text = splited_txt[splited_txt.length -1];
    const bought_text = splited_txt[splited_txt.length -2];

    const proper_price = proper_text.replace(/[^0-9]/g, '');
    const bought_price = bought_text.replace(/[^0-9]/g, '');

    const proper_price_form = document.getElementById("add-proper-price");
    proper_price_form.innerHTML = proper_price;

    const bought_price_form = document.getElementById("add-bought-price");
    bought_price_form.innerHTML = bought_price;
    });
  }
};

window.addEventListener('load', proper_price);