# Exportar red y wallet

```bash
export STARKNET_NETWORK=alpha-goerli
export STARKNET_WALLET=starkware.starknet.wallets.open_zeppelin.OpenZeppelinAccount
```

## Pyenv

Activar Python 3.9 aislado

```bash
pyenv activate cairo_venv
```

## Versiones 

starknet --version
cairo-compile --version
starknet-compile --version

# Actualizar
cd .cairo/

git fetch

git checkout tags/v2.0.0-rc2
cargo build --all --release

# Añadir versión especifica
cd .cairo/

git fetch

git checkout tags/X
cargo build --all --release


## Actualizar Scarb 0.5.0
curl --proto '=https' --tlsv1.2 -sSf https://docs.swmansion.com/scarb/install.sh | bash -s -- -v 0.5.0-alpha.0

## Vs Code
Una vez actualizado y descargado la extension Cairo 1 en VsCode, ir a la configuración de la extensión y añadimos la ruta del `cairo-language-server` que vayamos a usar, revisar la ruta acorde a vuestro archivo

```bash
/home/nadai/.cairo/target/release/cairo-language-server
```

# Compilar
```bash
starknet-compile X.cairo X.json
```

# Declarar
```bash
starknet declare --contract X.json --account Nadai
```

# Deploy
starknet deploy --class_hash 0x6fddb1d03560a9f027e05c161cd391e4ecd840666809f223502bcb9e27fa215 --inputs Xfelt Xfelt --account X


## Pragma
Cuidado espacio en testn 
0x446812bac98c08190dee8967180f4e3cdcd1db9373ca269904acb17f67f7093
ETH/USD = 19514442401534788
BTC/USD = 18669995996566340

starknet-compile PriceFeed.cairo PriceFeed.json

starknet declare --contract PriceFeed.json --account Nadai

* Prueba 1
Contract class hash: 0x475123df9fe4c04d58f242cb5afbc36de34316985ea2a766c2f683bf47bb441
Transaction hash: 0x44df967e90b6636e4a272fb584acec9819ac32737b77bed4b1760e2994d7f2a

starknet deploy --class_hash 0x475123df9fe4c04d58f242cb5afbc36de34316985ea2a766c2f683bf47bb441 --inputs 0x446812bac98c08190dee8967180f4e3cdcd1db9373ca269904acb17f67f7093 19514442401534788 --account Nadai

Sending the transaction with max_fee: 0.000006 ETH (6121500085702 WEI).
Invoke transaction for contract deployment was sent.
Contract address: 0x01c8e76a8dc479357c67ae119bacbda3b4f92821e58a142835c7737ff47853bd
Transaction hash: 0x7f9b8384317c3cd171a4a30a350a590acd8e0e02ac2e6ffbdcd6f0dc4e33230

* Prueba 2 BTC/USD

starknet-compile PriceFeed.cairo PriceFeed.json

starknet declare --contract PriceFeed.json --account Nadai

Contract class hash: 0xf8cd5bb03e4feb41f3a7af81dcee6cbc0e617651ae47276292aede18619c5f
Transaction hash: 0x2570af0c51b0ce82c071284c2f2c4764ab39afd7a0018b56022baa84d3d0342

```bash
starknet deploy --class_hash 0xf8cd5bb03e4feb41f3a7af81dcee6cbc0e617651ae47276292aede18619c5f --inputs 0x446812bac98c08190dee8967180f4e3cdcd1db9373ca269904acb17f67f7093 18669995996566340 --account Nadai
```

Sending the transaction with max_fee: 0.000006 ETH (6121500104066 WEI).
Invoke transaction for contract deployment was sent.
Contract address: 0x073d297ea88a3f3b2d0528a214bc897222b243872521ae02859f2d5bd3d23f86
Transaction hash: 0x623d8f42c2594e050f7ec92f76b3c3639e4cc62e0a6c90b7f264cf7c1824fc3

## ENS

starknet-compile ENS.cairo ENS.json

starknet declare --contract ENS.json --account Nadai

