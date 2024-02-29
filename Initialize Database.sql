USE [Milestone3]
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
		   (25, 'Plutoid', 0),
GO
SET IDENTITY_INSERT CelBodTYPE OFF

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