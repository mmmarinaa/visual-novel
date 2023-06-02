var mysql = require("mysql");

var connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "visual_novel",
});

exports.getEpisodes = () => {
  return new Promise((resolve, reject) => {
    connection.query("SELECT * FROM episodes", (err, rows) => {
      if (err) {
        reject(err);
      } else {
        resolve(rows);
      }
    });
  });
};

exports.insertUserProgress = (userId, choiceId) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "INSERT INTO progress_user (user_id, dialogue_id) VALUES (?, ?)",
      [userId, choiceId],
      (err, result) => {
        if (err) {
          reject(err);
        } else {
          resolve(result);
        }
      }
    );
  });
};

exports.insertUserPoster = (userId, posterId) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "INSERT INTO posters_user (user_id, poster_id) VALUES (?, ?)",
      [userId, posterId],
      (err, result) => {
        if (err) {
          reject(err);
        } else {
          resolve(result);
        }
      }
    );
  });
};
exports.findUserProgressById = (userId) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT * FROM progress_user WHERE user_id = ?",
      [userId],
      (err, rows) => {
        if (err) {
          reject(err);
        } else {
          resolve(rows);
        }
      }
    );
  });
};

exports.findPosterByUser = (userId, posterId) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT * FROM posters_user WHERE user_id = ? AND poster_id = ?",
      [userId, posterId],
      (err, rows) => {
        if (err) {
          reject(err);
        } else {
          resolve(rows);
        }
      }
    );
  });
};

exports.updateUserProgress = (userId, dialogueId) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "UPDATE progress_user SET dialogue_id = ? WHERE user_id = ?",
      [dialogueId, userId],
      (err, result) => {
        if (err) {
          reject(err);
        } else {
          resolve(result);
        }
      }
    );
  });
};
exports.findPosters = (userId) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT poster_id FROM posters_user WHERE user_id = ?",
      [userId],
      (err, rows) => {
        if (err) {
          reject(err);
        } else {
          resolve(rows);
        }
      }
    );
  });
};
exports.getPosters = (posterIds) => {
  return new Promise((resolve, reject) => {
    const query = "SELECT poster FROM posters WHERE poster_id IN (?)";
    connection.query(query, [posterIds], (err, rows) => {
      if (err) {
        reject(err);
      } else {
        const posters = rows.map((row) => row.poster);
        resolve(posters);
      }
    });
  });
};
exports.findUserById = (userId) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT * FROM users WHERE id = ?",
      [userId],
      (err, rows) => {
        if (err) {
          reject(err);
        } else {
          resolve(rows);
        }
      }
    );
  });
};

exports.getChoices = () => {
  return new Promise((resolve, reject) => {
    connection.query("SELECT * FROM choices", (err, rows) => {
      if (err) {
        reject(err);
      } else {
        resolve(rows);
      }
    });
  });
};

exports.getDialogues = () => {
  return new Promise((resolve, reject) => {
    connection.query("SELECT * FROM dialogues", (err, rows) => {
      if (err) {
        reject(err);
      } else {
        resolve(rows);
      }
    });
  });
};

exports.getBackground = (sceneId) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT img FROM scenes WHERE scene_id = ?",
      [sceneId],
      (err, rows) => {
        if (err) {
          reject(err);
        } else {
          resolve(rows);
        }
      }
    );
  });
};

exports.getCharacter = (characterId) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT img FROM characters WHERE character_id = ?",
      [characterId],
      (err, rows) => {
        if (err) {
          reject(err);
        } else {
          resolve(rows);
        }
      }
    );
  });
};

exports.getChoicesByDialogue = (dialogueId) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT * FROM choices WHERE dialogue_id = ?",
      [dialogueId],
      (err, rows) => {
        if (err) {
          reject(err);
        } else {
          resolve(rows);
        }
      }
    );
  });
};

exports.getDialogueByChoice = (dialogueId) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT text FROM dialogues WHERE dialogue_id = ?",
      [dialogueId],
      (err, rows) => {
        if (err) {
          reject(err);
        } else {
          resolve(rows);
        }
      }
    );
  });
};

exports.getNextDialogueByChoice = (choiceId) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT next_dialogue_id FROM choices WHERE choice_id = ?",
      [choiceId],
      (err, rows) => {
        if (err) {
          reject(err);
        } else {
          resolve(rows);
        }
      }
    );
  });
};
