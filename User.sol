pragma solidity ^0.6.12;
import "Bitacora.sol";
import "Resource.sol";
// SPDX-License-Identifier: jclopezpimentel
contract User{
    //privates
    address user;  //user address
    address father; //father address
    string typeu;
    mapping (address=> bool) exists; // existing resources
    mapping (Resource => Resource) resources;
    Bitacora bitacora; // user's bitacora
    //public methods
    constructor(address nuser_, string memory typeuser) public{
        user = nuser_; //assigning who is the new user
        typeu = typeuser;
        father = msg.sender; //assigning who is the father
    /*    userStruct memory nuserS = userStruct(nuser_,"Admor",nuser_);
        users[nuser_] = nuserS; */
        string memory log = "Creating user";
        bitacora = new Bitacora(log);
    }
    function getOwner() public view returns(address){
        return user;
    }
    function addResource(string memory resourceDescription) public{
        require(msg.sender == user); //only the user can execute this function
        Resource resource = new Resource(resourceDescription);
        //address  addResource = resource.getAddress(resource);
        resources[resource] = resource;
        string memory log = "Creating user";
        bitacora.addLog(log);
    }
    function getTypeUser() public view returns(string memory){
        return typeu;
    }
    function getBitacora() public view returns(Bitacora){
        require(msg.sender == user); //only the owner can execute this function
        return (bitacora);
    }
}
