require("@nomiclabs/hardhat-waffle");

const fs = require("fs")
const privateKey = fs.readFileSync(".secret").toString()

const projectId = "aME_FC5_Fj6BLr0O_ng99dzicy1O4ye-"

module.exports = {
  networks: {
    hardhat: {
      chainId: 1337
    },
    mumbai: {
      url: `https://polygon-mumbai.g.alchemy.com/v2/${projectId}`,
      accounts: [privateKey]
    },
    mainnet: {
      url: `https://polygon-mainet.g.alchemy.com/v2/${projectId}`,
      accounts: [privateKey]
    }
  },
  solidity: "0.8.4",
};
