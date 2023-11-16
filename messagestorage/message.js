const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("MessageStorage", function () {
 it("change message  correctly", async function () {
   const MessageStorage = await ethers.getContractFactory("MessageStorage");
   const hardhatmsg = await MessageStorage.deploy("abc"); // Use ERC20.deploy() here
   await hardhatmsg.deployed();

   const [owner,addr1] = await ethers.getSigners();
      // Update the message with the correct amount
     await hardhatmsg.connect(addr1).updateMessage("xyz", { value: ethers.utils.parseEther("1") });

      // Check that the message was updated
      expect(await hardhatmsg.message()).to.equal("xyz");

   
    });
    it("updatemessage refund correctly", async function () {
   const MessageStorage = await ethers.getContractFactory("MessageStorage");
   const hardhatmsg = await MessageStorage.deploy("abc"); // Use ERC20.deploy() here
   await hardhatmsg.deployed();

  const [owner,addr1] = await ethers.getSigners();

  const initialBalance = await ethers.provider.getBalance(addr1.address);
   await hardhatmsg.connect(addr1).updateMessage("New Message", { value: ethers.utils.parseEther("0.5") });

   // Check that the message was not updated
    expect(await hardhatmsg.message()).to.not.equal("New Message");

    const finalBalance = await ethers.provider.getBalance(addr1.address);
    expect(finalBalance.gt(initialBalance)).to.be.false;

});
it("ReturnPlace should change the state of newMessage to available", async function () {
    const MessageStorage = await ethers.getContractFactory("MessageStorage");
    const messageStorage = await MessageStorage.deploy("Initial Message");
    await messageStorage.deployed();
 
    const [owner, addr1] = await ethers.getSigners();
 
    // Update the message with the correct amount
    await messageStorage.connect(addr1).updateMessage("New Message", { value: ethers.utils.parseEther("1") });
 
    // Call returnPlace function
    await messageStorage.returnplace();
 
    expect(await messageStorage.getcondition()).to.equal(0); 
  });
});
