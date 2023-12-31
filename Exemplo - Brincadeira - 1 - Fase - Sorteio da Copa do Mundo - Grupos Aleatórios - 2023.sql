-- Criando o Banco de Dados --
Create Database Australia2023
Go

-- Desativando a contagem de Linhas --
Set NoCount On
Go

-- Acessando --
Use Australia2023
Go

-- Criando a Tabela HistoricoDeJogos --
Create Table HistoricoJogos
 (CodigoHistoricoJogo Int Identity(1,1) Primary Key Clustered,
  CodigoSimulador Char(1) Not Null,
  CodigoJogo TinyInt Not Null,
  CodigoGrupoSorteio TinyInt Not Null,
  CodigoSelecao1 TinyInt Not Null,
  CodigoSelecao2 TinyInt Not Null,
  CodigoJogoNoGrupo TinyInt Not Null,
  GolsSelecao1 TinyInt Not Null,
  GolsSelecao2 TinyInt Not Null,
  CartoesAmareloSelecao1 TinyInt Not Null,
  CartoesAmareloSelecao2 TinyInt Not Null,
  CartoesVermelhoSelecao1 TinyInt Not Null,
  CartoesVermelhoSelecao2 TinyInt Not Null)
Go

-- Criando a Tabela HistoricoClassificacaoFinal --
Create Table HistoricoClassificacaoGeral
 (CodigoHistoricoClassificacaoGeral Int Identity(1,1) Primary Key Clustered,
  CodigoSimulador Char(1) Not Null,
  CodigoClassificacaoGeral TinyInt Not Null,
  PosicaoClassificacaoGeral TinyInt Default 0,
  CodigoSelecao TinyInt Not Null,
  Jogos TinyInt Default 0,
  Pontos TinyInt Default 0,
  Vitorias TinyInt Default 0,
  Empates TinyInt Default 0,
  Derrotas TinyInt Default 0,
  CartoesAmarelos TinyInt Default 0,
  CartoesVermelhos TinyInt Default 0,
  GolsPro Int Default 0,
  GolsContra Int Default 0,
  SaldoGols Int Default 0)
Go

-- Criando a Tabela HistoricoSimulacao --
Create Table HistoricoSimulacao
 (CodigoHistoricoSimulacao Int Identity(1,1) Primary Key Clustered,
  CodigoSimulador Char(1) Not Null,
  DataHistoricoSimulacao DateTime Default GetDate(),
  Jogo Varchar(100) Not Null,
  Placar Varchar(50) Not Null,
  SelecaoCampea Varchar(30),
  SelecaoVice Varchar(30))
Go

-- Criando a Tabela de Grupos --
Create Table Grupos
 (CodigoGrupo TinyInt Identity(1,1) Primary Key Clustered,
  SiglaGrupo Char(1))
Go

-- Criando a Tabela de Potes --
Create Table Potes
 (CodigoPote TinyInt Identity(1,1) Primary Key Clustered,
  DescricaoPote As (Concat('Pote ',CodigoPote)))
Go

-- Criando a Tabela de Selecoes --
Create Table Selecoes
(CodigoSelecao TinyInt Identity(1,1) Primary Key Clustered,
 CodigoPote TinyInt Not Null,
 NomeSelecao Varchar(30) Not Null,
 SiglaContinente Char(2))
Go

-- Criando a Tabela Sorteios --
Create Table Sorteios
 (CodigoSorteio TinyInt Identity(1,1) Primary Key Clustered,
  CodigoGrupo TinyInt Not Null,
  CodigoSelecao TinyInt Not Null,
  PosicaoGrupo TinyInt Not Null,
  SiglaContinente Char(2) Not Null)
Go

-- Populando as Tabelas --
-- Inserindo os 8 Grupos de Selec�es --
Insert Into Grupos (SiglaGrupo) Values ('A'),('B'),('C'),('D'),('E'),('F'),('G'),('H')
Go

-- Inserindo os 4 Potes --
Insert Into Potes Default Values
Go 4

-- Inserindo as 32 Selecoes --
Insert Into Selecoes (NomeSelecao, CodigoPote, SiglaContinente)
Values ('Nova Zel�ndia',1,'II'), ('Austr�lia',1,'II'),('Jap�o',1,'AA'),('Inglaterra',1,'EU'),('Estados Unidos',1,'AC'),('Fran�a',1,'EU'),('Su�cia',1,'EU'),('Alemanha',1,'EU'),
            ('Noruega',2,'EU'), ('Nig�ria',2,'AF'),('Espanha',2,'EU'),('Dinamarca',2,'EU'),('Holanda',2,'EU'),('Brasil',2,'AS'),('�frica do Sul',2,'AF'),('Marrocos',2,'AF'),
            ('Su��a',3,'EU'), ('Can�d�',3,'AC'),('Zambia',3,'AF'),('China',3,'AA'),('Portugal',3,'EU'),('Jamaica',3,'AC'),('It�lia',3,'EU'),('Colombia',3,'AS'),
            ('Filipinas',4,'AA'), ('Irlanda',4,'EU'),('Costa Rica',4,'AC'),('Haiti',4,'AC'),('Vietnam',4,'AA'),('Panam�',4,'AC'),('Argentina',4,'AS'),('Cor�ia do Sul',4,'AA')
