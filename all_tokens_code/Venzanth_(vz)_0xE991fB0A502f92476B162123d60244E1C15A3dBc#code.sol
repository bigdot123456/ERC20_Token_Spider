//token_name	Venzanth_(vz)
//token_url	https://etherscan.io//address/0xE991fB0A502f92476B162123d60244E1C15A3dBc#code
//spider_time	2018/07/08 12:50:12
//token_Transactions	2 txns
//token_price	

contract Venzanth {
    /* Public variables of the token */
    string public standard = 'Venzanth 0.1';
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public initialSupply;
    uint256 public totalSupply;

    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

    /* Initializes contract with initial supply tokens to the creator of the contract */
    function Venzanth() {

         initialSupply = 1000000;
         name ="Venzanth";
         decimals = 0;
         symbol = "vz";
        
        balanceOf[msg.sender] = initialSupply;              // Give the creator all initial tokens
        totalSupply = initialSupply;                        // Update total supply                          
    }
    /* Send coins */
    function transfer(address _to, uint256 _value) {
        if (balanceOf[msg.sender] < _value) throw;           // Check if the sender has enough
        if (balanceOf[_to] + _value < balanceOf[_to]) throw; // Check for overflows
        balanceOf[msg.sender] -= _value;                     // Subtract from the sender
        balanceOf[_to] += _value;                            // Add the same to the recipient
      
    }
    /* This unnamed function is called whenever someone tries to send ether to it */
    function () {
        throw;     // Prevents accidental sending of ether
    }
}