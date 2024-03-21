USE [CBIS]
GO
SET IDENTITY_INSERT HABITABILITY ON
INSERT INTO [dbo].[HABITABILITY]
           ( [HabID]
		   ,[HabName]
           ,[Colonizable] )
     VALUES
           (0, 'None', 0),
		   (1, 'Star', 0),
		   (2, 'Terrestial', 1),
		   (3, 'Colonizable', 1),
		   (4, 'Hostile', 0),
		   (5, 'Difficultly Habitible', 1)
GO

SET IDENTITY_INSERT HABITABILITY OFF
SET IDENTITY_INSERT CelBodTYPE ON
INSERT INTO [dbo].[CelBodTYPE]
           ([CelBodyTypeID]
		   ,[CelBodyTypeName]
           ,[HabID])
     VALUES
           (0, 'None', 0),
		   (1, 'Sol', 0),
		   (2, 'Neutron', 0),
		   (3, 'Pulsar', 0),
		   (4, 'Red Giant', 0),
		   (5, 'White Dwarf', 0),
		   (6, 'Brown Dwarf', 0),
		   (7, 'Red Dwarf', 0),
		   (8, 'Black Hole', 0),
		   (9, 'Quasar Black Hole', 0),
		   (10, 'Orange Dwarf', 0),
		   (11, 'Terrestial', 0),
		   (12, 'Super-Earth', 0),
		   (13, 'Neptoid', 0),
		   (14, 'Gas Giant', 0),
		   (15, 'Rock', 0),
		   (16, 'Big Rock', 0),
		   (17, 'Dwarf', 0),
		   (18, 'Magma', 0),
		   (19, 'Big Magma', 0),
		   (20, 'Arctic', 0),
		   (21, 'Big Arctic', 0),
		   (22, 'Hostile Environment', 0),
		   (23, 'Desert', 0),
		   (24, 'Ice Giant', 0),
		   (25, 'Plutoid', 0)
GO
SET IDENTITY_INSERT CelBodTYPE OFF
SET IDENTITY_INSERT ORBITALSYSTEM ON

INSERT INTO [dbo].[ORBITALSYSTEM]
           ( [OrbSysID]
		   ,[OrbSysName]
           ,[CelBodyID])
     VALUES
           (0,'None',NULL)
SET IDENTITY_INSERT ORBITALSYSTEM OFF

