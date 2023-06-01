document.addEventListener("DOMContentLoaded", () => {
  const overlay = document.querySelector(".overlay");
  overlay.style.display = "flex";
  overlay.querySelector(".modal").classList.add("show-modal");
  document.querySelector("#btn-continue").addEventListener("click", () => {
    overlay.style.display = "none";
    overlay.querySelector(".modal").classList.remove("show-modal");
  });
});
