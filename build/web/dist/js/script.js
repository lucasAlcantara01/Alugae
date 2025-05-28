document.querySelectorAll(".btn-drop").forEach((btn) => {
  btn.addEventListener("click", (e) => {
    e.stopPropagation(); 
    const dropdown = btn.nextElementSibling; 

    const isOpen = !dropdown.classList.contains("hidden");

    document.querySelectorAll(".drop").forEach((drop) => {
      drop.classList.add("hidden");
      drop.classList.remove("flex");
    });
    if (!isOpen) {
      dropdown.classList.remove("hidden");
      dropdown.classList.add("flex");
    }
  });
});

document.addEventListener("click", () => {
  document.querySelectorAll(".drop").forEach((drop) => {
    drop.classList.add("hidden");
    drop.classList.remove("flex");
  });
});