SET IDENTITY_INSERT CELESTIALBODY ON
INSERT INTO [dbo].[CELESTIALBODY]
           ([CelBodyID]
		   ,[CelBodyName]
           ,[Mass]
           ,[Radius]
           ,[OrbitalDistance]
           ,[CelBodyTypeID])
     VALUES
           (0, 'None', 0, 0, 0, 0),
           (1, 'Sol', 5.522, 2.037, 0, 1),
		   (2, 'Mercury', -1.257, -0.417, -0.412, 15),
           (3, 'Venus', -0.089, -0.089, -0.141, 22),
           (4, 'Earth', 0, 0, 0, 11),
           (5, 'Mars', -0.971, -0.276, 0.182, 15),
           (6, 'Jupiter', 2.502, 1.049, 0.716, 14),
           (7, 'Saturn', 1.978, 0.954, 0.978, 14),
           (8, 'Uranus', 1.161, 0.603, 1.294, 24),
           (9, 'Neptune', 1.233, 0.589, 1.480, 24),
           (10, 'Pluto', -2.658, -0.728, 1.596, 15),
		   (11, 'Proxima Centari', 4.621, 1.224, 0, 7),
           (12, 'Proxima B', 0.3, 0.03, -1.314, 11),
           (13, 'Proxima C', 0.903, 0.301, 0.173, 20),
           (14, 'Proxima D', -0.585, -0.092, -1.538, 18),
		   (15, 'Ran', 5.436, 1.924, 0, 1),
           (16, 'AEgir', 2.302, 0.954, 0.547, 14),
		   (17, 'Lacaille 9352', 5.212, 1.711, 0, 7),
           (18, 'GJ 887 B', 0.623, 0.297, 01.167, 18),
           (19, 'GJ 887 C', 0.881, 0.334, -0.921, 18),
		   (20, 'Ross 128', 4.774, 1.359, 0, 7),
           (21, 'Ross 128 B', 0.146, 0.114, -1.304,  23),
		   (22, 'GX Andromedae', 5.102, 1.617, 0, 7),
           (23, 'GJ 15 Ab', 0.481, 0.211, -1.143, 18),
           (24, 'GJ 15 Ac', 1.556, 0.738, 0.732, 13),
		   (25, 'Tau Ceti', 5.486, 1.958, 0, 1),
           (26, 'Tau Ceti E', 0.675, 0.258, -0.269, 12),
           (27, 'Tau Ceti F', 0.719, 0.258, 0.125, 12),
           (28, 'Tau Ceti G', 0.243, 0.072, -0.876, 12),
           (29, 'Tau Ceti H', 0.262, 0.076, -0.614, 12),
		   (30, 'Epsilon Indi A', 5.400, 1.883, 0, 10),
           (31, 'Epsilon Indi Ab', 3.014, 1.108, 1.063, 14),
		   (32, 'Gliese 1061', 4.602, 1.231, 0, 7),
           (33, 'GJ 1061 B', 0.137, 0.041, -1.678, 14),
           (34, 'GJ 1061 C', 0.241, 0.072, -1.456, 12),
           (35, 'GJ 1061 D', 0.215, 0.064, -1.268, 12),
           (36, 'YZ Ceti', 4.675, 1.233, 0, 7),
		   (37, 'YZ Ceti C', 0.057, 0.021, -1.666, 12),
           (38, 'YZ Ceti D', 0.037, 0.013, -1.545, 12),
           (39, 'YZ Ceti B', -0.155, -0.040, -1.787, 11),
           (40, 'Teegarden''s Star', 4.498, 1.112, 0, 7),
		   (41, 'Teegarden''s Star A', 0.021, 0.009, -1.599, 12),
           (42, 'Teegarden''s Star B', 0.045, 0.017, -1.354, 12),
           (43, 'Kapteyn', 4.968, 1.517, 0, 7),
		   (44, 'Kapteyn B', 0.681, 0.341, -0.770, 12),
           (45, 'Kapteyn C', 0.845, 0.405, -0.507, 11),
           (46, 'Wolf 1061', 5.002, 1.545, 0, 7),
		   (47, 'Wolf 1061 C', 0.533, 0.220, -1.051, 12),
           (48, 'Wolf 1061 D', 0.886, 0.429, -0.328, 12),
           (49, 'Wolf 1061 B', 0.281, 0.083, -1.426, 12),
           (50, 'TZ Arietis', 4.699, 1.252, 0, 7),
		   (51, 'GQ Andromedae', 4.739, 1.328, 0, 1),
		   (52, 'GJ 687 C', 1.204, 0.616, 0.066, 13),
           (53, 'GJ 687 B', 1.236, 0.635, -0.788, 13),
           (54, 'Toliman', 5.467, 1.982, 0, 1),
		   (55, 'Rigil Kentarusus', 5.548, 2.134, 0, 1),
		   (56, 'Epsilon Indi B', 4.327, 0.941, 0, 6),
		   (57, 'Epsilon Indi C', 4.228, 0.951, 0, 6),
		   (58, 'Gliese 674', 5.068, 1.599, 0, 7),
		   (59, 'GJ 674 B', 1.045, 0.521, -1.409, 13),
		   (60, 'Gliese 687', 5.176, 1.671, 0, 7),
		   (61, 'GJ 687 B', 1.236, 0.635, -0.788, 13),
		   (62, 'GJ 687 C', 1.204, 0.616, 0.066, 13),
		   (63, 'Gliese 876', 5.091, 1.613, 0, 7),
		   (64, 'GJ 876 E', 1.220, 0.593, -0.476, 13),
           (65, 'GJ 876 C', 2.400, 1.146, -0.884, 14),
           (66, 'GJ 876 D', 0.877, 0.399, -1.682, 13),
           (67, 'GJ 876 B', 2.859, 1.125, -0.681, 14),
		   (68, 'Gliese 1002', 4.602, 1.174, 0, 7),
           (69, 'GJ 1002 D', 0.616, 0.281, 0.053, 11),
           (70, 'GJ 1002 C', 0.134, 0.041, -1.132, 12),
           (71, 'GJ 1002 B', 0.033, 0.013, -1.340, 12),
		   (72, 'Gliese 832', 5.163, 1.682, 0, 7),
           (73, 'GJ 832 C', 0.732, 0.338, -0.788, 13),
           (74, 'GJ 832 B', 2.334, 1.146, 0.551, 14)
