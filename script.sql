USE [InventarioDB]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 1/7/2025 20:55:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Descripcion] [nvarchar](500) NULL,
	[Categoria] [nvarchar](100) NULL,
	[ImagenUrl] [nvarchar](max) NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[Stock] [int] NOT NULL,
 CONSTRAINT [PK__Producto__3214EC0740553DDA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transacciones]    Script Date: 1/7/2025 20:55:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transacciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FechaTransaccion] [datetime] NOT NULL,
	[TipoTransaccion] [nvarchar](10) NOT NULL,
	[ProductoId] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [decimal](18, 2) NOT NULL,
	[PrecioTotal] [decimal](18, 2) NOT NULL,
	[Detalle] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Transacciones] ADD  DEFAULT (getdate()) FOR [FechaTransaccion]
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [FK__Transacci__Produ__3C69FB99] FOREIGN KEY([ProductoId])
REFERENCES [dbo].[Productos] ([Id])
GO
ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [FK__Transacci__Produ__3C69FB99]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [CK__Productos__Preci__37A5467C] CHECK  (([Precio]>=(0)))
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [CK__Productos__Preci__37A5467C]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [CK__Productos__Stock__38996AB5] CHECK  (([Stock]>=(0)))
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [CK__Productos__Stock__38996AB5]
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD CHECK  (([Cantidad]>(0)))
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD CHECK  (([PrecioUnitario]>=(0)))
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD CHECK  (([PrecioTotal]>=(0)))
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD CHECK  (([TipoTransaccion]='Venta' OR [TipoTransaccion]='Compra'))
GO
