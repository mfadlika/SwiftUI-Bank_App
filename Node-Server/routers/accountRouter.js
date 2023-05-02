const express = require("express");
const { getAccount, postAccount } = require("../controllers/accountController");

const accountRouter = express.Router();

accountRouter.get("/", getAccount);

accountRouter.post("/", postAccount)

module.exports = accountRouter;
