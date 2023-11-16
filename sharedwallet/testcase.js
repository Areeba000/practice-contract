const { expect } = require("chai");
const { BigNumber } = require("ethers");
const { ethers } = require("hardhat");

describe("SharedWallet", function () {
  let sharedWallet;
  let owner, addr1, addr2;

  before(async () => {
    [owner, addr1, addr2, ...addrs] = await ethers.getSigners();

    const SharedWallet = await ethers.getContractFactory("SharedWallet");
    sharedWallet = await SharedWallet.deploy();
    await sharedWallet.deployed();
  });

  it("should set a new owner", async function () {
    await sharedWallet.connect(owner).setowner(addr1.address);
    const isNewOwner = await sharedWallet._owners(addr1.address);
    expect(isNewOwner).to.be.true;
  });

  it("remove owner",async function () {
    await sharedWallet.connect(owner).removeOwner(addr1.address);
    const isNewOwner = await sharedWallet._owners(addr1.address);
    expect(isNewOwner).to.be.false;
  });

  it("Should withdraw funds correctly", async function () {
    await owner.sendTransaction({
        to: sharedWallet.address,
        value: ethers.utils.parseEther("1.0"),
      });
    await sharedWallet.setowner(owner.address);
    await sharedWallet.connect(owner).withdraw(ethers.utils.parseEther("1"));
    const balance = await ethers.provider.getBalance(sharedWallet.address);
  
    expect(balance.eq(ethers.utils.parseEther("0"))).to.be.true;
   });
  
   it("Should transfer ether correctly", async function () {
    await owner.sendTransaction({
        to: sharedWallet.address,
        value: ethers.utils.parseEther("1.0"),
      });
    await sharedWallet.setowner(owner.address);
    await sharedWallet.connect(owner).transferTo(addr1.address, ethers.utils.parseEther("1.0"));
    const balance = await ethers.provider.getBalance(addr1.address);
  
    expect(balance.eq(ethers.utils.parseEther("1.0"))).to.be.false;
   });
  
});



