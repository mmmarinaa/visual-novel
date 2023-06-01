const mysql = require("mysql");

var connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "visual_novel",
});

const User = {
  create: (login, password) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "INSERT INTO users (login, password) VALUES (?, ?)",
        [login, password],
        (err, result) => {
          if (err) {
            console.error("Ошибка при создании пользователя:", err);
            reject(err);
            return;
          }

          // Получаем идентификатор вставленной записи
          const userId = result.insertId;

          // Создаем объект пользователя
          const user = {
            id: userId,
            login: login,
            password: password,
          };

          resolve(user);
        }
      );
    });
  },
  findByLogin: (login) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "SELECT * FROM users WHERE login = ?",
        [login],
        (err, result) => {
          if (err) {
            console.error("Ошибка при поиске пользователя:", err);
            reject(err);
            return;
          }

          if (result.length === 0) {
            resolve(null); // Если пользователь не найден, возвращаем null
            return;
          }

          const user = {
            id: result[0].id,
            login: result[0].login,
            password: result[0].password,
          };

          resolve(user);
        }
      );
    });
  },
  findById: (userId) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "SELECT * FROM users WHERE id = ?",
        [userId],
        (err, result) => {
          if (err) {
            console.error("Ошибка при поиске пользователя:", err);
            reject(err);
            return;
          }

          if (result.length === 0) {
            resolve(null); // Если пользователь не найден, возвращаем null
            return;
          }

          const user = {
            id: result[0].id,
            login: result[0].login,
            password: result[0].password,
          };

          resolve(user);
        }
      );
    });
  },
  find: () => {
    return new Promise((resolve, reject) => {
      connection.query("SELECT * FROM users", (err, result) => {
        if (err) {
          console.error("Ошибка при поиске пользователей:", err);
          reject(err);
          return;
        }

        if (result.length === 0) {
          resolve([]); // Если пользователи не найдены, возвращаем пустой массив
          return;
        }

        const users = result.map((row) => {
          return {
            id: row.id,
            login: row.login,
            password: row.password,
          };
        });

        resolve(users);
      });
    });
  },
};

module.exports = User;
