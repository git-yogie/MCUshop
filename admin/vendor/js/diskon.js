// insiasi komponen
showDiskon()


// akhir insiasi


var modalAdd = document.getElementById("addModal");
var btnModalAdd = document.getElementById('btnAdd')

var modalEdit = document.getElementById("edit-modal");
var btnModalAdd = document.getElementById('btneEdit')

var shoProduk = document.getElementById("show-produk");
var btnModalAdd = document.getElementById('btnShow')

function showModal(modal) {
    var modal = document.getElementById(modal);
    modal.style.display = "block";
}

function closeModal(modal) {
    var modal = document.getElementById(modal);
    modal.style.display = "none";
}


function showDiskon() {
    var tabel = document.getElementById('tabelDiskon')
    var spin = document.getElementById('spin')
    var url = "system/dashboard.php?system=discount&query=get"
    var xhr = new XMLHttpRequest;

    xhr.onloadstart = function () {
        temp = `
        <div class="loading">
            <div class="loader loader-medium"></div>
        </div>
        <p style="text-align:center;">Loading Diskon</p>
        `
        spin.innerHTML = temp
    }
    xhr.onloadend = function () {
        data = JSON.parse(this.responseText)
        spin.innerHTML = ''
        tabel.innerHTML = `
        <tr>
            <td>no</td>
            <td>Nama</td>
            <td>Tanggal Mulai</td>
            <td>Tanggal Selesai</td>
            <td>Aksi</td>
        </tr>
        `
        var no = 1
        data.forEach(data => {
            tabel.innerHTML += `
            <tr>
                <td>`+ no + `</td>
                <td>`+ data['nama'] + `</td>
                <td>`+ data['start'] + `</td>
                <td>`+ data['end'] + `</td>
                <td>
            
                <button  class='btn primary' onclick='produkList(`+ data['id'] + `)'><i class='fas fa-list'></i> Produk</button>
                <button  class='btn warning' onclick='getDiskonByid(`+ data['id'] + `)'><i class='fas fa-edit'></i> Edit</button>
                <button class="btn danger" onclick="hapus(`+ data['id'] + `)"><i class="fas fa-trash"></i> Hapus</button>
                </td>
            </tr>
            `
            no++
        });
    }
    xhr.onerror = function () {
        alert('server sedang bermasalah!')
    }
    xhr.open('GET', url, true)
    xhr.send()
}

var formElementProduk = document.getElementById('formTambahProduk')

formElementProduk.addEventListener('submit',function(e){
    e.preventDefault()
    var formData = new FormData(formElementProduk)
    var spin = document.getElementById('loading-showProduk')
    var btn = document.getElementById('btnTambahProduk')
    var id = document.getElementById('id_diskon').value
    var xhr = new XMLHttpRequest;

    xhr.onloadstart = function(){
        btn.classList.add('disabled')
        temp = `
        <div class="loading">
        <div class="loader loader-medium"></div>
        </div>
        <p style="text-align:center;">Loading Diskon</p>
        `
        spin.innerHTML = temp
    }
    xhr.onloadend = function(){
        spin.innerHTML = ' '
        btn.classList.remove('disabled')
        produkList(id)
    }
    xhr.open("POST","system/dashboard.php?system=discount&query=addProduk")
    xhr.send(formData)

})


var formElement = document.getElementById('formAdd')
var alert = document.getElementById('alerts')
formElement.addEventListener('submit', function (e) {
    e.preventDefault()
    var formData = new FormData(formElement)
    var xhr = new XMLHttpRequest;
    xhr.onloadend = function (params) {
        status = JSON.parse(this.responseText);

        if (status == 1) {
            alerts.classList.add('success')
            alert.innerHTML = 'Tambah data berhasil.!'
            formElement.reset()
            showDiskon()
            closeModal('addModal')
        } else {
            alerts.classList.add('danger')
            alert.innerHTML = 'Tambah data gagal.!'
            closeModal('addModal')
        }
        console.log(this.responseText)
    }
    xhr.open("POST", "system/dashboard.php?system=discount&query=add")
    xhr.send(formData)

})

function kategori() {
    var select = document.getElementById('kategoriProduk')
    var url = "system/kategori.php?query=get"
    var xhr = new XMLHttpRequest;
    xhr.onloadend = function () {
        var data = JSON.parse(this.responseText);
        select.innerHTML = `
         <option value='zero' selected>All produk</option>
        `
        data.forEach(data => {
            select.innerHTML += `
            <option value='`+ data[0] + `'>` + data[1] + `</option>
            `
        });
    }
    xhr.open("GET", url, true)
    xhr.send()
}

function SelectBykategori() {
    var id = document.getElementById('kategoriProduk').value
    produk(id)
}

function produk(kategori = null) {
    var select = document.getElementById('produkDiskon')
    if (kategori == null || kategori == 'zero') {
        var url = "system/dashboard.php?system=discount&query=getProduk"
    } else {
        var url = "system/dashboard.php?system=discount&query=getProduk&id=" + kategori
    }
    var xhr = new XMLHttpRequest;
    xhr.onloadend = function () {
        var data = JSON.parse(this.responseText);
        select.innerHTML = ``
        data.forEach(data => {
            select.innerHTML += `
            <option value='`+data['id']+`'>`+ truncateWords(data['nama'], 3, '..') + ` | ` + data['brand'] + ` | Rp.` + dotInt(data['harga']) + `</option>
            `
        });
    }
    xhr.open("GET", url, true)
    xhr.send()
}



