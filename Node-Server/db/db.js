const { Account } = require("../models/account");

// const checkingAccount = {
//   name: "John Doe",
//   id: "3eba3fd7-637b-4795-a2e9-69e1c6d929ed",
//   accountType: "checking",
//   balance: 200.0,
// };

// const savingAccount = {
//   name: "John Doe",
//   id: "ed5e34ec-8557-4d6c-a004-5c8594d88d1e",
//   accountType: "saving",
//   balance: 200.0,
// };

let checkingAccount = new Account("John Doe", "checking", 200);
checkingAccount.id = "8ba35e1e-b5b8-47e8-a2a5-062df13fda38";

let savingAccount = new Account("Mary Doe", "saving", 100);
savingAccount.id = "553188b1-586d-4a09-805a-98ab792f5754";

exports.accounts = [checkingAccount, savingAccount];
