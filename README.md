# 🎲 D20Roller

Un smart contract Solidity permettant de lancer un **dé à 20 faces (D20)** directement sur la blockchain **Base Mainnet**.

---

## 🌍 Déploiement

- **Réseau :** Base Mainnet  
- **Adresse du contrat :** [`0x11a3c302CE9072d7024F4841b76964802B21Dd36`](https://basescan.org/address/0x11a3c302CE9072d7024F4841b76964802B21Dd36)  
- **Vérifié sur :** [BaseScan](https://basescan.org/address/0x11a3c302CE9072d7024F4841b76964802B21Dd36#code)

---

## 📜 Description

Ce contrat `D20Roller` permet à n’importe quel utilisateur de lancer un dé virtuel à 20 faces.  
Le résultat, compris entre **1 et 20**, est calculé à partir de variables de bloc pour générer un pseudo-aléatoire simple.  

> ⚠️ **Attention :** cette méthode n’est **pas sécurisée** pour les cas d’usage où l’aléatoire doit être vérifiable (jeux, tirages, etc.).  
> Pour une vraie source d’aléatoire, il est recommandé d’utiliser **Chainlink VRF**.

---

## 🧩 Contrat

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract D20Roller {
    event Rolled(address indexed player, uint256 result);

    function roll() external returns (uint256) {
        uint256 result = (uint256(
            keccak256(abi.encodePacked(block.timestamp, msg.sender, block.prevrandao))
        ) % 20) + 1;
        emit Rolled(msg.sender, result);
        return result;
    }
}
