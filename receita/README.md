
# 📖 Livro de Receitas Saudáveis
![C#](https://img.shields.io/badge/C%23-239120?style=for-the-badge&logo=c-sharp&logoColor=white)
![Windows Forms](https://img.shields.io/badge/Windows_Forms-0078D4?style=for-the-badge&logo=windows&logoColor=white)
![Entity Framework](https://img.shields.io/badge/Entity_Framework-512BD4?style=for-the-badge&logo=.net&logoColor=white)
![SQL Server](https://img.shields.io/badge/SQL_Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)


Este é um aplicativo **Desktop (Windows Forms)** desenvolvido para **compartilhar receitas saudáveis**. Ele permite que os usuários **cadastrem, consultem, salvem e organizem receitas** de forma prática.  

A aplicação utiliza **C# com Windows Forms**, **Entity Framework (ADO.NET)** para acesso ao banco de dados, e **SQL Server** como banco de dados relacional.

---

## 💡 Tecnologias Utilizadas

- **C#** com **Windows Forms**
- **Entity Framework (ADO.NET)**
- **SQL Server**
- **Arquitetura em Camadas (MVC - Model, View, Controller)**


---

## 📌 Funcionalidades

🔹 **Modo Tutorial Inicial** para guiar novos usuários  

🔹 **Cadastro e Login de Usuários** com validação de dados  

🔹 **Tela Principal** com listagem de receitas cadastradas  

🔹 **Favoritar Receitas** e acesso rápido às receitas salvas

🔹 **Visualização Detalhada de Receitas**

🔹 **Sugestão Aleatória de Receita**  

🔹 **Perfil Alimentar Personalizado** (ingredientes apreciados e evitados de cada usuário)  

🔹 **Pesquisa, Filtros e Ordenação** de receitas de acordo com: nome, tempo de preparo, ingredientes  


---

### 🚀 Como Usar

### 1️⃣  **Clone este repositório**:

```sh
   git clone https://github.com/seu-usuario/livro-de-receitas.git
````

### 2️⃣ Configure o Banco de Dados
- Execute o scriptLivroReceita.sql para criar o bando de dados.
- Configure a string de conexão no arquivo **App.config**:
- Substitua SEU_SERVIDOR pelo nome do seu servidor SQL Server.

````
<connectionStrings>
    <add name="dbLivroReceita" ... Data Source=SEU_SERVIDOR; />
</connectionStrings>
````

### 3️⃣ Execute o Projeto no Visual Studio
Abra o projeto no Visual Studio e execute-o para testar as funcionalidades.


