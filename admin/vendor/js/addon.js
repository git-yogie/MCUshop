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

function xhrGet(url){
    var xhr = new XMLHttpRequest;
    xhr.onloadend = function(){
        var data = this.responseText
        return data
    }
    xhr.open("GET",url,true)
    xhr.send()
}