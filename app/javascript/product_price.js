window.addEventListener('load', () => {
    const productPrice = document.getElementById("item-price");
    productPrice.addEventListener("input", () => {
        const inputValue = productPrice.value;
        const tax = 10;
        const addTaxDom = document.getElementById("add-tax-price");
        addTaxDom.innerHTML = inputValue / tax
        const profit = document.getElementById("profit")
        profit.innerHTML = inputValue - inputValue / tax
    })
});