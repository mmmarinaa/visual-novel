document
  .getElementById("login-form")
  .addEventListener("submit", function (event) {
    event.preventDefault();

    const login = document.getElementById("login").value;
    const password = document.getElementById("password").value;
    const buttonId = event.submitter.id;

    let url = "";
    if (buttonId === "auth") {
      url = "/vn/login";
    } else if (buttonId === "reg") {
      url = "/vn/registration";
    }

    const xhr = new XMLHttpRequest();
    xhr.open("POST", url);
    xhr.setRequestHeader("Content-Type", "application/json");

    xhr.onreadystatechange = function () {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
          const response = JSON.parse(xhr.responseText);
          const accessToken = response.accessToken;
          const userId = response.user.id;
          localStorage.setItem("accessToken", accessToken);
          document.cookie = `userId=${userId}; path=/`;

          window.location.href = "/";
        } else {
          const errorResponse = JSON.parse(xhr.responseText);
          const errorMessage = errorResponse.message;
          openModal(errorMessage);
        }
      }
    };

    const data = JSON.stringify({ login, password });
    xhr.send(data);
  });

// Открытие модального окна
function openModal(errorMessage) {
  const modal = document.getElementById("modal");
  const errorMessageElement = document.getElementById("error-message");
  errorMessageElement.textContent = errorMessage;
  modal.style.display = "block";
}

// Закрытие модального окна
function closeModal() {
  const modal = document.getElementById("modal");
  modal.style.display = "none";
}

// Обработчик клика по кнопке закрытия модального окна
document.querySelector(".close").addEventListener("click", closeModal);

// Обработчик клика вне модального окна для закрытия
window.addEventListener("click", function (event) {
  const modal = document.getElementById("modal");
  if (event.target === modal) {
    closeModal();
  }
});
