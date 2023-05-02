const { accounts } = require("../db/db");
const { uuidv4 } = require("../utils/uuidv4");

exports.Account = class Account {
  constructor(name, accountType, balance) {
    this.id = "";
    this.name = name;
    this.accountType = accountType;
    this.balance = balance;
  }

  transfer(toAccount, amount, completion) {
    if (this.balance - amount < 0) {
      completion(false, "Insufficient funds!");
    } else {
      this.withdraw(amount);
      toAccount.deposit(amount);
      completion(true);
    }
  }

  withdraw(amount) {
    this.balance -= amount;
  }

  deposit(amount) {
    this.balance += amount;
  }

  save(completion) {
    const account = this.getAccountByNameAndType(this.name, this.accountType);

    if (!account) {
      this.id = uuidv4();
      completion(this);
    } else {
      completion(null, "User already has this type of account");
    }
  }

  getAccountByNameAndType(name, type) {
    return accounts.find(
      (account) => account.name == name && account.accountType == type
    );
  }
};
