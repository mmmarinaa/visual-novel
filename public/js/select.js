const choices = document.querySelectorAll("#choice li");
choices.forEach((choice) => {
  choice.addEventListener("click", (event) => {
    const id = choice.id;
    event.preventDefault();

    var params = new URLSearchParams();
    params.set("choice_id", id);

    fetch("/choice", {
      method: "POST",
      body: params,
    })
      .then((response) => response.json())
      .then((data) => {
        const updatedId = data.choice;
        window.location.href = `/play/?id=${updatedId}`;
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  });
});