Go

-- Consultando --
Select CodigoGrupo, SiglaGrupo From Grupos
Go

Select CodigoPote, DescricaoPote From Potes
Go

Select CodigoSelecao, NomeSelecao, CodigoPote, SiglaContinente From Selecoes
Go

-- Verificando a exist�ncia de Sorteios anteriores --
If (Select Count(*) From Sorteios) >0
 Truncate Table Sorteios
Go

-- Definindo a Sele��o Dona da Casa no Grupo A posi��o 1 --
Insert Into Sorteios (CodigoGrupo, CodigoSelecao, PosicaoGrupo, SiglaContinente) Values (1,1,1,'AF')
Go

-- Definindo as vari�veis de controle --
Declare @CodigoGrupo TinyInt, @CodigoSelecao TinyInt, @PosicaoGrupo TinyInt, @SiglaContinente Char(2)

-- Definindo as demais Sele��es Cabe�a de Chave e Posi��o 1 --
While (Select Count(CodigoSorteio) From Sorteios) <8
 Begin

 Set @CodigoGrupo = (Select Top 1 CodigoGrupo From Grupos Where CodigoGrupo >1 Order By NEWID())
 Set @CodigoSelecao = (Select Top 1 CodigoSelecao From Selecoes Where CodigoSelecao Between 2 And 8 Order By NEWID())
 Set @PosicaoGrupo = 1
 Set @SiglaContinente = (Select SiglaContinente From Selecoes Where CodigoSelecao = @CodigoSelecao)

 If  (Select Count(CodigoGrupo) From Sorteios Where CodigoGrupo=@CodigoGrupo) = 0
  Begin

   If Not Exists (Select Top 1 CodigoSelecao From Sorteios Where CodigoSelecao = @CodigoSelecao)
    Insert Into Sorteios (CodigoGrupo, CodigoSelecao, PosicaoGrupo, SiglaContinente) Values (@CodigoGrupo, @CodigoSelecao, @PosicaoGrupo, @SiglaContinente)
  End
End
Go

-- Realizando o Sorteio dos Grupos de Selecoes --
-- Definindo as vari�veis de controle --
Declare @CodigoGrupo TinyInt, @CodigoPote TinyInt, @CodigoSelecao TinyInt, @PosicaoGrupo TinyInt, @SiglaContinente Char(2)

Set @CodigoPote = 2

While (Select Count(CodigoSorteio) From Sorteios) <32
Begin
 
 Set @CodigoGrupo = (Select Top 1 CodigoGrupo From Grupos Order By NEWID()) 
 
 Set @CodigoSelecao = (Select Top 1 CodigoSelecao From Selecoes Where CodigoSelecao >=9 And CodigoPote = @CodigoPote Order By NEWID())
 Set @SiglaContinente = (Select SiglaContinente From Selecoes Where CodigoSelecao = @CodigoSelecao)
  
 If Not Exists (Select CodigoSelecao From Sorteios Where CodigoSelecao = @CodigoSelecao) 
  Begin
 
   If (Select Count(CodigoGrupo) From Sorteios Where CodigoGrupo=@CodigoGrupo) <4
    Begin

	 If (Select Count(CodigoGrupo) From Sorteios Where CodigoGrupo = @CodigoGrupo And SiglaContinente = @SiglaContinente) <=3
	  Set @PosicaoGrupo = (Select Count(CodigoGrupo)+1 From Sorteios Where CodigoGrupo = @CodigoGrupo)
	 Else 
	  Begin
       Set @CodigoGrupo = (Select Top 1 CodigoGrupo From Grupos Where CodigoGrupo <> @CodigoGrupo Order By NEWID()) 
	   Set @PosicaoGrupo = (Select Count(CodigoGrupo)+1 From Sorteios Where CodigoGrupo = @CodigoGrupo)
	  End

	  Insert Into Sorteios (CodigoGrupo, CodigoSelecao, PosicaoGrupo, SiglaContinente) Values (@CodigoGrupo, @CodigoSelecao, @PosicaoGrupo, @SiglaContinente)

          If (Select Count(CodigoSorteio) From Sorteios) In (16,24,32)
           Set @CodigoPote = @CodigoPote+1
    End
  End
End
Go

-- Consultando o grupo de cada Sele��o Cabe�a de Chave --
Select G.SiglaGrupo As Grupo, SE.NomeSelecao As 'Sele��o', S.SiglaContinente As 'Continente'
From Sorteios S Inner Join Grupos G
                           On S.CodigoGrupo = G.CodigoGrupo
 					      Inner Join Selecoes SE
						   On S.CodigoSelecao = SE.CodigoSelecao
Go

-- Realizando o Sorteio dos Grupos de Selecoes --
-- Definindo as vari�veis de controle --
Declare @CodigoGrupo TinyInt, @CodigoSelecao TinyInt, @PosicaoGrupo TinyInt, @SiglaContinente Char(2)

