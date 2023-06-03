document.getElementById("exit").addEventListener("click", function (event) {
  event.preventDefault();

  const xhr = new XMLHttpRequest();
  xhr.open("POST", "/vn/logout");
  xhr.setRequestHeader("Content-Type", "application/json");

  xhr.onreadystatechange = function () {
    if (xhr.readyState === XMLHttpRequest.DONE) {
      if (xhr.status === 200) {
        localStorage.removeItem("accessToken");
        document.cookie =
          "userId=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";

        window.location.href = "/auth";
      } else {
        const errorResponse = JSON.parse(xhr.responseText);
        const errorMessage = errorResponse.message;
        openModal(errorMessage);
      }
    }
  };

  xhr.send();
});
