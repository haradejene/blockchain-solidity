# Blockchain & Solidity Course Completion

## Course Completion Certificate

This repository documents the successful completion of our **Blockchain & Solidity Development Course**.

---

## Course Participants

| No. | Name | ID Number |
|-----|------|-----------|
| 1 | Hara Dejene | UGR/30631/15 |
| 2 | Hermela Kassahun | UGR/30673/15 |
| 3 | Tsion Birhanu | UGR/31331/15 |
| 4 | Salahadin Nuredin | UGR/31168/68 |

---

## Course Topics Covered

### 1. Smart Contracts Fundamentals
- Solidity syntax and structure
- Contract deployment and execution
- Gas optimization techniques

### 2. Data Types & Variables
- Value types (uint, bool, address, string)
- Reference types (arrays, structs, mappings)
- Variable scoping and visibility

### 3. Functions & Modifiers
- Function types (view, pure, payable)
- Function modifiers
- Error handling (require, revert, assert)

### 4. Transactions & Calldata
- Transaction mechanics
- Calldata encoding
- Manual function calls

### 5. Escrow Contract
- Multi-party escrow system
- Depositor, beneficiary, arbiter roles
- Fund release mechanism

### 6. Arrays & Structs
- Fixed vs dynamic arrays
- Storage vs memory arrays
- Struct definitions and usage

### 7. Mappings
- Key-value storage
- Nested mappings
- Efficient data retrieval

### 8. Voting System
- Proposal creation
- Vote casting and tracking
- Vote changing functionality
- Automatic execution on threshold

### 9. Inheritance
- Base and derived contracts
- Virtual and override functions
- Multiple inheritance
- Super calls

### 10. Events & Logging
- Event declarations
- Event emission
- Front-end integration

---

## Projects Completed

1. **Token Contract** - Custom token implementation
2. **Escrow Contract** - Secure fund holding and release
3. **Voting DAO** - Decentralized governance system
4. **Hero Game** - Inheritance-based game mechanics
5. **Membership System** - Access control and role management

---

## Tools & Technologies Used

- **Solidity** ^0.8.20
- **Foundry** - Development framework
- **Forge** - Testing and deployment
- **Anvil** - Local blockchain
- **Git & GitHub** - Version control

---

## Repository Structure

| Directory | Description |
|-----------|-------------|
| `course-materials/` | Learning resources and course content |
| `code/` | All smart contract code and examples |
| `notes/` | Personal notes and documentation |
| `screenshots/` | Visual documentation and screenshots |



## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
