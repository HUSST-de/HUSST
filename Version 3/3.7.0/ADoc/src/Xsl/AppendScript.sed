s/(<\/body>)/  <script>\
    document.addEventListener(\"DOMContentLoaded\", function () {\
      const toc = document.getElementById(\"toc\");\
      if (!toc) return;\
    \
      const nested = toc.querySelectorAll(\"ul ul\");\
      nested.forEach(ul => {\
        ul.style.display = \"none\";\
        const parentLi = ul.parentElement;\
        const toggle = document.createElement(\"span\");\
        toggle.textContent = \" ▶\";\
        toggle.style.cursor = \"pointer\";\
        toggle.style.color = \"gray\";\
        toggle.style.marginLeft = \"4px\";\
  \
        toggle.onclick = () => {\
          const open = ul.style.display === \"block\";\
          ul.style.display = open ? \"none\" : \"block\";\
          toggle.textContent = open ? \" ▶\" : \" ▼\";\
        };\
  \
        const a = parentLi.querySelector(\"a\");\
        if (a) a.after(toggle);\
      });\
    });\
  <\/script>\
\1/
