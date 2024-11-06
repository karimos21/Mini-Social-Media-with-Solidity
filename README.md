# Mini-Social-Media-with-Solidity

Je comprends la question ! Dans un smart contract Ethereum, **chaque compte peut interagir avec le même contrat déployé** sur la blockchain, car les smart contracts sont **publics et accessibles à tous**. Ainsi, plusieurs comptes peuvent utiliser un même contrat et y enregistrer des informations (comme des messages) sans avoir besoin de déployer plusieurs instances du contrat.

Voici comment cela fonctionne avec un seul contrat dans votre cas.

### Fonctionnement du Smart Contract MiniSocial avec plusieurs Comptes

1. **Déploiement Unique** :
   - Le smart contract **MiniSocial** est déployé une seule fois sur la blockchain.
   - Il possède une adresse unique qui est publique et accessible à tout le monde sur le réseau (par exemple, le réseau de test Sepolia).

2. **Accessibilité du Contrat pour Tous les Comptes** :
   - Une fois déployé, n'importe quel compte Ethereum peut interagir avec ce contrat en appelant ses fonctions.
   - Dans votre cas, tout utilisateur possédant une adresse Ethereum (compte MetaMask) peut appeler les fonctions `publishPost`, `getPost`, et `getTotalPosts` de **MiniSocial** pour publier ou lire des messages.

3. **Séparation des Données par Adresse** :
   - Dans votre fonction `publishPost`, chaque message est enregistré avec `msg.sender` qui représente l’adresse de l’utilisateur (le compte) qui a appelé la fonction.
   - Cela signifie que chaque fois qu’un compte différent publie un message, **le contrat enregistre l’adresse de ce compte avec le message**.
   - Ainsi, même si tous les comptes utilisent le même contrat, chaque message est associé à l'adresse spécifique de l'auteur.

### Exemple de Scénario avec Plusieurs Comptes Utilisant le Même Contrat

Supposons que vous avez déployé le contrat **MiniSocial** et que son adresse est `0x123...ABC`. Voici comment plusieurs comptes peuvent interagir avec ce contrat :

1. **Compte A** (adresse `0xA...1`) appelle `publishPost` :
   - Ce compte envoie un message `"Hello from Account A"`.
   - Dans le contrat, le message est enregistré comme `Post("Hello from Account A", 0xA...1)`.

2. **Compte B** (adresse `0xB...2`) appelle `publishPost` :
   - Ce compte envoie un autre message `"Hello from Account B"`.
   - Le contrat enregistre ce message comme `Post("Hello from Account B", 0xB...2)`.

3. **Récupération des Messages** :
   - Lorsque vous appelez `getPost` pour chaque message, vous verrez le message et l'adresse de l'auteur.
   - Le contrat a ainsi enregistré chaque message avec l'adresse unique de l'utilisateur, même si tous les comptes utilisent le même contrat.

### Code Solidity Explicatif (MiniSocial)

Voici le code pour rappeler comment le contrat stocke l’adresse de l’utilisateur (`msg.sender`) avec chaque message :


### Test de Fonctionnement avec plusieurs Comptes

1. **Déployer le contrat** sur un réseau de test.
2. **Connecter différents comptes** dans MetaMask et publier des messages en appelant `publishPost`.
3. **Récupérer les messages** en appelant `getPost` pour voir chaque message associé à l'adresse unique de son auteur.

### Résumé

- **Un seul contrat** déployé sur la blockchain est suffisant.
- **Chaque compte** peut publier des messages en appelant la même fonction `publishPost`.
- **L’adresse de chaque compte** est enregistrée avec le message grâce à `msg.sender`, permettant ainsi de différencier chaque auteur.

Ainsi, même avec un seul contrat, tous les comptes peuvent l’utiliser pour publier des messages, et le contrat enregistre les messages de chaque compte de manière distincte.
