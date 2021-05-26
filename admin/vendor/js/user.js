// Get the modal
var modal = document.getElementById("myModal");
var editModal = document.getElementById('edit-modal');
var btn = document.getElementById("cat");

var span = document.getElementsByClassName("close");
btn.onclick = function () {
    modal.style.display = "block";
}
span[0].onclick = function (event) {
    modal.style.display = "none";
    
}
span[1].onclick = function (event) {
    editModal.style.display = "none"
    
}

window.onclick = function (event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
    if (event.target == editModal) {
        editModal.style.display = "none"
    }
}

var username = document.getElementById('username')
username.onchange = function (event) {
    const url = "system/dashboard.php?system=user&query=username&username=" + username.value
    const xhr = new XMLHttpRequest;
    xhr.onloadend = function () {
        if (this.responseText != '') {
            data = JSON.parse(this.responseText)
            if (data['result'] == 1) {
                alert('username sudah digunakan!')
                username.value = ''
            }

        }
    }
    xhr.open("GET", url, true)
    xhr.send()

}

function edit(id) {
    const xhr = new XMLHttpRequest;
    const url = "system/dashboard.php?system=user&query=getbyid&id=" + id
    xhr.onloadend = function () {
        if (this.responseText != '') {
            var data = JSON.parse(this.responseText)
            document.getElementById('nama').value = data['nama']
            document.getElementById('id_user').value = data['id']
            document.getElementById('username_edit').value = data['username']
            document.getElementById('email').value = data['email']

            editModal.style.display = "block"
        }
    }
    xhr.open("GET", url, true)
    xhr.send()


}

function hapus(id) {
    var alerts = confirm('apakah anda yakin ingin menghapus Slider?')

    if (alerts == true) {
        window.location = "system/dashboard.php?system=user&query=delete&id=" + id
    }

}