var modal = document.getElementById("myModal");
var editModal = document.getElementById('edit-modal');
var btn = document.getElementById("cat");
var span = document.getElementsByClassName("close")[0];
btn.onclick = function() {
  modal.style.display = "block";
}
span.onclick = function() {
  modal.style.display = "none";
}
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
  if(event.target == editModal){
    editModal.style.display = "none"
  }
}

function editSubKategori(id){
  const inputK = document.getElementById('SubkategoriInput')
  const inputId = document.getElementById('idSub')
  const xhr = new XMLHttpRequest;
  const url = "system/kategori.php?query=getsubkategoriById&id="+id 
  xhr.onloadend = function(){
    if(this.responseText != ''){
      var data = JSON.parse(this.responseText)
      inputK.value = data['sub_kategori']
      inputId.value = data['id']
      editModal.style.display = "block"
    }
  }
  xhr.open("GET",url,true)
  xhr.send()


}

function hapus(id,page) {
  var alerts = confirm('apakah anda yakin ingin menghapus Sub kategori?')

  if (alerts == true) {
      window.location = "system/kategori.php?query=deletesubkategori&id="+id+"&page="+page
  }

}