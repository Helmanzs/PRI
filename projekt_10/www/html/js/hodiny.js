let ticking = true;
let clock;
let divTime;
const snowflake = 'img/snowflake.svg';
let hourLines = [];

function init() {
    divTime = document.getElementById('time');
    clock = document.getElementById('clock');

    clock.addEventListener('click', () => {
        ticking = !ticking;
        clock.style.stroke = ticking ? 'black' : "#00CBE0";
        divTime.textContent = ticking
            ? new Date().toLocaleTimeString("cs-CZ")
            : `${new Date().toLocaleTimeString("cs-CZ")} - ZMRAŽENO`;

        hourLines.forEach(line => {
            line.style.stroke = ticking ? 'black' : "#00CBE0";
        });
    });

    tickTock();
}

let addElem = (parent, tag) => {
    let elem = document.createElementNS('http://www.w3.org/2000/svg', tag);
    parent.append(elem);
    return elem;
};

function tickTock() {
    let seconds = makeLine(-30, 120, 2, 'darkred');
    let minutes = makeLine(-30, 120);
    let hours = makeLine(-20, 60);

    for (let i = 0; i < 12; i++) {
        let hourLine = makeLine(-135, -125);
        hourLine.setAttribute('transform', `rotate(${i * 30}, 0, 0)`);
        hourLines.push(hourLine);
    }


    let hub = addElem(clock, 'circle');
    hub.setAttribute('r', '10');
    hub.setAttribute('fill', 'lime');

    let tick = () => {
        if (!ticking) return;

        let now = new Date();
        divTime.textContent = now.toLocaleTimeString('cs-CZ');

        let sec = now.getSeconds();
        let min = now.getMinutes();
        let hour = now.getHours() % 12;

        seconds.setAttribute('transform', `rotate(${sec * 6}, 0, 0)`);
        minutes.setAttribute('transform', `rotate(${min * 6}, 0, 0)`);
        hours.setAttribute('transform', `rotate(${hour * 30 + min * 0.5}, 0, 0)`);
    };

    tick();
    setInterval(tick, 1000);
}

function makeLine(y1, y2, strokeWidth = 4, color = 'black') {
    let line = addElem(clock, 'line');
    line.setAttribute('x1', '0');
    line.setAttribute('y1', y1);
    line.setAttribute('x2', '0');
    line.setAttribute('y2', y2);
    line.setAttribute('stroke-width', strokeWidth);
    line.setAttribute('stroke', color);

    return line;
}