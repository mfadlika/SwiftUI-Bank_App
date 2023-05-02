const express = require("express");
const dotenv = require("dotenv");
const cors = require("cors");
const path = require("path");
const accountRouter = require("./routers/accountRouter");
const transactionRouter = require("./routers/transactionRouter");

dotenv.config();

const app = express();

app.use(function (req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept"
  );
  next();
});

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use("/api/accounts", accountRouter);
app.use("/api/transfer", transactionRouter)

app.use((err, req, res, next) => {
  res.status(500).send({ message: err.message });
});

const port = process.env.PORT;
app.listen(port, () => {
  console.log(`Serve at http://localhost:${port}`);
});
