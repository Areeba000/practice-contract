// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract AddressBook {
    // Mapping to store a list of addresses for each user
    mapping(address => address[]) private contacts;

    // Mapping to store alias names for each contact
    mapping(address => mapping(address => string)) private aliases;

    // Function to add a contact with an alias
    function addContact(address contactAddress, string memory aliasName) public {
        // Add the contact to the sender's list of contacts
        contacts[msg.sender].push(contactAddress);

        // Set the alias for this contact
        aliases[msg.sender][contactAddress] = aliasName;
    }

    // Function to get the alias for a contact
    function getAlias(address contactAddress) public view returns (string memory) {
        // Return the alias for the specified contact
        return aliases[msg.sender][contactAddress];
    }

    // Function to remove a contact
    function removeContact(address contactAddress) public {
        uint256 length = contacts[msg.sender].length;

        for (uint256 i = 0; i < length; i++) {
            if (contactAddress == contacts[msg.sender][i]) {
                if (contacts[msg.sender].length > 1 && i < length - 1) {
                    // Move the last contact in the list to the position of the contact being removed
                    contacts[msg.sender][i] = contacts[msg.sender][length - 1];
                }

                // Remove the last contact from the list
                contacts[msg.sender].pop();

                // Delete the alias associated with the contact being removed
                delete aliases[msg.sender][contactAddress];

                // Exit the loop after removing the contact
                break;
            }
        }
    }
}