While (Select Count(CodigoSorteio) From Sorteios) <32
Begin

 Set @CodigoGrupo = (Select Top 1 CodigoGrupo From Grupos Order By NEWID()) 
 Set @CodigoSelecao = (Select Top 1 CodigoSelecao From Selecoes Where CodigoSelecao >=9 Order By NEWID())
 Set @SiglaContinente = (Select SiglaContinente From Selecoes Where CodigoSelecao = @CodigoSelecao)
  
 If Not Exists (Select CodigoSelecao From Sorteios Where CodigoSelecao = @CodigoSelecao) 
  Begin
 
   If (Select Count(CodigoGrupo) From Sorteios Where CodigoGrupo=@CodigoGrupo) <4
    Begin

	 If (Select Count(CodigoGrupo) From Sorteios Where CodigoGrupo = @CodigoGrupo And SiglaContinente = @SiglaContinente) <=2
	  Set @PosicaoGrupo = (Select Count(CodigoGrupo)+1 From Sorteios Where CodigoGrupo = @CodigoGrupo)
	 Else 
	  Begin
       Set @CodigoGrupo = (Select Top 1 CodigoGrupo From Grupos Where CodigoGrupo <> @CodigoGrupo Order By NEWID()) 
	   Set @PosicaoGrupo = (Select Count(CodigoGrupo)+1 From Sorteios Where CodigoGrupo = @CodigoGrupo)
	  End

	  Insert Into Sorteios (CodigoGrupo, CodigoSelecao, PosicaoGrupo, SiglaContinente) Values (@CodigoGrupo, @CodigoSelecao, @PosicaoGrupo, @SiglaContinente)
    End
  End
End
Go

-- Consultando a forma��o completa de cada Grupo de Sele��es --
;With CTEGrupoA (Posicao, NomeSelecao)
As
(Select PosicaoGrupo, SE.NomeSelecao From Sorteios S Inner Join Selecoes SE
                                                                                           On S.CodigoSelecao = SE.CodigoSelecao
																						   And S.CodigoGrupo = 1),
CTEGrupoB (Posicao, NomeSelecao)
As
(Select PosicaoGrupo, SE.NomeSelecao From Sorteios S Inner Join Selecoes SE
                                                                                           On S.CodigoSelecao = SE.CodigoSelecao
																						   And S.CodigoGrupo = 2),
CTEGrupoC (Posicao, NomeSelecao)
As
(Select PosicaoGrupo, SE.NomeSelecao From Sorteios S Inner Join Selecoes SE
                                                                                           On S.CodigoSelecao = SE.CodigoSelecao
																						   And S.CodigoGrupo = 3),
CTEGrupoD (Posicao, NomeSelecao)
As
(Select PosicaoGrupo, SE.NomeSelecao From Sorteios S Inner Join Selecoes SE
                                                                                           On S.CodigoSelecao = SE.CodigoSelecao
 																						   And S.CodigoGrupo = 4),
CTEGrupoE (Posicao, NomeSelecao)
As
(Select PosicaoGrupo, SE.NomeSelecao From Sorteios S Inner Join Selecoes SE
                                                                                           On S.CodigoSelecao = SE.CodigoSelecao
 																						   And S.CodigoGrupo = 5),
CTEGrupoF (Posicao, NomeSelecao)
As
(Select PosicaoGrupo, SE.NomeSelecao From Sorteios S Inner Join Selecoes SE
                                                                                           On S.CodigoSelecao = SE.CodigoSelecao
 																						   And S.CodigoGrupo = 6),
 CTEGrupoG (Posicao, NomeSelecao)
As
(Select PosicaoGrupo, SE.NomeSelecao From Sorteios S Inner Join Selecoes SE
                                                                                           On S.CodigoSelecao = SE.CodigoSelecao
 																						   And S.CodigoGrupo = 7),
CTEGrupoH (Posicao, NomeSelecao)
As
(Select PosicaoGrupo, SE.NomeSelecao From Sorteios S Inner Join Selecoes SE
                                                                                           On S.CodigoSelecao = SE.CodigoSelecao
 																						   And S.CodigoGrupo = 8)
Select Row_Number() Over(Order By A.Posicao) As 'Pote',
           A.NomeSelecao As 'Grupo A', B.NomeSelecao As 'Grupo B', 
           C.NomeSelecao As 'Grupo C', D.NomeSelecao As 'Grupo D',
           E.NomeSelecao As 'Grupo E', F.NomeSelecao As 'Grupo F',
		   G.NomeSelecao As 'Grupo G', H.NomeSelecao As 'Grupo H'
From CTEGrupoA A Inner Join CTEGrupoB B
                                On A.Posicao = B.Posicao
							   Inner Join CTEGrupoC C
                                On A.Posicao = C.Posicao
							   Inner Join CTEGrupoD D
                                On A.Posicao = D.Posicao
							   Inner Join CTEGrupoE E
                                On A.Posicao = E.Posicao
							   Inner Join CTEGrupoF F
                                On A.Posicao = F.Posicao
							   Inner Join CTEGrupoG G
                                On A.Posicao = G.Posicao
							   Inner Join CTEGrupoH H
                                On A.Posicao = H.Posicao
Go