Sending the transaction with max_fee: 0.000001 ETH (1378300052376 WEI).
Declare transaction was sent.
Contract class hash: 0x6fddb1d03560a9f027e05c161cd391e4ecd840666809f223502bcb9e27fa215
Transaction hash: 0x525a2bdc1f57b9c03a620221dd5aa60e9a80124fafaf2e01c384126d03b4abf


starknet deploy --class_hash 0x6fddb1d03560a9f027e05c161cd391e4ecd840666809f223502bcb9e27fa215 --inputs 336641417577 --account Nadai

Sending the transaction with max_fee: 0.000005 ETH (4776200186272 WEI).
Invoke transaction for contract deployment was sent.
Contract address: 0x033aa7e37649cf51b4541a1b576f99abb6137401ca9aa04523b7a506b0192f21
Transaction hash: 0x7f638882abfc06cf8b95de2a192b3089ce7bef00e6d5aa7276059394b776bcb

Añadir ENS
https://testnet.starkscan.co/tx/0x7cad34ffe96f98c5678813008c8c2d062a0fef0b32ef87f5b6b7432c207de99

## Votar 
```bash
starknet-compile Votar.cairo Votar.json
```

starknet declare --contract Votar.json --account Nadai

Sending the transaction with max_fee: 0.000001 ETH (1378300314253 WEI).
Declare transaction was sent.
Contract class hash: 0x2ce8d6a94592d2b47da3902f8b00bd4cd5c575ffd8d0aa33cebd5dbf0eae906
Transaction hash: 0x4d6bce29802a855a95c76595efe03681765f3bc0593c988191594240b2226d8


starknet deploy --class_hash 0x02ce8d6a94592d2b47da3902f8b00bd4cd5c575ffd8d0aa33cebd5dbf0eae906 --inputs 1795950254530259382270168937734171348535331377400385313842303804539016002736 2576485153152103101814659868666844275075629902050884189831195075733091688326 1129738685687880537468674905681849347313318001773551180695869634292384364582 --account Nadai

Sending the transaction with max_fee: 0.000012 ETH (11515903420223 WEI).
Invoke transaction for contract deployment was sent.
Contract address: 0x07cfd595045ddbe08ce5b562f46c0d105af80794380878728634a9e8a84a7942
Transaction hash: 0x5262b3dc24b511f1506a04fd4ef17cf0b120668bccaa282a7805022eb005320

Voto1 2 3
https://testnet.starkscan.co/tx/0x034c649a50e5befa7108e5f29ca721317bd32a17631419a0c48604e82c19450f

https://testnet.starkscan.co/tx/0x03f57abbfaa3f10821fe5c133cc020d1b12c64c170d45531df73fed54eab7fc4

https://testnet.starkscan.co/tx/0x012eca6a8dbc4b122ece748bb54547115bd8584cc5cafb1f83db1e6ff0be3ff9

## Vote 

starknet-compile Vote.cairo Vote.json

starknet declare --contract Vote.json --account Nadai

Sending the transaction with max_fee: 0.000001 ETH (1378300152992 WEI).
Declare transaction was sent.
Contract class hash: 0x44097a96f774810a4b5de39f5d046b8daee6caa4e69a8f2ae30d5af232336c3
Transaction hash: 0x83855d89776952b1309484f2b33dda820060209c9f1207bcfca11d38def6f0

starknet deploy --class_hash 0x44097a96f774810a4b5de39f5d046b8daee6caa4e69a8f2ae30d5af232336c3 --inputs 1795950254530259382270168937734171348535331377400385313842303804539016002736 2576485153152103101814659868666844275075629902050884189831195075733091688326 1129738685687880537468674905681849347313318001773551180695869634292384364582 --account Nadai

Sending the transaction with max_fee: 0.000012 ETH (11515903420223 WEI).
Invoke transaction for contract deployment was sent.
Contract address: 0x0592de11f4e370aba47f0038b77a85343d9a8ace89dc5cc2ac3583ebf820f52d
Transaction hash: 0x765a730af02c53267b939caff28328881d2f737b2d91d3b388e58988def0f1c

