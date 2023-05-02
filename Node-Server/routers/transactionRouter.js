const express = require("express");
const { postTransfer } = require("../controllers/accountController");

const transactionRouter = express.Router();

transactionRouter.post("/", postTransfer);

module.exports = transactionRouter;
