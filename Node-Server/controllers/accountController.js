const expressAsyncHandler = require("express-async-handler");
const bcrypt = require("bcryptjs");
const { accounts } = require("../db/db");
const { Account } = require("../models/account");

exports.getAccount = expressAsyncHandler(async (req, res) => {
  res.json(accounts);
});

exports.postAccount = expressAsyncHandler(async (req, res) => {
  const name = req.body.name;
  const accountType = req.body.accountType;
  const balance = req.body.balance;

  const account = new Account(name, accountType, balance);

  account.save((newAccount, error) => {
    if (newAccount) {
      accounts.push(newAccount);
    } else {
      res.json({ success: false, error: error });
    }
  });

  res.json({ success: true });
});

exports.postTransfer = expressAsyncHandler(async (req, res) => {
  const accountFromId = req.body.accountFromId;
  const accountToId = req.body.accountToId;
  const amount = req.body.amount;

  var fromAccount = accounts.find((account) => account.id == accountFromId);
  var toAccount = accounts.find((account) => account.id == accountToId);

  fromAccount.transfer(toAccount, Number(amount), (transferred, error) => {
    if (transferred) {
      res.json({ success: true });
    } else {
      res.json({ success: false, error: error });
    }
  });
});