GO
SET IDENTITY_INSERT CELESTIALBODY OFF
SET IDENTITY_INSERT ORBITALSYSTEM ON

INSERT INTO [dbo].[ORBITALSYSTEM]
           ( [OrbSysID]
		   ,[OrbSysName]
           ,[CelBodyID])
     VALUES
           (1, 'Sol', 1),
           (2, 'Proxima Centari', 11),
		   (3, 'Epsilon Eridani', 15),
           (4, 'GJ 887', 17),
           (5, 'Ross 128', 20),
           (6, 'GJ 15', 22),
           (7, 'Tau Ceti', 25),
           (8, 'Epsilon Indi', 30),
           (9, 'GJ 1061', 32),
           (10, 'YZ Ceti', 36),
           (11, 'Teegarden''s System', 40),
           (12, 'Kapteyn', 43),
           (13, 'Wolf 1061', 46),
           (14, 'GJ 674', 58),
           (15, 'GJ 687', 60),
           (16, 'GJ 876', 63),
           (17, 'GJ 1002', 68),
           (18, 'GJ 832', 72)
GO

SET IDENTITY_INSERT ORBITALSYSTEM OFF

UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 0
 WHERE CelBodyID = 0
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 1
 WHERE CelBodyID = 1
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 1
 WHERE CelBodyID = 2
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 1
 WHERE CelBodyID = 3
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 1
 WHERE CelBodyID = 4
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 1
 WHERE CelBodyID = 5
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 1
 WHERE CelBodyID = 6
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 1
 WHERE CelBodyID = 7
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 1
 WHERE CelBodyID = 8
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 1
 WHERE CelBodyID = 9
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 1
 WHERE CelBodyID = 10
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 2
 WHERE CelBodyID = 11
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 2
 WHERE CelBodyID = 12
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 2
 WHERE CelBodyID = 13
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 2
 WHERE CelBodyID = 14
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 3
 WHERE CelBodyID = 15
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 3
 WHERE CelBodyID = 16
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 4
 WHERE CelBodyID = 17
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 4
 WHERE CelBodyID = 18
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 4
 WHERE CelBodyID = 19
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 5
 WHERE CelBodyID = 20
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 5
 WHERE CelBodyID = 21
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 6
 WHERE CelBodyID = 22
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 6
 WHERE CelBodyID = 23
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 6
 WHERE CelBodyID = 24
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 7
 WHERE CelBodyID = 25
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 7
 WHERE CelBodyID = 26
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 7
 WHERE CelBodyID = 27
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 7
 WHERE CelBodyID = 28
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 7
 WHERE CelBodyID = 29
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 8
 WHERE CelBodyID = 30
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 8
 WHERE CelBodyID = 31
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 9
 WHERE CelBodyID = 32
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 9
 WHERE CelBodyID = 33
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 9
 WHERE CelBodyID = 34
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 9
 WHERE CelBodyID = 35
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 10
 WHERE CelBodyID = 36
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 10
 WHERE CelBodyID = 37
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 10
 WHERE CelBodyID = 38
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 10
 WHERE CelBodyID = 39
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 11
 WHERE CelBodyID = 40
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 11
 WHERE CelBodyID = 41
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 11
 WHERE CelBodyID = 42
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 12
 WHERE CelBodyID = 43
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 12
 WHERE CelBodyID = 44
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 12
 WHERE CelBodyID = 45
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 13
 WHERE CelBodyID = 46
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 13
 WHERE CelBodyID = 47
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 13
 WHERE CelBodyID = 48
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 13
 WHERE CelBodyID = 49
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 0
 WHERE CelBodyID = 50
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 0
 WHERE CelBodyID = 51
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 0
 WHERE CelBodyID = 52
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 0
 WHERE CelBodyID = 53
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 8
 WHERE CelBodyID = 54
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 8
 WHERE CelBodyID = 55
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 14
 WHERE CelBodyID = 56
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 14
 WHERE CelBodyID = 57
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 15
 WHERE CelBodyID = 58
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 15
 WHERE CelBodyID = 59
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 15
 WHERE CelBodyID = 60
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 16
 WHERE CelBodyID = 61
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 16
 WHERE CelBodyID = 62
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 16
 WHERE CelBodyID = 63
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 16
 WHERE CelBodyID = 64
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 16
 WHERE CelBodyID = 65
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 17
 WHERE CelBodyID = 66
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 17
 WHERE CelBodyID = 67
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 17
 WHERE CelBodyID = 68
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 17
 WHERE CelBodyID = 69
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 18
 WHERE CelBodyID = 70
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 18
 WHERE CelBodyID = 71
