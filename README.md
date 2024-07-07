## Projeto: **EduToken**

### Visão Geral

**EduToken** é um token baseado em blockchain criado para facilitar o acesso a recursos educacionais, como treinamentos, consultoria, cursos e materiais digitais. Os usuários podem adquirir EduTokens e trocá-los por serviços e produtos educacionais oferecidos por parceiros certificados.

O **EduToken** busca transformar a maneira como a educação é acessada e valorizada, utilizando a tecnologia blockchain para proporcionar uma experiência educacional transparente, acessível e recompensadora.

### Objetivos do Projeto

1. **Facilitar o Acesso à Educação**: Tornar a educação acessível para todos, utilizando a tecnologia blockchain para eliminar intermediários e reduzir custos.
2. **Incentivar a Educação Contínua**: Motivar os indivíduos a continuar aprendendo e desenvolvendo suas habilidades, oferecendo recompensas e incentivos.
3. **Garantir Qualidade e Transparência**: Utilizar a tecnologia blockchain para assegurar a transparência nas transações e garantir que os conteúdos e serviços sejam de alta qualidade.

### Componentes do Projeto

1. **Design do Token**:
   - **Nome do Token**: EduToken ($EDTK)
   - **Símbolo do Toekn**: $EDTK
   - **Decimais do Token**: 18
   - **Padrão do Token**: BEP-20 (Binance Smart Chain)
   - **Total Supply**: 100,000,000 EDU
   - **Distribuição**: A distribuição de EduTokens baseada na resolução de provas e recompensas por desempenho motiva os alunos a se dedicarem aos estudos e oferece uma maneira justa e transparente de recompensar o aprendizado. Com contratos inteligentes para registrar provas, avaliar resultados e distribuir recompensas, o sistema é robusto e resistente a fraudes, garantindo que os EduTokens sejam distribuídos de forma justa e eficiente.

2. **Funcionalidades do Token**:
   - **Troca por Serviços**: Os tokens podem ser trocados por treinamentos, cursos, consultoria e materiais digitais.
   - **Recompensas e Incentivos**: Tokens podem ser ganhados através de programas de recompensa, como completando cursos ou referindo novos usuários.
   - **Staking**: Possibilidade de staking de tokens para obter acesso antecipado a novos cursos ou descontos.

3. **Tecnologias Utilizadas**:
   - **Blockchain**: Binance Smart Chain para criar e gerenciar o token.
   - **Smart Contracts**: Contratos inteligentes para gerenciar transações de tokens e trocas por serviços.
   - **Front-End e Back-End**: Desenvolvimento de um portal web e aplicativos móveis para facilitar o acesso e uso dos tokens.

4. **Governança e Compliance**:
   - **Governança Descentralizada**: Os holders de EduTokens podem participar da governança do projeto, votando em propostas e decisões importantes.
   - **Conformidade Legal**: Assegurar que o projeto esteja em conformidade com as regulamentações locais e internacionais.


## Implantação do  EduToken

Para implantar, você precisará de um ambiente de desenvolvimento Ethereum, como o Foundry

### 1. Configurar o .env (template .env.example)

### 2. Compile o contrato

```shell
forge build
```

### 3. Executar os testes do contrato

  ```shell
  forge test
 ```

### 4. Executar o script de "Deploy" do contrato

```shell
forge script script/EduToken.s.sol:DeployToken   --fork-url $RPC_URL  --broadcast 
```


### 5. Executar o script de "Mint" da token

```shell
forge script script/EduToken.s.sol:MintToken   --fork-url $RPC_URL  --broadcast 
```


### 6. Endereço do contrato na tesnet BSC


Número do contrato: 0x46674914AF6e27f5B8bf4C2bAA7EcdEbE65176A4

BscScan: [https://testnet.bscscan.com/token/0x46674914af6e27f5b8bf4c2baa7ecdebe65176a4]

### 7. Interação com o Contrato

Após a implantação, você pode interagir com o contrato usando a interface do Remix ou outras ferramentas como Web3.js ou Ethers.js. Aqui estão algumas operações que você pode realizar:

- **Verificar o saldo de uma conta**: Use a função `balanceOf(address)` com o endereço da conta.
- **Transferir tokens**: Use a função `transfer(address, uint256)` com o endereço do destinatário e a quantidade de tokens.
- **Aprovar um gasto**: Use a função `approve(address, uint256)` com o endereço do gastador e a quantidade permitida.
- **Transferir tokens em nome de outro usuário**: Use a função `transferFrom(address, address, uint256)` com os endereços do remetente, destinatário e a quantidade de tokens.


## O que é ERC-20 ?

O ERC-20 é um padrão técnico usado para a implementação de tokens no blockchain Ethereum. Esse padrão define uma lista comum de regras que todos os tokens Ethereum devem seguir. O ERC-20 é um dos padrões mais utilizados e permite que desenvolvedores programem como novos tokens serão utilizados na rede Ethereum. Ele estabelece uma interface básica que qualquer contrato inteligente deve implementar, o que garante a interoperabilidade entre diferentes tokens e aplicações descentralizadas (dApps).

### Funcionalidades do ERC-20

O padrão ERC-20 define seis funções principais que todos os contratos de tokens devem implementar:

1. **totalSupply**: Retorna o total de tokens em circulação.
2. **balanceOf**: Retorna o saldo de uma conta específica.
3. **transfer**: Transfere uma quantidade de tokens para um endereço específico.
4. **transferFrom**: Transfere tokens de uma conta para outra, mediante aprovação.
5. **approve**: Aprova uma conta para gastar uma quantidade específica de tokens em nome do dono dos tokens.
6. **allowance**: Retorna a quantidade de tokens que uma conta tem permissão para gastar em nome de outra conta.

### Eventos do ERC-20

Além das funções, o padrão ERC-20 também define dois eventos que devem ser emitidos:

1. **Transfer**: Emitido quando tokens são transferidos de uma conta para outra.
2. **Approval**: Emitido quando o dono dos tokens aprova uma conta para gastar tokens em seu nome.

### Benefícios do ERC-20

- **Interoperabilidade**: Tokens ERC-20 podem ser facilmente integrados em exchanges, carteiras e outras aplicações descentralizadas.
- **Padrão**: Seguir um padrão comum facilita o desenvolvimento e a implementação de novos tokens.
- **Popularidade**: Devido à sua ampla adoção, existem muitos recursos e ferramentas disponíveis para desenvolvimento com ERC-20.

### Referências

PADRÃO DE TOKEN ERC-20 
<https://ethereum.org/pt-br/developers/docs/standards/tokens/erc-20/>

ERC-20: Token Standard
<https://eips.ethereum.org/EIPS/eip-20>

Foundry
<https://book.getfoundry.sh/>
