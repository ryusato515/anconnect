document.getElementById('accordion-toggle').addEventListener('click', function() {
  var content = document.getElementById('accordion-content');
  var icon = document.getElementById('accordion-icon');

  // hiddenクラスをトグルする
  content.classList.toggle('hidden');
  icon.classList.toggle('rotate-180');

  // 高さのアニメーションを制御する
  if (!content.classList.contains('hidden')) {
    content.style.maxHeight = content.scrollHeight + "px";
  } else {
    content.style.maxHeight = 0;
  }
});