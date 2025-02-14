CREATE DATABASE [dbLivroReceita]
GO

USE [dbLivroReceita]
GO
/****** Object:  Table [dbo].[Ingrediente]    Script Date: 14/11/2024 14:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingrediente](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[nome] [nvarchar](255) NULL,
	[ItemTipoID] [int] NULL,
 CONSTRAINT [PK_recipeItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IngredientesReceita]    Script Date: 14/11/2024 14:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IngredientesReceita](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReceitaID] [int] NULL,
	[IngredienteID] [int] NULL,
	[qtdGramas] [int] NULL,
 CONSTRAINT [PK_usersRecipesIngredients] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotaReceita]    Script Date: 14/11/2024 14:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotaReceita](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReceitaID] [int] NULL,
	[UsuarioID] [int] NULL,
	[nota] [int] NULL,
 CONSTRAINT [PK_recipesRating] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 14/11/2024 14:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfil](
	[idPerfil] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NULL,
	[idIngrediente] [int] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Perfil] PRIMARY KEY CLUSTERED 
(
	[idPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcedimentoReceitas]    Script Date: 14/11/2024 14:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcedimentoReceitas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[userRecipeID] [int] NULL,
	[step] [nvarchar](255) NULL,
	[stepSequence] [int] NULL,
 CONSTRAINT [PK_usersRecipesProcedures] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReceitaFavorira]    Script Date: 14/11/2024 14:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceitaFavorira](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NULL,
	[ReceitaID] [int] NULL,
	[saved] [int] NULL,
 CONSTRAINT [PK_userFavoriteRecipes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoReceita]    Script Date: 14/11/2024 14:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoReceita](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_recipeType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposItem]    Script Date: 14/11/2024 14:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [nvarchar](255) NULL,
 CONSTRAINT [PK_ItemTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 14/11/2024 14:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](255) NULL,
	[nome] [nvarchar](255) NULL,
	[senha] [nvarchar](255) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioReceita]    Script Date: 14/11/2024 14:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioReceita](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NULL,
	[NomeReceita] [nvarchar](255) NULL,
	[TipoReceitaID] [int] NULL,
	[TempoMinutos] [int] NULL,
 CONSTRAINT [PK_userRecipes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ingrediente] ON 
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (1, N'Ham', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (2, N'Butter', 2)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (3, N'Bitter Herba Mystica', 2)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (4, N'Sweet Herba Mystica', 2)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (5, N'Salty Herba Mystica', 2)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (6, N'Sour Herba Mystica', 2)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (7, N'Spicy Herba Mystica', 2)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (8, N'Lettuce', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (9, N'Bacon', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (10, N'Pepper', 2)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (11, N'Strawberry', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (12, N'Jam', 2)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (13, N'Yogurt', 2)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (14, N'Pineapple', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (15, N'Banana', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (16, N'Peanut Butter', 2)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (17, N'Pickle', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (18, N'Olive oil', 2)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (19, N'Watercress', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (20, N'Basil', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (21, N'Cheese', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (22, N'Marmalade', 2)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (23, N'Cream Cheese', 2)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (24, N'Herbed Sausage', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (25, N'Ketchup', 2)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (26, N'Mustard', 2)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (27, N'Rice', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (28, N'Curry Powder', 2)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (29, N'Mayonnaise', 2)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (30, N'Jalapeno', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (31, N'Tomato', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (32, N'Apple', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (33, N'Whipped Cream', 2)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (34, N'Kiwi', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (35, N'Klawf Stick', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (36, N'Avocado', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (37, N'Smoked Fillet', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (38, N'Salt', 2)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (39, N'Noodles', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (40, N'Chorizo', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (41, N'Potato Salad', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (42, N'Cucumber', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (43, N'Red Bell Pepper', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (44, N'Red Onion', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (45, N'Onion', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (46, N'Chili Sauce', 2)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (47, N'Green Bell Pepper', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (48, N'Egg', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (49, N'Prosciutto', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (50, N'Potato Tortilla', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (51, N'Cherry Tomatoes', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (52, N'Fried Fillet', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (53, N'Horseradish', 2)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (54, N'Hamburger', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (55, N'Vinegar', 2)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (56, N'Wasabi', 2)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (57, N'Yellow Bell Pepper', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (58, N'Tofu', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (59, N'Tomatos', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (60, N'Cabbage', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (61, N'Taco', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (62, N'Slice Bread', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (63, N'Whole milk', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (64, N'Sugar', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (65, N'Blackberry', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (66, N'Water', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (67, N'Milk', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (68, N'Flavour', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (69, N'Sodium citrate', 1)
GO
INSERT [dbo].[Ingrediente] ([ID], [nome], [ItemTipoID]) VALUES (70, N'Sucralose', 1)
GO
SET IDENTITY_INSERT [dbo].[Ingrediente] OFF
GO
SET IDENTITY_INSERT [dbo].[IngredientesReceita] ON 
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (1, 1, 59, 485)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (2, 2, 60, 473)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (3, 3, 61, 206)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (4, 4, 62, 299)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (5, 5, 63, 323)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (6, 6, 64, 662)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (7, 7, 11, 249)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (8, 8, 65, 187)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (9, 9, 66, 691)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (10, 10, 67, 526)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (11, 1, 68, 442)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (12, 2, 69, 719)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (13, 3, 70, 540)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (14, 4, 59, 351)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (15, 5, 60, 110)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (16, 6, 61, 396)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (17, 7, 62, 822)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (18, 8, 63, 307)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (19, 9, 64, 651)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (20, 10, 11, 198)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (21, 1, 65, 140)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (22, 2, 66, 719)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (23, 3, 67, 458)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (24, 4, 68, 470)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (25, 5, 69, 342)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (26, 6, 70, 181)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (27, 7, 59, 631)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (28, 8, 60, 831)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (29, 9, 61, 861)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (30, 10, 62, 299)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (31, 1, 63, 596)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (32, 2, 64, 531)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (33, 3, 11, 751)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (34, 4, 65, 493)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (35, 5, 66, 446)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (36, 6, 67, 846)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (37, 7, 68, 131)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (38, 8, 69, 489)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (39, 9, 70, 755)
GO
INSERT [dbo].[IngredientesReceita] ([ID], [ReceitaID], [IngredienteID], [qtdGramas]) VALUES (40, 10, 70, 781)
GO
SET IDENTITY_INSERT [dbo].[IngredientesReceita] OFF
GO
SET IDENTITY_INSERT [dbo].[NotaReceita] ON 
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (1, 1, 6, 4)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (2, 2, 6, 4)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (3, 3, 6, 4)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (4, 4, 6, 4)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (5, 5, 6, 1)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (6, 6, 6, 3)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (7, 7, 6, 4)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (8, 8, 6, 1)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (9, 9, 6, 2)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (10, 10, 6, 5)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (11, 1, 7, 5)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (12, 2, 7, 3)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (13, 3, 7, 4)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (14, 4, 7, 5)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (15, 5, 7, 5)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (16, 6, 7, 5)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (17, 7, 7, 1)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (18, 8, 7, 3)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (19, 9, 7, 2)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (20, 10, 7, 1)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (21, 1, 8, 4)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (22, 2, 8, 4)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (23, 3, 8, 2)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (24, 4, 8, 3)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (25, 5, 8, 2)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (26, 6, 8, 2)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (27, 7, 8, 4)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (28, 8, 8, 5)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (29, 9, 8, 5)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (30, 10, 8, 1)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (31, 1, 9, 5)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (32, 2, 9, 1)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (33, 3, 9, 3)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (34, 4, 9, 5)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (35, 5, 9, 2)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (36, 6, 9, 4)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (37, 7, 9, 1)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (38, 8, 9, 4)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (39, 9, 9, 2)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (40, 10, 9, 1)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (41, 1, 10, 5)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (42, 2, 10, 1)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (43, 3, 10, 3)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (44, 4, 10, 4)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (45, 5, 10, 3)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (46, 6, 10, 2)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (47, 7, 10, 3)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (48, 8, 10, 1)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (49, 9, 10, 2)
GO
INSERT [dbo].[NotaReceita] ([ID], [ReceitaID], [UsuarioID], [nota]) VALUES (50, 10, 10, 3)
GO
SET IDENTITY_INSERT [dbo].[NotaReceita] OFF
GO
SET IDENTITY_INSERT [dbo].[ProcedimentoReceitas] ON 
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (1, 1, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa.', 1)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (2, 2, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit', 1)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (3, 3, N'Donec hendrerit, felis et imperdiet euismod, purus ipsum pretium metus, in lacinia nulla nisl eget sapien', 1)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (4, 4, N'Sed velit urna, interdum vel, ultricies vel, faucibus at, quam', 1)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (5, 5, N' Maecenas porttitor congue massa', 1)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (6, 6, N' Donec ut est in lectus consequat consequat', 1)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (7, 7, N' Donec elit est, consectetuer eget, consequat quis, tempus quis, wisi', 1)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (8, 8, N' Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna', 1)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (9, 9, N' Etiam eget dui', 1)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (10, 10, N' In in nunc', 1)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (11, 1, N' Nunc viverra imperdiet enim', 2)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (12, 2, N' Aliquam erat volutpat', 2)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (13, 3, N' Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos', 2)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (14, 4, N' Fusce est', 2)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (15, 5, N' Sed at lorem in nunc porta tristique', 2)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (16, 6, N' Donec ullamcorper fringilla eros', 2)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (17, 7, N' Vivamus a tellus', 2)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (18, 8, N' Proin nec augue', 2)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (19, 9, N' Fusce in sapien eu purus dapibus commodo', 2)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (20, 10, N' Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas', 2)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (21, 1, N' Quisque aliquam tempor magna', 3)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (22, 2, N' Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus', 3)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (23, 3, N' Proin pharetra nonummy pede', 3)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (24, 4, N' Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas', 3)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (25, 5, N' Cras faucibus condimentum odio', 3)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (26, 6, N' Mauris et orci', 3)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (27, 7, N' Nunc ac magna', 3)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (28, 8, N' Sed ac ligula', 3)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (29, 9, N' Aenean nec lorem', 3)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (30, 10, N' Maecenas odio dolor, vulputate vel, auctor ac, accumsan id, felis', 3)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (31, 1, N' Aliquam at eros', 3)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (32, 2, N' In porttitor', 3)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (33, 3, N' Pellentesque cursus sagittis felis', 3)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (34, 4, N' Etiam at ligula et tellus ullamcorper ultrices', 3)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (35, 5, N' Donec laoreet nonummy augue', 3)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (36, 6, N' Pellentesque porttitor, velit lacinia egestas auctor, diam eros tempus arcu, nec vulputate augue magna vel risus', 3)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (37, 7, N' In fermentum, lorem non cursus porttitor, diam urna accumsan lacus, sed interdum wisi nibh nec nisl', 3)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (38, 8, N' Suspendisse dui purus, scelerisque at, vulputate vitae, pretium mattis, nunc', 3)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (39, 9, N' Cras non magna vel ante adipiscing rhoncus', 3)
GO
INSERT [dbo].[ProcedimentoReceitas] ([ID], [userRecipeID], [step], [stepSequence]) VALUES (40, 10, N' Ut tincidunt volutpat urna', 3)
GO
SET IDENTITY_INSERT [dbo].[ProcedimentoReceitas] OFF
GO
SET IDENTITY_INSERT [dbo].[ReceitaFavorira] ON 
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (2, 1, 2, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (3, 1, 3, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (4, 1, 4, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (6, 1, 6, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (10, 1, 10, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (12, 2, 2, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (14, 2, 4, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (15, 2, 5, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (17, 2, 7, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (23, 3, 3, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (26, 3, 6, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (27, 3, 7, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (28, 3, 8, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (30, 3, 10, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (31, 4, 1, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (34, 4, 4, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (39, 4, 9, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (45, 5, 5, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (47, 5, 7, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (48, 5, 8, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (50, 5, 10, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (51, 6, 1, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (52, 6, 2, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (54, 6, 4, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (56, 6, 6, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (57, 6, 7, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (59, 6, 9, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (60, 6, 10, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (67, 7, 7, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (68, 7, 8, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (69, 7, 9, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (70, 7, 10, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (73, 8, 3, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (76, 8, 6, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (77, 8, 7, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (78, 8, 8, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (79, 8, 9, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (80, 8, 10, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (85, 9, 5, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (87, 9, 7, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (88, 9, 8, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (89, 9, 9, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (90, 9, 10, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (91, 10, 1, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (92, 10, 2, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (93, 10, 3, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (98, 10, 8, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (99, 10, 9, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (100, 10, 10, 1)
GO
INSERT [dbo].[ReceitaFavorira] ([ID], [UsuarioID], [ReceitaID], [saved]) VALUES (106, 1, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[ReceitaFavorira] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoReceita] ON 
GO
INSERT [dbo].[TipoReceita] ([Id], [Name]) VALUES (1, N'Indian')
GO
INSERT [dbo].[TipoReceita] ([Id], [Name]) VALUES (2, N'Italian')
GO
INSERT [dbo].[TipoReceita] ([Id], [Name]) VALUES (3, N'Asian')
GO
INSERT [dbo].[TipoReceita] ([Id], [Name]) VALUES (4, N'Chinese')
GO
INSERT [dbo].[TipoReceita] ([Id], [Name]) VALUES (5, N'Fruit')
GO
INSERT [dbo].[TipoReceita] ([Id], [Name]) VALUES (6, N'Vegetables')
GO
INSERT [dbo].[TipoReceita] ([Id], [Name]) VALUES (7, N'Protein')
GO
INSERT [dbo].[TipoReceita] ([Id], [Name]) VALUES (8, N'Cereal')
GO
INSERT [dbo].[TipoReceita] ([Id], [Name]) VALUES (9, N'Local Dishes')
GO
SET IDENTITY_INSERT [dbo].[TipoReceita] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposItem] ON 
GO
INSERT [dbo].[TiposItem] ([ID], [tipo]) VALUES (1, N'Ingredient')
GO
INSERT [dbo].[TiposItem] ([ID], [tipo]) VALUES (2, N'Seasoning')
GO
SET IDENTITY_INSERT [dbo].[TiposItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([id], [email], [nome], [senha]) VALUES (1, N'Andersen@email.com', N'Andersen Alvarez', N'abcdefgh')
GO
INSERT [dbo].[Usuario] ([id], [email], [nome], [senha]) VALUES (2, N'Weiler@email.com', N'Weiler Alvarez', N'abcdef23')
GO
INSERT [dbo].[Usuario] ([id], [email], [nome], [senha]) VALUES (3, N'Kelley@email.com', N'Kelley Alvarez', N'ab23efgh')
GO
INSERT [dbo].[Usuario] ([id], [email], [nome], [senha]) VALUES (4, N'Sato@email.com', N'Sato Alvarez', N'abcd56gh')
GO
INSERT [dbo].[Usuario] ([id], [email], [nome], [senha]) VALUES (5, N'Hernandez-Echevarria@email.com', N'Hernandez-Echevarria Alvarez', N'abc45fgh')
GO
INSERT [dbo].[Usuario] ([id], [email], [nome], [senha]) VALUES (6, N'Hayakawa@email.com', N'Hayakawa Alvarez', N'abcde89h')
GO
INSERT [dbo].[Usuario] ([id], [email], [nome], [senha]) VALUES (7, N'Glasson@email.com', N'Glasson Alvarez', N'abcde77h')
GO
INSERT [dbo].[Usuario] ([id], [email], [nome], [senha]) VALUES (8, N'Dunton@email.com', N'Dunton Alvarez', N'84cdefgh')
GO
INSERT [dbo].[Usuario] ([id], [email], [nome], [senha]) VALUES (9, N'Sandberg@email.com', N'Sandberg Alvarez', N'22cdefgh')
GO
INSERT [dbo].[Usuario] ([id], [email], [nome], [senha]) VALUES (10, N'Sousa@email.com', N'Sousa Alvarez', N'33cdefgh')
GO
INSERT [dbo].[Usuario] ([id], [email], [nome], [senha]) VALUES (11, N'dfas@email.com', N'gustaov lima', N'123456789')
GO
INSERT [dbo].[Usuario] ([id], [email], [nome], [senha]) VALUES (12, N'fdas@.com', N'fds fdsa', N'12345678')
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[UsuarioReceita] ON 
GO
INSERT [dbo].[UsuarioReceita] ([id], [UsuarioID], [NomeReceita], [TipoReceitaID], [TempoMinutos]) VALUES (1, 1, N'Classic greek salad', 1, 10)
GO
INSERT [dbo].[UsuarioReceita] ([id], [UsuarioID], [NomeReceita], [TipoReceitaID], [TempoMinutos]) VALUES (2, 2, N'Crunchy nut coleslaw', 2, 30)
GO
INSERT [dbo].[UsuarioReceita] ([id], [UsuarioID], [NomeReceita], [TipoReceitaID], [TempoMinutos]) VALUES (3, 3, N'Shrimp chicken andouille', 3, 45)
GO
INSERT [dbo].[UsuarioReceita] ([id], [UsuarioID], [NomeReceita], [TipoReceitaID], [TempoMinutos]) VALUES (4, 4, N'Barbecue chicken jolloff', 4, 100)
GO
INSERT [dbo].[UsuarioReceita] ([id], [UsuarioID], [NomeReceita], [TipoReceitaID], [TempoMinutos]) VALUES (5, 5, N'chicken noodle soup casserole', 5, 50)
GO
INSERT [dbo].[UsuarioReceita] ([id], [UsuarioID], [NomeReceita], [TipoReceitaID], [TempoMinutos]) VALUES (6, 1, N'Taco stuffed shells', 6, 25)
GO
INSERT [dbo].[UsuarioReceita] ([id], [UsuarioID], [NomeReceita], [TipoReceitaID], [TempoMinutos]) VALUES (7, 2, N'Garlic parmesan butter', 7, 35)
GO
INSERT [dbo].[UsuarioReceita] ([id], [UsuarioID], [NomeReceita], [TipoReceitaID], [TempoMinutos]) VALUES (8, 3, N'Pepper Jack chicken', 8, 40)
GO
INSERT [dbo].[UsuarioReceita] ([id], [UsuarioID], [NomeReceita], [TipoReceitaID], [TempoMinutos]) VALUES (9, 4, N'French onion chicken', 9, 32)
GO
INSERT [dbo].[UsuarioReceita] ([id], [UsuarioID], [NomeReceita], [TipoReceitaID], [TempoMinutos]) VALUES (10, 5, N'Garlic chicken and potatoes', 7, 30)
GO
SET IDENTITY_INSERT [dbo].[UsuarioReceita] OFF
GO
ALTER TABLE [dbo].[Ingrediente]  WITH CHECK ADD  CONSTRAINT [FK_recipeItems_ItemTypes] FOREIGN KEY([ItemTipoID])
REFERENCES [dbo].[TiposItem] ([ID])
GO
ALTER TABLE [dbo].[Ingrediente] CHECK CONSTRAINT [FK_recipeItems_ItemTypes]
GO
ALTER TABLE [dbo].[IngredientesReceita]  WITH CHECK ADD  CONSTRAINT [FK_IngredientesReceita_Ingrediente] FOREIGN KEY([IngredienteID])
REFERENCES [dbo].[Ingrediente] ([ID])
GO
ALTER TABLE [dbo].[IngredientesReceita] CHECK CONSTRAINT [FK_IngredientesReceita_Ingrediente]
GO
ALTER TABLE [dbo].[IngredientesReceita]  WITH CHECK ADD  CONSTRAINT [FK_IngredientesReceita_UsuarioReceita] FOREIGN KEY([ReceitaID])
REFERENCES [dbo].[UsuarioReceita] ([id])
GO
ALTER TABLE [dbo].[IngredientesReceita] CHECK CONSTRAINT [FK_IngredientesReceita_UsuarioReceita]
GO
ALTER TABLE [dbo].[NotaReceita]  WITH CHECK ADD  CONSTRAINT [FK_recipesRating_userRecipes] FOREIGN KEY([ReceitaID])
REFERENCES [dbo].[UsuarioReceita] ([id])
GO
ALTER TABLE [dbo].[NotaReceita] CHECK CONSTRAINT [FK_recipesRating_userRecipes]
GO
ALTER TABLE [dbo].[NotaReceita]  WITH CHECK ADD  CONSTRAINT [FK_recipesRating_users] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[NotaReceita] CHECK CONSTRAINT [FK_recipesRating_users]
GO
ALTER TABLE [dbo].[Perfil]  WITH CHECK ADD  CONSTRAINT [FK_Perfil_Ingrediente] FOREIGN KEY([idIngrediente])
REFERENCES [dbo].[Ingrediente] ([ID])
GO
ALTER TABLE [dbo].[Perfil] CHECK CONSTRAINT [FK_Perfil_Ingrediente]
GO
ALTER TABLE [dbo].[Perfil]  WITH CHECK ADD  CONSTRAINT [FK_Perfil_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Perfil] CHECK CONSTRAINT [FK_Perfil_Usuario]
GO
ALTER TABLE [dbo].[ProcedimentoReceitas]  WITH CHECK ADD  CONSTRAINT [FK_usersRecipesProcedures_userRecipes] FOREIGN KEY([userRecipeID])
REFERENCES [dbo].[UsuarioReceita] ([id])
GO
ALTER TABLE [dbo].[ProcedimentoReceitas] CHECK CONSTRAINT [FK_usersRecipesProcedures_userRecipes]
GO
ALTER TABLE [dbo].[ReceitaFavorira]  WITH CHECK ADD  CONSTRAINT [FK_userFavoriteRecipes_userRecipes] FOREIGN KEY([ReceitaID])
REFERENCES [dbo].[UsuarioReceita] ([id])
GO
ALTER TABLE [dbo].[ReceitaFavorira] CHECK CONSTRAINT [FK_userFavoriteRecipes_userRecipes]
GO
ALTER TABLE [dbo].[ReceitaFavorira]  WITH CHECK ADD  CONSTRAINT [FK_userFavoriteRecipes_users] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[ReceitaFavorira] CHECK CONSTRAINT [FK_userFavoriteRecipes_users]
GO
ALTER TABLE [dbo].[UsuarioReceita]  WITH CHECK ADD  CONSTRAINT [FK_userRecipes_recipeType] FOREIGN KEY([TipoReceitaID])
REFERENCES [dbo].[TipoReceita] ([Id])
GO
ALTER TABLE [dbo].[UsuarioReceita] CHECK CONSTRAINT [FK_userRecipes_recipeType]
GO
ALTER TABLE [dbo].[UsuarioReceita]  WITH CHECK ADD  CONSTRAINT [FK_userRecipes_users] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[UsuarioReceita] CHECK CONSTRAINT [FK_userRecipes_users]
GO
