var modalImage = document.getElementById("img-modal");

// Get the image and insert it inside the modal - use its "alt" text as a caption
var img = document.getElementById("myImg");
var modalImg = document.getElementById("img01");
var captionText = document.getElementById("caption");
img.onclick = function () {
  modalImage.style.display = "block";
  modalImg.src = this.src;
  captionText.innerHTML = this.alt;
}

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close-img")[0];

// When the user clicks on <span> (x), close the modal
span.onclick = function () {
  modalImage.style.display = "none";
}

count = 1
var total = document.getElementById('harga')
var counter = document.getElementById('counter');
var minus = document.getElementById('minusCounter');

total.innerHTML = dotInt(harga)
function plusCounter() {
  count++
  totalHarga = harga * count;
  total.innerHTML = 'Rp ' + dotInt(totalHarga)
  counter.innerHTML = count
  if (count > 1) {
    minus.classList.remove('disabled')
  }
  totalHarga()
}
function minusCounter() {
  if (count !== 1) {
    count--
    totalHarga = harga * count;
    total.innerHTML = 'Rp ' + dotInt(totalHarga)
    counter.innerHTML = count
  } else {
    minus.classList.add('disabled')
  }
}

function Beli(id,diskon = false) {
  if(diskon==false){
    window.location = "System_Mcu.php?req=checkout&idProduk=" + id + "&jumlah=" + count
  }else{
    window.location = "System_Mcu.php?req=checkout&idProduk=" + id + "&diskon=" + diskon
  }
}

function addCart(id) {
  window.location = "System_Mcu.php?req=addCart&idProduk=" + id + "&jumlah=" + count
}