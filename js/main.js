// media query mobile
var x = window.matchMedia("(max-width: 680px)")



// tombol kategori
const kategori = document.getElementById('kategori')
const dropdown = document.querySelector('.dropdown-content')
if(x.matches){
    kategori.addEventListener('click',function(){
        console.log(dropdown)
       dropdown.classList.toggle('dropdown-show')
    })
}


