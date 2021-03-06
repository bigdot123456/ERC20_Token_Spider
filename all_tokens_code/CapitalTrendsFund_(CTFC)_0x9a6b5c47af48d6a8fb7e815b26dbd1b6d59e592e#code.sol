//token_name	CapitalTrendsFund_(CTFC)
//token_url	https://etherscan.io//address/0x9a6b5c47af48d6a8fb7e815b26dbd1b6d59e592e#code
//spider_time	2018/07/08 11:50:28
//token_Transactions	6 txns
//token_price	

pragma solidity ^0.4.19;

contract BaseToken {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    function _transfer(address _from, address _to, uint _value) internal {
        require(_to != 0x0);
        require(balanceOf[_from] >= _value);
        require(balanceOf[_to] + _value > balanceOf[_to]);
        uint previousBalances = balanceOf[_from] + balanceOf[_to];
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
        Transfer(_from, _to, _value);
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        _transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= allowance[_from][msg.sender]);
        allowance[_from][msg.sender] -= _value;
        _transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }
}

contract CustomToken is BaseToken {
    function CustomToken() public {
        totalSupply = 50000000000000000000000000;
        name = 'CapitalTrendsFund';
        symbol = 'CTFC';
        decimals = 18;
        balanceOf[0xa5791f4e7bf0ec01620317cf9f135325a5b47404] = totalSupply;
        Transfer(address(0), 0xa5791f4e7bf0ec01620317cf9f135325a5b47404, totalSupply);
    }
}