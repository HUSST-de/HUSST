console.log('script typeStyle.js')
fetch('type.svg')
  .then(response => response.text())
  .then(svgText => {
    console.log('type.svg fetched')
    const container = document.getElementById('svg-container');
    container.innerHTML = svgText;

    // Optional: Zugriff auf einzelne Elemente
    const t = container.querySelector('#tspan1038');
    if (t) t.textContent = 'T'; // oder Farbe direkt setzen: t.style.fill = 'red';
  });
