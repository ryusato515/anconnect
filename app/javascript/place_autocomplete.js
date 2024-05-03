// Place Autocomplete
document.addEventListener('DOMContentLoaded', function () {
  let inputShopName = document.getElementById('shop_name');
  let inputAddress = document.getElementById('address');

  //オートコンプリートのオプション
  let options = {
    types: ['establishment'],
    componentRestrictions: { country: 'JP' },
  };

  // オートコンプリート適用
  let autocompleteShopName = new google.maps.places.Autocomplete(inputShopName, options);
  let autocompleteAddress = new google.maps.places.Autocomplete(inputAddress, options);

  // ショップ名のオートコンプリートが選択されたとき
  autocompleteShopName.addListener('place_changed', function() {
    let place = autocompleteShopName.getPlace();
    inputShopName.value = place.name;
    inputAddress.value = place.formatted_address;
  });

  // 住所のオートコンプリートが選択されたとき
  autocompleteAddress.addListener('place_changed', function() {
    let place = autocompleteAddress.getPlace();
    inputAddress.value = place.formatted_address;
  });
});