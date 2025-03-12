document.addEventListener('DOMContentLoaded', () => {
  const priceInput = document.getElementById('item-price');
  const addTaxDom = document.getElementById('add-tax-price');
  const profitDom = document.getElementById('profit');

  console.log(priceInput, addTaxDom, profitDom); // ここで要素が正しく取得できているか確認

  if (priceInput) {
    priceInput.addEventListener('input', () => {
      const inputValue = parseInt(priceInput.value);
      console.log("Input Value:", inputValue); // 入力値を確認

      // 数値が半角であるか、かつ ¥300〜¥9,999,999 の範囲内であるかをチェック
      if (!isNaN(inputValue) && inputValue >= 300 && inputValue <= 9999999) {
        // 販売手数料の計算 (仮に10%とする)
        const tax = Math.floor(inputValue * 0.1);
        // 利益の計算
        const profit = inputValue - tax;

        // 結果をDOMに表示
        console.log("Tax:", tax, "Profit:", profit); // 計算結果を確認
        addTaxDom.innerHTML = tax;
        profitDom.innerHTML = profit;
      } else {
        // 条件を満たさない場合は結果をクリアする
        addTaxDom.innerHTML = '';
        profitDom.innerHTML = '';
      }
    });
  }
});