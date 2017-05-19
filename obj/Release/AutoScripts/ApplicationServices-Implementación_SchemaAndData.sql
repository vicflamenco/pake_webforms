SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[base](
	[idbase] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](45) COLLATE Modern_Spanish_CI_AS NULL,
	[precio] [decimal](18, 2) NULL,
	[imagen] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_base] PRIMARY KEY CLUSTERED 
(
	[idbase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crema](
	[idcrema] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](45) COLLATE Modern_Spanish_CI_AS NULL,
	[precio] [decimal](18, 2) NULL,
	[imagen] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_crema] PRIMARY KEY CLUSTERED 
(
	[idcrema] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diseno](
	[iddiseno] [int] IDENTITY(1,1) NOT NULL,
	[idtopping] [int] NOT NULL,
	[idcrema] [int] NOT NULL,
	[idbase] [int] NOT NULL,
	[nombre] [varchar](45) COLLATE Modern_Spanish_CI_AS NULL,
	[idusuario] [nvarchar](256) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_diseno] PRIMARY KEY CLUSTERED 
(
	[iddiseno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pedido](
	[idpedido] [int] IDENTITY(1,1) NOT NULL,
	[idusuario] [nvarchar](256) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[fecha] [date] NULL,
	[fecha_entrega] [date] NULL,
	[dir_entrega] [varchar](45) COLLATE Modern_Spanish_CI_AS NULL,
	[dir_factura] [varchar](45) COLLATE Modern_Spanish_CI_AS NULL,
	[entregado] [bit] NULL,
	[anulado] [bit] NULL,
	[cargo_extra] [decimal](18, 2) NULL,
	[subtotal] [decimal](18, 2) NULL,
	[iva] [decimal](18, 2) NULL,
	[total] [decimal](18, 2) NULL,
 CONSTRAINT [PK_pedido] PRIMARY KEY CLUSTERED 
(
	[idpedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pedido.detalle](
	[iddetalle] [int] IDENTITY(1,1) NOT NULL,
	[iddiseno] [int] NOT NULL,
	[idpedido] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_pedido.detalle] PRIMARY KEY CLUSTERED 
(
	[iddetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[idrol] [int] NOT NULL,
	[nombre] [varchar](45) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[idrol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[topping](
	[idtopping] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](45) COLLATE Modern_Spanish_CI_AS NULL,
	[precio] [decimal](18, 2) NULL,
	[imagen] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_topping] PRIMARY KEY CLUSTERED 
(
	[idtopping] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[idusuario] [nvarchar](256) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[nombre] [varchar](45) COLLATE Modern_Spanish_CI_AS NULL,
	[telefono] [varchar](8) COLLATE Modern_Spanish_CI_AS NULL,
	[dui] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[correo] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[clave] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[admin] [bit] NOT NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[idusuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[voto](
	[idlike] [int] IDENTITY(1,1) NOT NULL,
	[positivo] [bit] NOT NULL,
	[iddiseno] [int] NOT NULL,
	[idusuario] [nvarchar](256) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_voto] PRIMARY KEY CLUSTERED 
(
	[idlike] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET IDENTITY_INSERT [dbo].[base] ON 

GO
INSERT [dbo].[base] ([idbase], [nombre], [precio], [imagen]) VALUES (1, N'Verde', CAST(1.00 AS Decimal(18, 2)), N'B2.png')
GO
INSERT [dbo].[base] ([idbase], [nombre], [precio], [imagen]) VALUES (5, N'Verde', CAST(1.00 AS Decimal(18, 2)), N'B3.png')
GO
INSERT [dbo].[base] ([idbase], [nombre], [precio], [imagen]) VALUES (6, N'Roja', CAST(1.00 AS Decimal(18, 2)), N'B4.png')
GO
INSERT [dbo].[base] ([idbase], [nombre], [precio], [imagen]) VALUES (7, N'Azul', CAST(1.35 AS Decimal(18, 2)), N'B6.png')
GO
INSERT [dbo].[base] ([idbase], [nombre], [precio], [imagen]) VALUES (8, N'Celeste', CAST(1.00 AS Decimal(18, 2)), N'B7.png')
GO
SET IDENTITY_INSERT [dbo].[base] OFF
GO
SET IDENTITY_INSERT [dbo].[crema] ON 

GO
INSERT [dbo].[crema] ([idcrema], [nombre], [precio], [imagen]) VALUES (1, N'Crema 1', CAST(0.20 AS Decimal(18, 2)), N'C1.png')
GO
INSERT [dbo].[crema] ([idcrema], [nombre], [precio], [imagen]) VALUES (2, N'Crema 2', CAST(0.20 AS Decimal(18, 2)), N'C7.png')
GO
INSERT [dbo].[crema] ([idcrema], [nombre], [precio], [imagen]) VALUES (3, N'Crema 3', CAST(0.25 AS Decimal(18, 2)), N'C6.png')
GO
SET IDENTITY_INSERT [dbo].[crema] OFF
GO
SET IDENTITY_INSERT [dbo].[diseno] ON 

GO
INSERT [dbo].[diseno] ([iddiseno], [idtopping], [idcrema], [idbase], [nombre], [idusuario]) VALUES (4, 3, 2, 6, N'Diseño 1', N'anonimo')
GO
INSERT [dbo].[diseno] ([iddiseno], [idtopping], [idcrema], [idbase], [nombre], [idusuario]) VALUES (5, 5, 1, 5, N'Diseño 2', N'kgKevGomez')
GO
INSERT [dbo].[diseno] ([iddiseno], [idtopping], [idcrema], [idbase], [nombre], [idusuario]) VALUES (6, 2, 2, 6, N'Diseño 3', N'kgKevGomez')
GO
INSERT [dbo].[diseno] ([iddiseno], [idtopping], [idcrema], [idbase], [nombre], [idusuario]) VALUES (7, 4, 1, 8, N'Diseño 4', N'kgKevGomez')
GO
SET IDENTITY_INSERT [dbo].[diseno] OFF
GO
SET IDENTITY_INSERT [dbo].[pedido] ON 

GO
INSERT [dbo].[pedido] ([idpedido], [idusuario], [fecha], [fecha_entrega], [dir_entrega], [dir_factura], [entregado], [anulado], [cargo_extra], [subtotal], [iva], [total]) VALUES (1, N'kgKevGomez', CAST(0xBB380B00 AS Date), CAST(0xCB380B00 AS Date), N'5', N'256', NULL, NULL, NULL, CAST(2.90 AS Decimal(18, 2)), CAST(0.37 AS Decimal(18, 2)), CAST(3.27 AS Decimal(18, 2)))
GO
INSERT [dbo].[pedido] ([idpedido], [idusuario], [fecha], [fecha_entrega], [dir_entrega], [dir_factura], [entregado], [anulado], [cargo_extra], [subtotal], [iva], [total]) VALUES (2, N'admin', CAST(0xBC380B00 AS Date), CAST(0xCB380B00 AS Date), N'Casa', N'Oficina', NULL, NULL, NULL, CAST(58.00 AS Decimal(18, 2)), CAST(7.54 AS Decimal(18, 2)), CAST(65.54 AS Decimal(18, 2)))
GO
INSERT [dbo].[pedido] ([idpedido], [idusuario], [fecha], [fecha_entrega], [dir_entrega], [dir_factura], [entregado], [anulado], [cargo_extra], [subtotal], [iva], [total]) VALUES (3, N'kgKevGomez', CAST(0xBC380B00 AS Date), CAST(0xC7380B00 AS Date), N'Casa', N'Oficina', NULL, NULL, NULL, CAST(907.00 AS Decimal(18, 2)), CAST(117.91 AS Decimal(18, 2)), CAST(1024.91 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[pedido] OFF
GO
SET IDENTITY_INSERT [dbo].[pedido.detalle] ON 

GO
INSERT [dbo].[pedido.detalle] ([iddetalle], [iddiseno], [idpedido], [cantidad], [precio]) VALUES (1, 4, 1, 2, CAST(1.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[pedido.detalle] ([iddetalle], [iddiseno], [idpedido], [cantidad], [precio]) VALUES (2, 4, 2, 40, CAST(1.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[pedido.detalle] ([iddetalle], [iddiseno], [idpedido], [cantidad], [precio]) VALUES (3, 5, 3, 100, CAST(1.60 AS Decimal(18, 2)))
GO
INSERT [dbo].[pedido.detalle] ([iddetalle], [iddiseno], [idpedido], [cantidad], [precio]) VALUES (4, 4, 3, 60, CAST(1.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[pedido.detalle] ([iddetalle], [iddiseno], [idpedido], [cantidad], [precio]) VALUES (5, 6, 3, 150, CAST(1.40 AS Decimal(18, 2)))
GO
INSERT [dbo].[pedido.detalle] ([iddetalle], [iddiseno], [idpedido], [cantidad], [precio]) VALUES (6, 7, 3, 300, CAST(1.50 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[pedido.detalle] OFF
GO
INSERT [dbo].[roles] ([idrol], [nombre]) VALUES (1, N'Cliente')
GO
INSERT [dbo].[roles] ([idrol], [nombre]) VALUES (2, N'Administrador')
GO
SET IDENTITY_INSERT [dbo].[topping] ON 

GO
INSERT [dbo].[topping] ([idtopping], [nombre], [precio], [imagen]) VALUES (1, N'Topping 1', CAST(0.35 AS Decimal(18, 2)), N'T1.png')
GO
INSERT [dbo].[topping] ([idtopping], [nombre], [precio], [imagen]) VALUES (2, N'Topping 2', CAST(0.20 AS Decimal(18, 2)), N'T7.png')
GO
INSERT [dbo].[topping] ([idtopping], [nombre], [precio], [imagen]) VALUES (3, N'Topping 3', CAST(0.25 AS Decimal(18, 2)), N'T5.png')
GO
INSERT [dbo].[topping] ([idtopping], [nombre], [precio], [imagen]) VALUES (4, N'Topping 4', CAST(0.30 AS Decimal(18, 2)), N'T3.png')
GO
INSERT [dbo].[topping] ([idtopping], [nombre], [precio], [imagen]) VALUES (5, N'Topping 5', CAST(0.40 AS Decimal(18, 2)), N'T6.png')
GO
INSERT [dbo].[topping] ([idtopping], [nombre], [precio], [imagen]) VALUES (6, N'Topping 6', CAST(0.45 AS Decimal(18, 2)), N'T2.png')
GO
SET IDENTITY_INSERT [dbo].[topping] OFF
GO
INSERT [dbo].[usuarios] ([idusuario], [nombre], [telefono], [dui], [correo], [clave], [admin]) VALUES (N'admin', N'admin', N'', N'', N'', N'123456', 1)
GO
INSERT [dbo].[usuarios] ([idusuario], [nombre], [telefono], [dui], [correo], [clave], [admin]) VALUES (N'anonimo', N'anonimo', N'', N'', N'', N'anonimo', 0)
GO
INSERT [dbo].[usuarios] ([idusuario], [nombre], [telefono], [dui], [correo], [clave], [admin]) VALUES (N'kgKevGomez', NULL, NULL, NULL, N'kevingomezh@hotmail.com', N'123456', 0)
GO
ALTER TABLE [dbo].[pedido] ADD  CONSTRAINT [DF__pedido__entregad__276EDEB3]  DEFAULT ((0)) FOR [entregado]
GO
ALTER TABLE [dbo].[pedido] ADD  CONSTRAINT [DF__pedido__anulado__286302EC]  DEFAULT ((0)) FOR [anulado]
GO
ALTER TABLE [dbo].[pedido] ADD  CONSTRAINT [DF__pedido__cargo_ex__29572725]  DEFAULT ((0)) FOR [cargo_extra]
GO
ALTER TABLE [dbo].[pedido] ADD  CONSTRAINT [DF__pedido__subtotal__2A4B4B5E]  DEFAULT ((0)) FOR [subtotal]
GO
ALTER TABLE [dbo].[pedido] ADD  CONSTRAINT [DF__pedido__iva__2B3F6F97]  DEFAULT ((0)) FOR [iva]
GO
ALTER TABLE [dbo].[pedido] ADD  CONSTRAINT [DF__pedido__total__2C3393D0]  DEFAULT ((0)) FOR [total]
GO
ALTER TABLE [dbo].[pedido.detalle] ADD  CONSTRAINT [DF__pedido.de__canti__2D27B809]  DEFAULT ((1)) FOR [cantidad]
GO
ALTER TABLE [dbo].[pedido.detalle] ADD  CONSTRAINT [DF__pedido.de__preci__2E1BDC42]  DEFAULT ((0)) FOR [precio]
GO
ALTER TABLE [dbo].[diseno]  WITH CHECK ADD  CONSTRAINT [FK_diseno_base] FOREIGN KEY([idbase])
REFERENCES [dbo].[base] ([idbase])
GO
ALTER TABLE [dbo].[diseno] CHECK CONSTRAINT [FK_diseno_base]
GO
ALTER TABLE [dbo].[diseno]  WITH CHECK ADD  CONSTRAINT [FK_diseno_crema] FOREIGN KEY([idcrema])
REFERENCES [dbo].[crema] ([idcrema])
GO
ALTER TABLE [dbo].[diseno] CHECK CONSTRAINT [FK_diseno_crema]
GO
ALTER TABLE [dbo].[diseno]  WITH CHECK ADD  CONSTRAINT [FK_diseno_topping] FOREIGN KEY([idtopping])
REFERENCES [dbo].[topping] ([idtopping])
GO
ALTER TABLE [dbo].[diseno] CHECK CONSTRAINT [FK_diseno_topping]
GO
ALTER TABLE [dbo].[pedido]  WITH CHECK ADD  CONSTRAINT [FK_pedido_usuarios] FOREIGN KEY([idusuario])
REFERENCES [dbo].[usuarios] ([idusuario])
GO
ALTER TABLE [dbo].[pedido] CHECK CONSTRAINT [FK_pedido_usuarios]
GO
ALTER TABLE [dbo].[pedido.detalle]  WITH CHECK ADD  CONSTRAINT [FK_pedido.detalle_diseno] FOREIGN KEY([iddiseno])
REFERENCES [dbo].[diseno] ([iddiseno])
GO
ALTER TABLE [dbo].[pedido.detalle] CHECK CONSTRAINT [FK_pedido.detalle_diseno]
GO
ALTER TABLE [dbo].[pedido.detalle]  WITH CHECK ADD  CONSTRAINT [FK_pedido.detalle_pedido1] FOREIGN KEY([idpedido])
REFERENCES [dbo].[pedido] ([idpedido])
GO
ALTER TABLE [dbo].[pedido.detalle] CHECK CONSTRAINT [FK_pedido.detalle_pedido1]
GO
ALTER TABLE [dbo].[voto]  WITH CHECK ADD  CONSTRAINT [FK_voto_usuarios] FOREIGN KEY([idusuario])
REFERENCES [dbo].[usuarios] ([idusuario])
GO
ALTER TABLE [dbo].[voto] CHECK CONSTRAINT [FK_voto_usuarios]
GO
