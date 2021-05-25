

// Get the modal
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

function showKategoriProduk(){
  const xhr = new XMLHttpRequest;
        const url = "system/kategori.php?query=get" 

        xhr.onloadend = function(){
            if(this.responseText != ''){
                var data = JSON.parse(this.responseText);
                temp = `
                <tr>
                    <td>No</td>p
                    <td>kategori</td>
                    <td>Aksi</td>
                </tr> 
                `
                no = 1
                for (let i = 0; i< data.length; i++) {
                    temp+=`
                        <tr>
                            <td>`+no+`</td>
                            <td>`+data[i][1]+`</td>
                            <td>
                                <button onclick='editKategori(`+data[i][0]+`)' class='btn warning'><i class='fas fa-edit'></i> Edit</button>
                                <a href="system/kategori.php?query=delete&id=`+data[i][0]+`" class='btn danger'><i class='fas fa-trash'></i> Hapus</a>
                            </td>
                        </tr>
                    `
                    no++ 
                }

                document.getElementById('kategori').innerHTML = temp
                
            }
        }

        xhr.open("GET",url,true)
        xhr.send()
}

function editKategori(id){
  const inputK = document.getElementById('kategoriInput')
  const inputId = document.getElementById('kid')
  const xhr = new XMLHttpRequest;
  const url = "system/kategori.php?query=getById&id="+id 
  xhr.onloadend = function(){
    if(this.responseText != ''){
      var data = JSON.parse(this.responseText)
      inputK.value = data['kategori']
      inputId.value = data['id']
      editModal.style.display = "block"
    }
  }
  xhr.open("GET",url,true)
  xhr.send()
       


}
showKategoriProduk()
