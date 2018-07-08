//token_name	astorgame_(ASTOR)
//token_url	https://etherscan.io//address/0x63c94b6221b4021b564f4563ec72688655b2604a#code
//spider_time	2018/07/08 12:51:52
//token_Transactions	1643 txns
//token_price	

pragma solidity ^0.4.18;
//Stder A.M.
interface tokenRecipient { function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData) public; }
//variables publicas
contract astorgame {
    string public name;
    string public symbol;
//cantidad de decimales 3
    uint8 public decimals = 3;
    uint256 public totalSupply;
//creamos un array con todos los balances
    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);

    function astorgame() public {
        uint256 initialSupply=100000000;
        totalSupply =  initialSupply * 10 ** uint256(decimals);    
        balanceOf[msg.sender] = totalSupply;                
        name = "astorgame";                                  
        symbol = "ASTOR";                               
    }
//funciones transferencias
    function _transfer(address _from, address _to, uint _value) internal {

        require(_to != 0x0);
        require(balanceOf[_from] >= _value);
        require(balanceOf[_to] + _value > balanceOf[_to]);
        uint previousBalances = balanceOf[_from] + balanceOf[_to];
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        Transfer(_from, _to, _value);
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }

    function transfer(address _to, uint256 _value) public {
        _transfer(msg.sender, _to, _value);
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= allowance[_from][msg.sender]);    
        allowance[_from][msg.sender] -= _value;
        _transfer(_from, _to, _value);
        return true;
    }
//funciones basicas para aprobaciones
    function approve(address _spender, uint256 _value) public
        returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        return true;
    }

    function approveAndCall(address _spender, uint256 _value, bytes _extraData)
        public
        returns (bool success) {
        tokenRecipient spender = tokenRecipient(_spender);
        if (approve(_spender, _value)) {
            spender.receiveApproval(msg.sender, _value, this, _extraData);
            return true;
        }
    }

}