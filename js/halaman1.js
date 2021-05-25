loadItem()
loadslider()

function truncateWords(sentence, amount, tail) {
    const words = sentence.split(' ');

    if (amount >= words.length) {
        return sentence;
    }

    const truncated = words.slice(0, amount);
    return `${truncated.join(' ')}${tail}`;
}

function dotInt(b) {
    var _minus = false;
    if (b < 0) _minus = true;
    b = b.toString();
    b = b.replace(".", "");
    b = b.replace("-", "");
    c = "";
    panjang = b.length;
    j = 0;
    for (i = panjang; i > 0; i--) {
        j = j + 1;
        if (((j % 3) == 1) && (j != 1)) {
            c = b.substr(i - 1, 1) + "." + c;
        } else {
            c = b.substr(i - 1, 1) + c;
        }
    }
    if (_minus) c = "-" + c;
    return c;
}

function loadItem() {
    // Dom Selection
    const content = document.getElementById('product')
    // temp variable
    let temp = `` //backtick

    //<button class="btn card-btn" onclick="addCart(`+ i + `)" >Add To cart</button>
    // ajax Request
    const ajax = new XMLHttpRequest; //insilaisasi
    url = 'data/product.json' //url tujuan
    ajax.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            var items = JSON.parse(this.responseText) //parse json ke object
            for (let i = 0; i < items.length; i++) {
                temp += `
                <div class="card">
                <img src="data/image/`+ items[i]['image'] + `" width="100%" alt="">
                <div class="card-body">
                    <div class="card-header">
                        <h3>`+ truncateWords(items[i]['nama'], 3, '') + `</h3>
                    </div>
                    <p>`+ truncateWords(items[i]['deskripsi']['deskripsi'], 10, '....') + `</p>
                    <h3 class="text-primary harga-txt">Rp. `+ dotInt(items[i]['harga'])  + `</h3>
                </div>
                </div>
                `
            }
            content.innerHTML = temp
        }


    }
    ajax.open('GET', url, true)
    ajax.send()

}

function loadslider() {
    // Dom Selection
    const content = document.getElementById('slider')
    // temp variable
    let temp = `` //backtick

    //<button class="btn card-btn" onclick="addCart(`+ i + `)" >Add To cart</button>
    // ajax Request
    const ajax = new XMLHttpRequest; //insilaisasi
    url = 'data/product.json' //url tujuan
    ajax.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            var items = JSON.parse(this.responseText) //parse json ke object
            for (let i = 5; i < items.length; i++) {
                temp += `
                <div class="card-slide">
                <img src="data/image/`+ items[i]['image'] + `" width="180" alt="">
                <div class="card-body">
                    <div class="card-header">
                        <h3>`+ truncateWords(items[i]['nama'], 3, '') + `</h3>
                    </div>
                    <h3 class="text-primary harga-txt">Rp. `+ dotInt(items[i]['harga'])  + `</h3>
                </div>
                </div>
                `
            }
            content.innerHTML = temp
        }


    }
    ajax.open('GET', url, true)
    ajax.send()

}

