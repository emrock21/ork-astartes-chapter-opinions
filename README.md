# Ork Astartes Chapter Opinions Log

An on-chain log of how Orks feel about fighting different Space Marine Chapters.  
Each entry records which Chapter the Orks fought, how they reacted, why they felt that way, and what happened in the scrap.  
The community votes whether each opinion is **WAAAGH-approved** or **not proppa'**.

Fully text-based, permissionless, and designed for Warhammer 40K-flavoured world-building on Base.

---

## Contract

Deployed on Base:  
`0x120eae05f69fb07d177ea47b5ee544d2c31900f6`  
https://basescan.org/address/0x120eae05f69fb07d177ea47b5ee544d2c31900f6#code

Main file: `contracts/OrkAstartesOpinions.sol`

---

## How it works

Each opinion entry stores:

- `chapter` – Space Marine Chapter  
- `reaction` – How the Orks feel about fighting them  
- `reason` – Why the Orks think that  
- `outcome` – What happened in the scrap  
- `remark` – Extra Orky comment  
- `approved` / `rejected` – Community votes  

Entry **0** is a built-in example.

---

## Examples

```solidity
recordOpinion(
  "Space Wolves",
  "DESE WOLFY HUMIES IS DA BEST TA SCRAP WIV!",
  "Dey charge in shoutin', bitin', howlin' an' swingin' big choppas. Proper madboy energy!",
  "Da fight turned into a big messy brawl, lots o' broken bones an' loud laughin'.",
  "Orks say: 'Dese humies fight like Orks, so dey'z alright!'"
);

voteOpinion(1, true);   // WAAAGH-approved
voteOpinion(1, false);  // Not proppa'

Closing Note
A loud, messy ledger of Orky judgments —
which Chapters are worth a proppa' scrap, and which are just shiny gitz wiv too many rulez.


