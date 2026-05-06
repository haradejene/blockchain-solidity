pragma solidity ^0.8.0;

contract Contract {
    enum Foods { Pizza, Burger, Sushi, Pasta }

    Foods public food1 = Foods.Pizza;
    Foods public food2 = Foods.Burger;
    Foods public food3 = Foods.Sushi;
    Foods public food4 = Foods.Pasta;
}