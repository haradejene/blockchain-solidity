pragma solidity ^0.8.20;

contract Contract {
    enum Foods { Apple, Pizza, Injera, Banana }

	Foods public food1 = Foods.Injera ;
	Foods public food2 = Foods.Apple;
	Foods public food3 = Foods.Pizza;
	Foods public food4 = Foods.Banana;
}