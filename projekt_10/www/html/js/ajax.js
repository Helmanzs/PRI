let l = console.log
let d = document

// AJAX
let getKnihy = () => {
    let xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (this.readyState == XMLHttpRequest.DONE && this.status == 200)
            ctiKnihy(this.responseXML)
    };

    xhr.open("GET", '/knihy.xml');
    xhr.send();
}

let ctiKnihy = (xmlDoc) => {
    let divKnihy = d.getElementById('knihy')
    let xmlKnihy = xmlDoc.getElementsByTagName('kniha')
    let ul = d.createElement('ul');

    for (let xmlKniha of xmlKnihy) {
        let xmlNazev = xmlKniha.getElementsByTagName('nazev')
        let nazev = xmlNazev[0].innerHTML
        let li = d.createElement('li')
        li.appendChild(d.createTextNode(nazev))
        ul.appendChild(li)
    }

    divKnihy.appendChild(ul)
}

document.addEventListener('DOMContentLoaded', () => {
    getKnihy()
})
