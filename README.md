# Mini-Social-Media-with-Solidity

### Fonctionnement du Smart Contract MiniSocial

1. **Déploiement Unique** :
   - Le smart contract **MiniSocial** est déployé une seule fois sur la blockchain.
   - Il possède une adresse unique qui est publique et accessible à tout le monde sur le réseau de test Sepolia.

2. **Accessibilité du Contrat pour Tous les Comptes** :
   - Une fois déployé, n'importe quel compte Ethereum peut interagir avec ce contrat en appelant ses fonctions.
   - Dans notre cas, tout utilisateur possédant une adresse Ethereum (compte MetaMask) peut appeler les fonctions `publishPost`, `getPost`, et `getTotalPosts` de **MiniSocial** pour publier ou lire des messages.

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