UPDATE [dbo].[CELESTIALBODY]
   SET [OSystemID] = 18
 WHERE CelBodyID = 72
 UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 0
 WHERE OrbSysID = 0

GO

SET IDENTITY_INSERT FACTION ON

INSERT INTO [dbo].[FACTION]
           ([FacID],[FactionName])
     VALUES
           (1, 'The Church Of Spiffo'),
           (2, 'United Space Of America'),
           (3, 'The Cult Of Moments'),
           (4, 'The Anarchists Union'),
           (5, 'The Kin'),
           (6, 'Alpha Centauri Fan Club'),
           (7, 'Fuze'),
           (8, 'Orion Baking Society'),
           (9, 'Enigma Books'),
           (10, 'Louisville Historical Society')
GO

SET IDENTITY_INSERT FACTION OFF

SET IDENTITY_INSERT DBUSER ON
INSERT INTO [dbo].[DBUSER]
			( [Username]
			, [Email]
			, [PasswordHash]
			, [Clearance]
			, [FacID])
     VALUES
           ('funkyspacesattellite', 'comet@spacegmail.com', 1234, 1, 10),
           ('spaceunclesam', 'WENEEDYOU@spaceusa.gov', 1234, 0, 1),
           ('captainshark', 'CaptainShark@braves.com', 1234, 2, 4),
           ('prettypurpleplane', 'aether@pollux.com', 1234, 3, 9),
           ('smilingallthetime', 'sidesplit@dirge.com', 1234, 4, 9),
           ('vendingmachineoflove', 'sodapop@spacegmail.com', 1234, 1, 8),
           ('werewolfvampire', 'darkfall@spacegmail.com', 1234, 3, NULL)
GO
SET IDENTITY_INSERT DBUSER OFF

INSERT INTO [dbo].[FACTIONCONTROLS]
           ([FacID],[CBID])
     VALUES
           (1, 58),
		   (1, 12),
		   (1, 60),
		   (1, 63),
		   (1, 68),
		   (2, 1),
		   (2, 2),
		   (2, 3),
		   (2, 4),
		   (2, 5),
		   (2, 6),
		   (2, 7),
		   (2, 8),
		   (2, 9),
		   (2, 10),
		   (4, 43),
		   (4, 47),
		   (5, 12),
		   (5, 31),
		   (5, 37),
		   (6, 11),
		   (6, 12),
		   (6, 13),
		   (6, 14),
		   (7, 26),
		   (7, 28),
		   (7, 29),
		   (8, 40),
		   (8, 41),
		   (8, 42),
		   (9, 48),
		   (9, 49),
		   (10, 33),
		   (10, 34),
		   (10, 35)
GO

INSERT INTO [dbo].[SAVED]
			(UID, CelBodyID)
	VALUES
			(1,1),
			(2,1),
			(1,2)
GO