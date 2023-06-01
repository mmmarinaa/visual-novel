const { findUserById } = require("../db.js");

const userMiddleware = async (req, res, next) => {
  try {
    const userId = req.cookies.userId;
    const user = await findUserById(userId);
    const userName = user[0].login;
    res.locals.userId = userId;
    res.locals.userName = userName;
    next();
  } catch (error) {
    res.redirect("/auth");
  }
};

module.exports = userMiddleware;
