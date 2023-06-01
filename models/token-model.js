const mysql = require("mysql");
const { refresh } = require("../controllers/user-controller");

var connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "visual_novel",
});

const Token = {
  create: (userId, refreshToken) => {
    return new Promise((resolve, reject) => {
      const query = "INSERT INTO tokens (user, refreshToken) VALUES (?, ?)";
      const values = [userId, refreshToken];

      connection.query(query, values, (err, results) => {
        if (err) {
          reject(err);
          return;
        }

        const token = {
          id: results.insertId,
          user: userId,
          refreshToken: refreshToken,
        };

        resolve(token);
      });
    });
  },
  findById: (userId) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "SELECT * FROM tokens WHERE user = ?",
        [userId],
        (err, result) => {
          if (err) {
            console.error("Ошибка при поиске пользователя:", err);
            reject(err);
            return;
          }
          resolve(result);
        }
      );
    });
  },
  findByToken: (refreshToken) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "SELECT * FROM tokens WHERE refreshToken = ?",
        [refreshToken],
        (err, result) => {
          if (err) {
            console.error("Ошибка при поиске пользователя:", err);
            reject(err);
            return;
          }
          resolve(result);
        }
      );
    });
  },
  save: function (userId, token) {
    return new Promise((resolve, reject) => {
      const query = `UPDATE tokens SET refreshToken = ? WHERE user = ?`;
      const values = [token, userId];

      connection.query(query, values, (err, results) => {
        if (err) {
          reject(err);
          return;
        }
        resolve(results.affectedRows);
      });
    });
  },
  delete: (refreshToken) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "DELETE FROM tokens WHERE refreshToken = ?",
        [refreshToken],
        (err, result) => {
          if (err) {
            console.error("Ошибка при удалении токена:", err);
            reject(err);
            return;
          }
          resolve(result);
        }
      );
    });
  },
};

module.exports = Token;
