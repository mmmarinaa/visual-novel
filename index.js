require("dotenv").config();
const express = require("express");
const cookieParser = require("cookie-parser");
const router = require("./router/index");
const errorMiddleware = require("./middlewares/error-middleware");
const userMiddleware = require("./middlewares/user-middleware");

const app = express();
const PORT = process.env.PORT || 1338;

const start = async () => {
  try {
    app.listen(PORT, () => console.log(`Server started PORT = ${PORT}`));
  } catch (e) {
    console.log(e);
  }
};

const {
  findUserProgressById,
  findPosterByUser,
  findPosters,
  getPosters,
  insertUserPoster,
  updateUserProgress,
  getEpisodes,
  getBackground,
  getDialogues,
  getCharacter,
  getChoicesByDialogue,
  getNextDialogueByChoice,
  insertUserProgress,
} = require("./models/db");

app.use(express.urlencoded({ extended: true }));
app.use(express.static("public"));
app.use("/play", express.static("public"));
app.use(express.json());
app.use(cookieParser());
app.use("/vn", router);
app.use(errorMiddleware);

app.set("view engine", "pug");

app.get("/auth", (req, res) => {
  const check = true;
  res.render("auth-form", { check });
});
app.get("/reg", (req, res) => {
  const check = false;
  res.render("auth-form", { check });
});

app.use(userMiddleware);

app.get("/", async (req, res) => {
  try {
    const episodes = await getEpisodes();
    const episodeTitle = episodes[0].title;
    const episodeDescription = episodes[0].description;
    const episodeCover = episodes[0].cover;

    res.render("start", {
      episodeTitle,
      episodeDescription,
      episodeCover,
    });
  } catch (err) {
    console.error(err);
    res.status(500).send("Internal Server Error");
  }
});

app.post("/choice", async (req, res) => {
  const { choice_id } = req.body;
  try {
    const nextDialogueIdResult = await getNextDialogueByChoice(choice_id);
    const choice = nextDialogueIdResult[0].next_dialogue_id;

    res.json({ choice: choice });
  } catch (err) {
    console.error(err);
    res.status(500).send("Internal Server Error");
  }
});

app.get("/play/", async (req, res) => {
  const userId = res.locals.userId;
  const choice_id = parseInt(req.query.id) - 1;

  if (choice_id == 111) {
    try {
      const episodeEnd = true;
      const posterUser = await findPosterByUser(userId, 2);
      if (posterUser.length == 0) {
        await insertUserPoster(userId, 2);
      }
      const posterIds = await findPosters(userId);
      const posterPaths = await Promise.all(
        posterIds.map((poster) => getPosters(poster.poster_id))
      );
      const paths = posterPaths.map((path) => path[0]);
      const poster = await getPosters(2);

      res.render("posters", { poster: poster, paths: paths, showModal: true });
    } catch (err) {
      console.error(err);
      res.status(500).send("Internal Server Error");
    }
  } else {
    try {
      const dialogues = await getDialogues();
      const choicesByDialogue = await getChoicesByDialogue(
        dialogues[choice_id].dialogue_id
      );
      await updateUserProgress(userId, dialogues[choice_id].dialogue_id);
      const backgroundByDialugue = await getBackground(
        dialogues[choice_id].scene_id
      );
      const characterByDialogue = await getCharacter(
        dialogues[choice_id].character_id
      );

      const dialogue = dialogues[choice_id].text;
      const choices = choicesByDialogue.map((row) => {
        return {
          id: row.choice_id,
          dialogue_id: row.dialogue_id,
          text: row.text,
          next_dialogue_id: row.next_dialogue_id,
        };
      });
      const background = backgroundByDialugue[0].img;

      if (characterByDialogue[0]) {
        const character = characterByDialogue[0].img;
        if (choice_id == 17) {
          const posterUser = await findPosterByUser(userId, 1);
          if (posterUser.length == 0) {
            await insertUserPoster(userId, 1);
          }
          const poster = await getPosters(1);
          res.render("index", {
            dialogue,
            choices,
            background,
            character,
            showModal: true,
            poster,
          });
        } else {
          res.render("index", { dialogue, choices, background, character });
        }
      } else if (choice_id == 75) {
        res.render("task_map", { choices, background });
      } else {
        res.render("home", { choices, background });
      }
    } catch (err) {
      console.error(err);
      res.status(500).send("Internal Server Error");
    }
  }
});

app.get("/posters", async (req, res) => {
  const userId = res.locals.userId;
  const posterIds = await findPosters(userId);
  const posterPaths = await Promise.all(
    posterIds.map((poster) => getPosters(poster.poster_id))
  );
  const paths = posterPaths.map((path) => path[0]);
  res.render("posters", { paths: paths });
});

app.post("/task", (req, res) => {
  const input1 = req.body["input-1"].toLowerCase();
  const input2 = req.body["input-2"].toLowerCase();
  const input3 = req.body["input-3"].toLowerCase();
  const input4 = req.body["input-4"].toLowerCase();
  const background = "img/map.png";
  if (
    input1 === "create" &&
    input2 === "select" &&
    input3 === "delete" &&
    input4 === "update"
  ) {
    res.redirect("/play/?id=77");
  } else {
    res.render("task_map", { error: true, background });
  }
});

app.post("/play", async (req, res) => {
  try {
    const userId = res.locals.userId;
    const user = await findUserProgressById(userId);
    if (user.length > 0) {
      const choice = user[0].dialogue_id;
      await updateUserProgress(userId, choice);
      res.redirect(`/play/?id=${choice}`);
    } else {
      const choice = 1;
      await insertUserProgress(userId, choice);
      res.redirect(`/play/?id=${choice}`);
    }
  } catch (err) {
    console.error(err);
    res.status(500).send("Internal Server Error");
  }
});

start();