## ERC20 
```bash
starknet-compile ERC20.cairo ERC20.json
```

```bash
starknet declare --contract ERC20.json --account Nadai
```

Sending the transaction with max_fee: 0.000001 ETH (1387470794710 WEI).
Declare transaction was sent.
Contract class hash: 0x7db653c91959fd5674c1bb5b8a3938b4b14ac9ecdda9da195ac35fe65cae183
Transaction hash: 0x48b5bb7fa8358c16cc2162fa8441b493f0bc883b146fe199a83fbf3653b6c7d

```bash
starknet deploy --class_hash 0x7db653c91959fd5674c1bb5b8a3938b4b14ac9ecdda9da195ac35fe65cae183 --inputs 336641417577 5128521 1000 0 1795950254530259382270168937734171348535331377400385313842303804539016002736 --account Nadai
```

Sending the transaction with max_fee: 0.000009 ETH (8865223076573 WEI).
Invoke transaction for contract deployment was sent.
Contract address: 0x05ecb0d7f6a32fa713c1568186dfb88392126c48332d04327e4cdea8061696d1
Transaction hash: 0x14081aa8b720286828ff2c9207d726e585e77e6c43af3bbadd90d13ffa3aee2

https://testnet.starkscan.co/contract/0x05ecb0d7f6a32fa713c1568186dfb88392126c48332d04327e4cdea8061696d1#read-write-contract

**Approve** https://testnet.starkscan.co/tx/0xd6ad2a3f22e1f4f6958ae3d5ebe41bd22f8a6dd2dda9c55b6fd7bb6601fd02
**Transfer** https://testnet.starkscan.co/tx/0x7c2785fbf695e58b67cc488aae8acf877226145866aef9f550efcf35ad794e3

## ERC721
```bash
starknet-compile ERC721.cairo ERC721.json
```

```bash
starknet declare --contract ERC721.json --account Nadai
```

Sending the transaction with max_fee: 0.000001 ETH (1487715674268 WEI).
Declare transaction was sent.
Contract class hash: 0x6b1dca7fb9e0166e639a08d5521d2ad854fd023a9d4b2bcbc3c79d510b87fe0
Transaction hash: 0x44d3b2321c8b2bc2c06ff0c11cebb4fad72cc0aba9f7fe603df3ee03658d328

```bash
starknet deploy --class_hash 0x6b1dca7fb9e0166e639a08d5521d2ad854fd023a9d4b2bcbc3c79d510b87fe0 --inputs 336641417577 5129801 --account Nadai
```

Sending the transaction with max_fee: 0.000007 ETH (6609894432026 WEI).
Invoke transaction for contract deployment was sent.
Contract address: 0x041250c83391e1ba8701c39e8eca759525c4d34f87ccfdf5a4d6c35c5282fa5d
Transaction hash: 0x6d169a3a0ce233f7b46546dc995bc4d6cdc779a88d768e0e4a4dc2b4e2c94d1

## ICO 

starknet-compile ICO.cairo ICO.json

starknet declare --contract ENS.json --account Nadai

## Test
Suma
```bash
cairo-test ./tests/suma.cairo
```

Resta
```bash
cairo-test ./tests/resta.cairo
```

Multiplicación
```bash
cairo-test ./tests/multiplicacion.cairo
```

Operaciones
```bash
cairo-test ./tests/operaciones.cairo
```

Test Individuales
```bash
cairo-test ./tests/operaciones.cairo -f resta
```

Test Ignorados
```bash
cairo-test ./tests/operaciones_ignorar.cairo
```

Saltar Test Ignorados
```bash
cairo-test ./tests/operaciones_ignorar.cairo --include-ignored
```

Test Tupla
Podremos pasar valores en booleanos o numericos pero necesitan que sea el valor correcto
```bash
cairo-test ./tests/tupla.cairo
```


## STARKNET CLI
```bash
starknet get_nonce --contract_address
```