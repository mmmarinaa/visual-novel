window.addEventListener('popstate', () => {
    if (location.pathname === '/play') {
      location.href = '/';
    }
  });