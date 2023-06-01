// Проверка авторизации пользователя
function isAuthenticated() {
  // Проверяем наличие access token в localStorage или другом месте
  const accessToken = localStorage.getItem("accessToken");

  // Если access token существует и не пустой, считаем пользователя авторизованным
  if (accessToken && accessToken.trim() !== "") {
    return true;
  }

  // В противном случае считаем пользователя неавторизованным
  return false;
}

// Пример использования
if (!isAuthenticated()) {
  // Пользователь авторизован
  window.location.href = "/auth";
}
