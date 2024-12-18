document.addEventListener('DOMContentLoaded', () => {
  const element = document.querySelector('.your-element-class'); // 対象の要素のクラス名に置き換え
  if (element) {
    element.textContent = "Hello World!";
  }
});