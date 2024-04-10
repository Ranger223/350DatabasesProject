USE [CBIS]
GO

/****** Object:  View [dbo].[UserSavedView]    Script Date: 4/4/2024 1:33:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[UserSavedView]
AS
SELECT        dbo.ORBITALSYSTEM.OrbSysName, dbo.CELESTIALBODY.CelBodyName, dbo.CELESTIALBODY.Mass, dbo.CELESTIALBODY.Radius, dbo.CELESTIALBODY.OrbitalDistance, dbo.CelBodTYPE.CelBodyTypeName, 
                         dbo.HABITABILITY.HabName, dbo.HABITABILITY.Colonizable, dbo.FACTION.FactionName
FROM            dbo.FACTION INNER JOIN
                         dbo.FACTIONCONTROLS ON dbo.FACTION.FacID = dbo.FACTIONCONTROLS.FacID INNER JOIN
                         dbo.HABITABILITY INNER JOIN
                         dbo.CELESTIALBODY INNER JOIN
                         dbo.SAVED ON dbo.CELESTIALBODY.CelBodyID = dbo.SAVED.CelBodyID AND dbo.CELESTIALBODY.CelBodyID = dbo.SAVED.CelBodyID INNER JOIN
                         dbo.ORBITALSYSTEM ON dbo.CELESTIALBODY.OSystemID = dbo.ORBITALSYSTEM.OrbSysID INNER JOIN
                         dbo.CelBodTYPE ON dbo.CELESTIALBODY.CelBodyTypeID = dbo.CelBodTYPE.CelBodyTypeID ON dbo.HABITABILITY.HabID = dbo.CelBodTYPE.HabID INNER JOIN
                         dbo.DBUSER ON dbo.SAVED.UID = dbo.DBUSER.UID AND dbo.SAVED.UID = dbo.DBUSER.UID ON dbo.FACTIONCONTROLS.CBID = dbo.CELESTIALBODY.CelBodyID AND 
                         dbo.FACTIONCONTROLS.CBID = dbo.CELESTIALBODY.CelBodyID
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
         Top = -134
         Left = 0
      End
      Begin Tables = 
         Begin Table = "FACTION"
            Begin Extent = 
               Top = 135
               Left = 38
               Bottom = 231
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FACTIONCONTROLS"
            Begin Extent = 
               Top = 135
               Left = 260
               Bottom = 231
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HABITABILITY"
            Begin Extent = 
               Top = 261
               Left = 436
               Bottom = 374
               Right = 606
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CELESTIALBODY"
            Begin Extent = 
               Top = 106
               Left = 555
               Bottom = 236
               Right = 725
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "SAVED"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ORBITALSYSTEM"
            Begin Extent = 
               Top = 139
               Left = 790
               Bottom = 252
               Right = 960
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CelBodTYPE"
            Begin Extent = 
               Top = 226
               Left = 43
               Bottom = 339
               Right = 233
            End' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UserSavedView'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DBUSER"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UserSavedView'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UserSavedView'
GO

