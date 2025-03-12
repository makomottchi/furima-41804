document.addEventListener('DOMContentLoaded', () => {
  const priceInput = document.getElementById('item-price');
  const addTaxDom = document.getElementById('add-tax-price');
  const profitDom = document.getElementById('profit');

  if (priceInput) {
    priceInput.addEventListener('input', () => {
      const inputValue = parseInt(priceInput.value);

      // 販売手数料の計算 (仮に10%とする)
      const tax = Math.floor(inputValue * 0.1);
      // 利益の計算
      const profit = inputValue - tax;

      // 結果をDOMに表示
      addTaxDom.innerHTML = tax;
      profitDom.innerHTML = profit;
    });
  }
});