//SPDX-License-Identifier:MIT

pragma solidity >0.8.4 <= 0.9.4;

contract myERC20token {

    event Transfer(address from, address to, uint256 noOfTokens);
    event Approve(address owner, address spender, uint256 noOfTokens);

string public myTokenName = "Ramya";
uint256 public totalTokens = 1000;

mapping (address => uint256) balances;
mapping (address => mapping(address => uint256)) approvedTokens;

function balanceOf (address account) public view returns (uint256)
{
    return balances[account];
}

function totalSupply() public view returns (uint256)
{
    return totalTokens;
}

function transfer(address receiver, uint noOfTokens)public returns (bool)
{
    if(balances[msg.sender] > noOfTokens)
    {
    balances[msg.sender] -= noOfTokens;
    balances[receiver] += noOfTokens;
    emit Transfer(msg.sender,receiver,noOfTokens);
    return true;
    }
}

function approve(address spender,uint256 noOfTokens) public returns (bool)
{
    if(balances[msg.sender] > noOfTokens){
    approvedTokens[msg.sender][spender] = noOfTokens;
    emit Approve(msg.sender,spender,noOfTokens);
    return true;
    }
}

function transferFrom(address owner,address buyer, uint256 noOfTokens) public returns (bool)
    
    {
    require (balances[owner] > noOfTokens);
    require (approvedTokens[owner][msg.sender] > noOfTokens);

    balances[owner] -= noOfTokens;
    balances[buyer] += noOfTokens;
    approvedTokens[owner][msg.sender] -=noOfTokens;
    emit Transfer(owner,buyer,noOfTokens);
    return true;
}

}
