pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    uint expectedPetId = 0;

    address expectedAdopter = address(this);

    function testUserCanAdoptPet() public {
        uint returnedId = adoption.adopt(expectedPetId);

        Assert.equal(returnedId, expectedPetId, "Adoption of the expected pet should match what is returned");
    }

    function testGetAdopterAddressByPetId() public {
        address resultAdopter = adoption.adopters(expectedPetId);

        Assert.equal(resultAdopter, expectedAdopter, "Owner of the expected pet should be this contract");
    }

    function testGetAdopterAddressByPetIdInArray() public {
        address[16] memory allAdopters = adoption.getAdopters();

        Assert.equal(allAdopters[expectedPetId], expectedAdopter, "Owner of the expected pet should be this contract");
    }
}