function produkList(id) {
    showModal('show-produk');
    kategori()
    produk()
    var url = 'system/dashboard.php?system=discount&query=get&id='+id
    var xhr = new XMLHttpRequest;
    xhr.onloadend = function(){
        var dataDiskon = JSON.parse(this.responseText)
        var spin = document.getElementById('loading-showProduk')
        var tables = document.getElementById('tableDiskon')
        document.getElementById('id_diskon').value = id
        var url = "system/dashboard.php?system=discount&query=getDiskonProduk&id=" + id
        var xhr = new XMLHttpRequest;
        xhr.onloadstart = function () {
            temp = `
            <div class="loading">
                <div class="loader loader-medium"></div>
            </div>
            <p style="text-align:center;">Loading Diskon</p>
            `
            spin.innerHTML = temp
        }
        xhr.onloadend = function () {
            spin.innerHTML = ' '
            tables.innerHTML = `
            <tr>
                <td>No</td>
                <td>Nama Produk</td>
                <td>Brand</td>
                <td>Diskon</td>
                <td>Harga</td>
                <td>Harga setelah Diskon</td>
                <td>aksi</td>
            </tr>
            `
            no =1
            var data = JSON.parse(this.responseText);
            
            data.forEach(data => {
                tables.innerHTML += `

                <tr>
                    <td>`+no+`</td>
                    <td>`+data['nama']+`</td>
                    <td>`+data['brand']+`</td>
                    <td>`+dataDiskon['discount']+`%</td>
                    <td>Rp `+dotInt(data['harga'])+`</td>
                    <td>Rp ` + dotInt(data['harga']-Math.floor((data['harga']*(dataDiskon['discount']/100)))) + `</td>
                    <td><button class="btn danger" onclick="hapusProduk(`+ data['id'] + `,`+id+`)"><i class="fas fa-trash"></i> Hapus</button></td>
                </tr>
                
                `
                no++
            })
            if (data.length == 0) {
                spin.innerHTML = ' <p style="text-align:center; margin:30px;">Produk Belum Ditambahkan</p> '
            }
    
        }
        xhr.open("GET", url, true)
        xhr.send()
    }
    xhr.open("GET",url,true)
    xhr.send()


}

function getDiskonByid(id){
    var Eid = document.getElementById('Eid');
    var nama = document.getElementById('namaDiskon');
    var detail = document.getElementById('editDetail');
    var diskon = document.getElementById('diskonEdit');
    var tanggalMulai = document.getElementById('date-start');
    var waktuMulai = document.getElementById('time-start');
    var tanggalBerakhir = document.getElementById('date-end');
    var waktuBerakhir = document.getElementById('time-end');

    var url = "system/dashboard.php?system=discount&query=getDataDiskon&id="+id
    var xhr = new XMLHttpRequest;
    xhr.onloadend = function () {
        var data = JSON.parse(this.responseText);
        console.log(data)
        diskonStart = data['start'].split(" ")
        diskonEnd = data['end'].split(" ")
        console.log(diskonStart[0])
        Eid.value = data['id']
        nama.value = data['nama']
        diskon.value = data['discount']
        tinymce.get("editDetail").setContent(data['detail']);
        tanggalMulai.value = diskonStart[0]
        waktuMulai.value = diskonStart[1]
        waktuBerakhir.value = diskonEnd[1]
        tanggalBerakhir.value = diskonEnd[0]
        showModal('editModal')
       
    }
    xhr.open("GET", url, true)
    xhr.send()
}

var formElementEdit = document.getElementById('formEdit')
formElementEdit.addEventListener('submit', function (e) {
    e.preventDefault()
    var formData = new FormData(formElementEdit)
    var xhr = new XMLHttpRequest;
    xhr.onloadend = function () {
        status = JSON.parse(this.responseText);

        if (status === 'true') {
            alerts.classList.add('success')
            alert.innerHTML = 'edit data berhasil.!'
            formElement.reset()
            showDiskon()
            closeModal('editModal')
        } else {
            alerts.classList.add('danger')
            alert.innerHTML = 'edit data gagal.!'
            closeModal('editModal')
        }
        console.log(status)
    }
    xhr.open("POST", "system/dashboard.php?system=discount&query=update")
    xhr.send(formData)

})





function hapus(id){
    var alert = confirm("anda akan menghapus diskon!");
    var alerts = document.getElementById('alerts')
    if(alert == true){
      var url = "system/dashboard.php?system=discount&query=delete&id=" + id
      var xhr = new XMLHttpRequest;
      xhr.onloadend = function(){
        data = JSON.parse(this.responseText)
        alerts.classList.add('success')
        alerts.innerHTML = 'hapus data berhasil.!'
        showDiskon()
      }
      xhr.open("GET",url,true)
      xhr.send()

    }
}
function hapusProduk(id,id_diskon){
    var alert = confirm("anda akan menghapus Produk!");
    var alerts = document.getElementById('alerts')
    if(alert == true){
      var url = "system/dashboard.php?system=discount&query=deleteProduk&id=" + id
      var xhr = new XMLHttpRequest;
      xhr.onloadend = function(){
        data = JSON.parse(this.responseText)
        produkList(id_diskon)
      }
      xhr.open("GET",url,true)
      xhr.send()

    }
}