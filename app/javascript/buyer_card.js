const pay = () => {
  if (document.getElementById('buyer-charge-form') != null){
    Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
    const submit = document.getElementById("buyer-button");
    submit.addEventListener("click", (e) => {
      e.preventDefault();

      const formResult = document.getElementById("buyer-charge-form");
      const formData = new FormData(formResult);

      const card = {
        number: formData.get("buyer_address_buyer_order[number]"),
        cvc: formData.get("buyer_address_buyer_order[cvc]"),
        exp_month: formData.get("buyer_address_buyer_order[exp_month]"),
        exp_year: `20${formData.get("buyer_address_buyer_order[exp_year]")}`,
      };
      Payjp.createToken(card, (status, response) => {
        console.log(status)
        if (status == 200) {
          const token = response.id;
          console.log(token)
          const renderDom = document.getElementById("buyer-charge-form");
          const tokenObj = `<input value=${token} name='token' type="hidden"> `;
          renderDom.insertAdjacentHTML("beforeend", tokenObj);
        }

        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");
        
        document.getElementById("buyer-charge-form").submit();
      });
    });
  }
};

window.addEventListener("load", pay);