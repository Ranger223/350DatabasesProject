USE [CBIS]
GO

/****** Object:  View [dbo].[FacConView]    Script Date: 4/17/2024 9:54:22 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[FacConView]
AS
SELECT        dbo.FACTION.FactionName, dbo.ORBITALSYSTEM.OrbSysName, dbo.CELESTIALBODY.CelBodyName, dbo.CELESTIALBODY.Mass, dbo.CELESTIALBODY.Radius, dbo.CELESTIALBODY.OrbitalDistance, 
                         dbo.CelBodTYPE.CelBodyTypeName, dbo.HABITABILITY.HabName, dbo.HABITABILITY.Colonizable, dbo.CELESTIALBODY.CelBodyID, dbo.FACTION.FacID, dbo.ORBITALSYSTEM.OrbSysID
FROM            dbo.CelBodTYPE INNER JOIN
                         dbo.CELESTIALBODY ON dbo.CelBodTYPE.CelBodyTypeID = dbo.CELESTIALBODY.CelBodyTypeID INNER JOIN
                         dbo.HABITABILITY ON dbo.CelBodTYPE.HabID = dbo.HABITABILITY.HabID INNER JOIN
                         dbo.FACTION INNER JOIN
                         dbo.FACTIONCONTROLS ON dbo.FACTION.FacID = dbo.FACTIONCONTROLS.FacID AND dbo.FACTION.FacID = dbo.FACTIONCONTROLS.FacID ON dbo.CELESTIALBODY.CelBodyID = dbo.FACTIONCONTROLS.CBID AND 
                         dbo.CELESTIALBODY.CelBodyID = dbo.FACTIONCONTROLS.CBID LEFT OUTER JOIN
                         dbo.ORBITALSYSTEM ON dbo.CELESTIALBODY.OSystemID = dbo.ORBITALSYSTEM.OrbSysID
WHERE        (dbo.CELESTIALBODY.CelBodyID <> 0)
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CelBodTYPE"
            Begin Extent = 
               Top = 115
               Left = 766
               Bottom = 228
               Right = 956
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CELESTIALBODY"
            Begin Extent = 
               Top = 61
               Left = 509
               Bottom = 191
               Right = 679
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "HABITABILITY"
            Begin Extent = 
               Top = 150
               Left = 1163
               Bottom = 263
               Right = 1333
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FACTION"
            Begin Extent = 
               Top = 43
               Left = 36
               Bottom = 139
               Right = 206
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FACTIONCONTROLS"
            Begin Extent = 
               Top = 43
               Left = 255
               Bottom = 139
               Right = 425
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ORBITALSYSTEM"
            Begin Extent = 
               Top = 206
               Left = 282
               Bottom = 319
               Right = 452
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FacConView'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FacConView'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FacConView'
GO

