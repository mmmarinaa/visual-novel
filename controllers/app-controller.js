class AppController {
  startGame(req, res, next) {
    res.render("start");
  }
}

module.exports = new AppController();
