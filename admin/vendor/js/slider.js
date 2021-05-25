// Get the modal
var modal = document.getElementById("myModal");
var editModal = document.getElementById('edit-modal');
var btn = document.getElementById("cat");
var span = document.getElementsByClassName("close")[0];
btn.onclick = function() {
  modal.style.display = "block";
}

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
  if(event.target == editModal){
    editModal.style.display = "none"
  }
}

function editKategori(id){
  const inputK = document.getElementById('nama')
  const inputId = document.getElementById('kid')
  const xhr = new XMLHttpRequest;
  const url = "system/dashboard.php?system=slider&query=getById&id="+id 
  xhr.onloadend = function(){
    if(this.responseText != ''){
      var data = JSON.parse(this.responseText)
      inputK.value = data['nama']
      inputId.value = data['id']
      editModal.style.display = "block"
    }
  }
  xhr.open("GET",url,true)
  xhr.send()


}

function hapus(id) {
  var alerts = confirm('apakah anda yakin ingin menghapus Slider?')

  if (alerts == true) {
      window.location = "system/dashboard.php?system=slider&query=delete&id="+id
  }

}