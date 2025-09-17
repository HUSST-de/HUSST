// --------------------
// Hilfsfunktionen
// --------------------

// expandiert einen <li>-Knoten über seinen Toggle-Pfeil, falls vorhanden
function expand(li) {
  const toggle    = li.querySelector(".arrow");  // Toggle-Pfeil
  const nestedUl  = li.querySelector("ul");      // Unterliste
  const mayExpand = !!toggle && !!nestedUl && nestedUl?.style.display !== "block";

  // expandieren nur, wenn Toggle vorhanden ist und UL noch eingeklappt
  if (mayExpand) {
    toggle.click();  // click() sorgt dafür, dass Pfeiltext korrekt gesetzt wird
    return true;
  }
  return false;
}

// klappt einen <li>-Knoten ein, falls möglich
function colapse(li) {
  const toggle    = li.querySelector(".arrow");
  const nestedUl  = li.querySelector("ul");
  const mayColapse = !!toggle && !!nestedUl && nestedUl?.style.display === "block";

  // einklappen nur, wenn Toggle vorhanden ist und UL ausgeklappt
  if (mayColapse) {
    toggle.click();
    return true;
  }
  return false;
}

// Prüft, ob ein <li> gerade ausgeklappt ist
function isExpanded(li) {
  const nestedUl = li?.querySelector("ul");
  return !!nestedUl && nestedUl?.style.display === "block";
}

// Prüft, ob ein <li> gerade eingeklappt ist
function isColapsed(li) {
  const nestedUl = li?.querySelector("ul");
  return !!nestedUl && nestedUl?.style.display !== "block";
}

document.addEventListener("DOMContentLoaded", function () {
  // Verzeichnis-Knoten holen
  const toc = document.getElementById("toc");
  if (!toc) return;

  // 1. Alle LI durchlaufen
  const allLi = toc.querySelectorAll("li");
  allLi.forEach(li => {
    const nestedUl = li.querySelector("ul");  // evtl. Unterliste
    const link = li.querySelector("a");       // Link im LI

    // --------------------
    // Toggle erstellen, falls Unterpunkte existieren
    // --------------------
    if (nestedUl) {
      nestedUl.style.display = "none";        // initial einklappen

      const toggle = document.createElement("span");
      toggle.textContent = " ▶";
      toggle.classList.add("arrow");
      toggle.tabIndex = 0; // Fokusbar
      link.after(toggle);

      const toggleFn = () => {
        const isExpanded = nestedUl.style.display === "block";
        nestedUl.style.display = isExpanded ? "none" : "block";
        toggle.textContent = isExpanded ? " ▶" : " ▼";
      };

      // Maus-Click
      toggle.onclick = toggleFn;

      // Keyboard-Navigation für Toggle-Pfeil
      toggle.addEventListener("keydown", (e) => {
        const allNestedLi = nestedUl?.querySelectorAll("li");
        const mayExpand   = !isExpanded(li);

        if (e.key === "Enter" || e.key === " ") {
          e.preventDefault();
          toggle.click();
        } else if (e.key === "ArrowRight") {
          e.preventDefault();
          if (!mayExpand) return;

          toggle.click();
          if (e.altKey && allNestedLi) {
            allNestedLi.forEach(childLi => expand(childLi)); // Alt+ArrowRight → Unterbaum aufklappen
          }
        } else if (e.key === "ArrowLeft") {
          e.preventDefault();
          if (mayExpand) return;

          toggleFn(); // nur den aktuellen Knoten einklappen
          if (e.altKey && allNestedLi) {
            allNestedLi.forEach(childLi => colapse(childLi)); // Alt+ArrowLeft → Unterbaum einklappen
          }
        }
      });
    }

    // --------------------
    // Keyboard-Navigation auf dem Link selbst
    // --------------------
    if (link) {
      link.addEventListener("keydown", (e) => {
        const allNestedLi = nestedUl?.querySelectorAll("li");
        const mayExpand  = !!allNestedLi && isColapsed(li);
        const mayColapse = !!allNestedLi && isExpanded(li);

        if (e.key === "ArrowRight") {
          e.preventDefault();
          if (!mayExpand) return;

          expand(li);
          if (e.altKey && allNestedLi) {
            allNestedLi.forEach(childLi => expand(childLi));
          }

        } else if (e.key === "ArrowLeft") {
          e.preventDefault();
          if (mayColapse) {
            colapse(li);
            if (e.altKey && allNestedLi) {
              allNestedLi.forEach(childLi => colapse(childLi));
            }
          } else {
            // Pfeil links: zum Eltern-LI wechseln und einklappen, falls nicht schon Top-Level
            const parentLi   = li.parentElement.closest("li");
            const parentLink = parentLi?.querySelector("a");
            if (parentLink) {
              colapse(parentLi);
              parentLink.focus(); // Fokus auf Link, nicht LI selbst
            }
          }            
        }
      });

      // --------------------
      // Alt+Click auf Link → gesamten Unterbaum expand/collapse
      // --------------------
      if (nestedUl) {
        link.addEventListener("click", (e) => {
          const allNestedLi = nestedUl?.querySelectorAll("li");
          const mayExpand  = !!allNestedLi && isColapsed(li);

          if (e.altKey) {
            e.preventDefault(); // Navigation verhindern

            mayExpand ? expand(li) : colapse(li);
            if (allNestedLi) {
              allNestedLi.forEach(childLi => mayExpand ? expand(childLi) : colapse(childLi));
            }
          }        
        });
      }
    }
  });
});
