//token_name	DAX_4000_20200618_(DAXADH)
//token_url	https://etherscan.io//address/0xef906c48b8fde48f5f2ceb448b1163bf964ef4ac#code
//spider_time	2018/07/08 11:26:01
//token_Transactions	3 txns
//token_price	

pragma solidity 		^0.4.21	;						
									
contract	DAX_4000_20200618				{				
									
	mapping (address => uint256) public balanceOf;								
									
	string	public		name =	"	DAX_4000_20200618		"	;
	string	public		symbol =	"	DAXADH		"	;
	uint8	public		decimals =		18			;
									
	uint256 public totalSupply =		14693280768000000000000000					;	
									
	event Transfer(address indexed from, address indexed to, uint256 value);								
									
	function SimpleERC20Token() public {								
		balanceOf[msg.sender] = totalSupply;							
		emit Transfer(address(0), msg.sender, totalSupply);							
	}								
									
	function transfer(address to, uint256 value) public returns (bool success) {								
		require(balanceOf[msg.sender] >= value);							
									
		balanceOf[msg.sender] -= value;  // deduct from sender's balance							
		balanceOf[to] += value;          // add to recipient's balance							
		emit Transfer(msg.sender, to, value);							
		return true;							
	}								
									
	event Approval(address indexed owner, address indexed spender, uint256 value);								
									
	mapping(address => mapping(address => uint256)) public allowance;								
									
	function approve(address spender, uint256 value)								
		public							
		returns (bool success)							
	{								
		allowance[msg.sender][spender] = value;							
		emit Approval(msg.sender, spender, value);							
		return true;							
	}								
									
	function transferFrom(address from, address to, uint256 value)								
		public							
		returns (bool success)							
	{								
		require(value <= balanceOf[from]);							
		require(value <= allowance[from][msg.sender]);							
									
		balanceOf[from] -= value;							
		balanceOf[to] += value;							
		allowance[from][msg.sender] -= value;							
		emit Transfer(from, to, value);							
		return true;							
	}								
}