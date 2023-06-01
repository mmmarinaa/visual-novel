const Router = require("express").Router;
const userController = require("../controllers/user-controller");
const router = new Router();
const { body } = require("express-validator");
const authMiddleware = require("../middlewares/auth-middleware");

router.post(
  "/registration",
  body("login").notEmpty(),
  body("password").isLength({ min: 3, max: 20 }),
  userController.registration
);
router.post("/login", userController.login);
router.post("/logout", userController.logout);
router.get("/check", authMiddleware, userController.getUsers);
router.get("/refresh", userController.refresh);
//router.get("/startGame", userController.startGame);

module.exports = router;
