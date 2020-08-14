//version of the compiler
pragma solidity ^0.4.11;


// Orion: Virtual cryptocurrency name!!


// Code for smart contract!

contract Orion_ico {
    
    // Max no of coins available for sale
    uint public max_orions = 1000000;
    
    // Conversion rate from USD to Orions
    uint public USD_to_orions = 100;     // 1USD == 100 Orions
    
    //Total coins bought by different inverstors
    uint public total_orions_bought = 0;
    
    //Equity/Share of each investor in Orions(Coins)
    mapping(address => uint)equity_orion;
    
    //Equity/Share of each investor in Orions(Coins)
    mapping(address => uint)equity_USD;
    
    // Checking if the investor can buy the coins or not!!
    
    modifier can_buy_orions(uint USD_invested){
        require(USD_invested*USD_to_orions + total_orions_bought <+ max_orions);
        _;
    }
    
    // Getting equity of investors in Coins(orions)
    
    function equity_in_orion(address investor) external constant returns (uint){
        return equity_orion[investor];
    }
    
        
    // Getting equity of investors in USD
    
    function equity_in_USD(address investor) external constant returns (uint){
        return equity_USD[investor];
    }
    
    
    
    //Buying the coins!!
    
    function buy_orions(address investor, uint usd_invested) external
    can_buy_orions(usd_invested){
        uint orions_bought = usd_invested*USD_to_orions;
        equity_orion[investor] += orions_bought;
        equity_USD[investor] = equity_orion[investor]/100;
        total_orions_bought += orions_bought;
    }
    
    
    // Selling the coins(orions)
    
    function sell_orions(address investor, uint orion_Sold) external {
        equity_orion[investor] -= orion_Sold;
        equity_USD[investor] = equity_orion[investor]/100;
        total_orions_bought -= orion_Sold;
    }
    
    
}
