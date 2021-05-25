var modalImage = document.getElementById("img-modal");

// Get the image and insert it inside the modal - use its "alt" text as a caption
var img = document.getElementById("myImg");
var modalImg = document.getElementById("img01");
var captionText = document.getElementById("caption");
img.onclick = function(){
  modalImage.style.display = "block";
  modalImg.src = this.src;
  captionText.innerHTML = this.alt;
}

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close-img")[0];

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modalImage.style.display = "none";
}