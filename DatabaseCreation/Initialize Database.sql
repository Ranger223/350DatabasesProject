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
		   (1, 'Sol', 1),
		   (2, 'Neutron', 1),
		   (3, 'Pulsar', 1),
		   (4, 'Red Giant', 1),
		   (5, 'White Dwarf', 1),
		   (6, 'Brown Dwarf', 1),
		   (7, 'Red Dwarf', 1),
		   (8, 'Black Hole', 0),
		   (9, 'Quasar Black Hole', 0),
		   (10, 'Orange Dwarf', 1),
		   (11, 'Terrestial', 2),
		   (12, 'Super-Earth', 2),
		   (13, 'Neptoid', 3),
		   (14, 'Gas Giant', 3),
		   (15, 'Rock', 3),
		   (16, 'Magma', 5),
		   (17, 'Arctic', 3),
		   (18, 'Hostile Environment', 5),
		   (19, 'Desert', 3),
		   (20, 'Ice Giant', 3),
		   (21, 'Ice', 3)
GO
SET IDENTITY_INSERT CelBodTYPE OFF

SET IDENTITY_INSERT ORBITALSYSTEM ON
INSERT INTO [dbo].[ORBITALSYSTEM]
           ( [OrbSysID]
		   ,[OrbSysName] )
     VALUES
           (0, 'None'),
           (1, 'Sol'),
           (2, 'Proxima Centari'),
		   (3, 'Epsilon Eridani'),
           (4, 'GJ 887'),
           (5, 'Ross 128'),
           (6, 'GJ 15'),
           (7, 'Tau Ceti'),
           (8, 'Epsilon Indi'),
           (9, 'GJ 1061'),
           (10, 'YZ Ceti'),
           (11, 'Teegarden''s System'),
           (12, 'Kapteyn'),
           (13, 'Wolf 1061'),
           (14, 'GJ 674'),
           (15, 'GJ 687'),
           (16, 'GJ 876'),
           (17, 'GJ 1002'),
           (18, 'GJ 832'),
		   (19, 'Terra'),
		   (20, 'Martian'),
		   (21, 'Jovian'),
		   (22, 'Saturnian'),
		   (23, 'Uranian'),
		   (24, 'Neptunian'),
		   (25, 'Plutonian'),
		   (26, 'Erisian'),
		   (27, 'Haumean')
GO
SET IDENTITY_INSERT ORBITALSYSTEM OFF

SET IDENTITY_INSERT CELESTIALBODY ON
INSERT INTO [dbo].[CELESTIALBODY]
           ([CelBodyID]
		   ,[CelBodyName]
           ,[Mass]
           ,[Radius]
           ,[OrbitalDistance]
           ,[CelBodyTypeID]
		   ,[OSystemID])
     VALUES
           (0, 'None', 0, 0, 0, 0, 0),
		   (1, 'Sol', 5.522, 2.037, 0, 1, 1),
		   (2, 'Mercury', -1.257, -0.417, -0.412, 15, 1),
           (3, 'Venus', -0.089, -0.089, -0.141, 20, 1),
           (4, 'Earth', 0, 0, 0, 11, 1),
           (5, 'Mars', -0.971, -0.276, 0.182, 15, 1),
           (6, 'Jupiter', 2.502, 1.049, 0.716, 14, 1),
           (7, 'Saturn', 1.978, 0.954, 0.978, 14, 1),
           (8, 'Uranus', 1.161, 0.603, 1.294, 20, 1),
           (9, 'Neptune', 1.233, 0.589, 1.480, 20, 1),
           (10, 'Pluto', -2.658, -0.728, 1.596, 15, 1),
		   (11, 'Proxima Centari', 4.621, 1.224, 0, 7, 2),
		   (12, 'Proxima B', 0.3, 0.03, -1.314, 11, 2),
           (13, 'Proxima C', 0.903, 0.301, 0.173, 17, 2),
           (14, 'Proxima D', -0.585, -0.092, -1.538, 16, 2),
           (15, 'Ran', 5.436, 1.924, 0, 1, 3),
		   (16, 'AEgir', 2.302, 0.954, 0.547, 14, 3),
		   (17, 'Lacaille 9352', 5.212, 1.711, 0, 7, 4),
           (18, 'GJ 887 B', 0.623, 0.297, 01.167, 16, 4),
           (19, 'GJ 887 C', 0.881, 0.334, -0.921, 16, 4),
		   (20, 'Ross 128', 4.774, 1.359, 0, 7, 5),
		   (21, 'Ross 128 B', 0.146, 0.114, -1.304, 19, 5),
		   (22, 'GX Andromedae', 5.102, 1.617, 0, 7, 6),
		   (23, 'GJ 15 Ab', 0.481, 0.211, -1.143, 16, 6),
           (24, 'GJ 15 Ac', 1.556, 0.738, 0.732, 13, 6),
		   (25, 'Tau Ceti', 5.486, 1.958, 0, 1, 7),
		   (26, 'Tau Ceti E', 0.675, 0.258, -0.269, 12, 7),
           (27, 'Tau Ceti F', 0.719, 0.258, 0.125, 12, 7),
           (28, 'Tau Ceti G', 0.243, 0.072, -0.876, 12, 7),
           (29, 'Tau Ceti H', 0.262, 0.076, -0.614, 12, 7),
		   (30, 'Epsilon Indi A', 5.400, 1.883, 0, 10, 8),
		   (31, 'Epsilon Indi Ab', 3.014, 1.108, 1.063, 14, 8),
		   (32, 'Gliese 1061', 4.602, 1.231, 0, 7, 9),
		   (33, 'GJ 1061 B', 0.137, 0.041, -1.678, 14, 9),
           (34, 'GJ 1061 C', 0.241, 0.072, -1.456, 12, 9),
           (35, 'GJ 1061 D', 0.215, 0.064, -1.268, 12, 9),
           (36, 'YZ Ceti', 4.675, 1.233, 0, 7, 10),
           (37, 'YZ Ceti C', 0.057, 0.021, -1.666, 12, 10),
           (38, 'YZ Ceti D', 0.037, 0.013, -1.545, 12, 10),
           (39, 'YZ Ceti B', -0.155, -0.040, -1.787, 11, 10),
           (40, 'Teegarden''s Star', 4.498, 1.112, 0, 7, 11),
		   (41, 'Teegarden''s Star A', 0.021, 0.009, -1.599, 12, 11),
           (42, 'Teegarden''s Star B', 0.045, 0.017, -1.354, 12, 11),
           (43, 'Kapteyn', 4.968, 1.517, 0, 7, 12),
		   (44, 'Kapteyn B', 0.681, 0.341, -0.770, 12, 12),
           (45, 'Kapteyn C', 0.845, 0.405, -0.507, 11, 12),
           (46, 'Wolf 1061', 5.002, 1.545, 0, 7, 13),
		   (47, 'Wolf 1061 C', 0.533, 0.220, -1.051, 12, 13),
           (48, 'Wolf 1061 D', 0.886, 0.429, -0.328, 12, 13),
           (49, 'Wolf 1061 B', 0.281, 0.083, -1.426, 12, 13),
		   (50, 'TZ Arietis', 4.699, 1.252, 0, 7, 0),
		   (51, 'GQ Andromedae', 4.739, 1.328, 0, 1, 0),
		   (52, 'GJ 687 C', 1.204, 0.616, 0.066, 13, 15),
           (53, 'GJ 687 B', 1.236, 0.635, -0.788, 13, 15),
		   (54, 'Toliman', 5.467, 1.982, 0, 1, 8),
		   (55, 'Rigil Kentarusus', 5.548, 2.134, 0, 1, 8),
		   (56, 'Epsilon Indi B', 4.327, 0.941, 0, 6, 14),
		   (57, 'Epsilon Indi C', 4.228, 0.951, 0, 6, 14),
		   (58, 'Gliese 674', 5.068, 1.599, 0, 7, 14),
		   (59, 'GJ 674 B', 1.045, 0.521, -1.409, 13, 15),
		   (60, 'Gliese 687', 5.176, 1.671, 0, 7, 15),
		   (61, 'GJ 687 B', 1.236, 0.635, -0.788, 13, 15),
		   (62, 'GJ 687 C', 1.204, 0.616, 0.066, 13, 16),
		   (63, 'Gliese 876', 5.091, 1.613, 0, 7, 16),
		   (64, 'GJ 876 E', 1.220, 0.593, -0.476, 13, 16),
           (65, 'GJ 876 C', 2.400, 1.146, -0.884, 14, 16),
           (66, 'GJ 876 D', 0.877, 0.399, -1.682, 13, 15),
		   (67, 'GJ 876 B', 2.859, 1.125, -0.681, 14, 17),
		   (68, 'Gliese 1002', 4.602, 1.174, 0, 7, 17),
           (69, 'GJ 1002 D', 0.616, 0.281, 0.053, 11, 17),
           (70, 'GJ 1002 C', 0.134, 0.041, -1.132, 12, 17),
           (71, 'GJ 1002 B', 0.033, 0.013, -1.340, 12, 18),
		   (72, 'Gliese 832', 5.163, 1.682, 0, 7, 18),
           (73, 'GJ 832 C', 0.732, 0.338, -0.788, 13, 18),
           (74, 'GJ 832 B', 2.334, 1.146, 0.551, 14, 18),
		   (75, 'Luna', -1.910, -0.564, -2.590, 15, 19),	
		   (76, 'Eris', -2.559, -0.739, 1.83, 15, 1),
		   (77, 'Haumea', -3.173, -0.893, 1.633, 15, 1),
		   (78, 'Deimos', -9.607, -3.012, -3.805, 15, 20),
		   (79, 'Phobos', -7.774, -2.754, -4.208, 15, 20),
		   (80, 'Adrastea', -9.475, -2.754, -6.96, 15, 21),
		   (81, 'Aitne', -11.123, -3.629, -0.803, 21, 21),
		   (82, 'Amalthea', -6.458, -1.883, -2.917, 21, 21),
		   (83, 'Ananke', -8.551, -2.805, -0.849, 21, 21),
		   (84, 'Aoede', -9.63, -3.504, -0.798, 15, 21),
		   (85, 'Arche', -11.123, -3.629, -0.812, 15, 21),
		   (86, 'Autonoe', -10.822, -3.504, -0.793, 15, 21),
		   (87, 'Callisto', -1.744, -0.424, -1.9, 21, 21),
		   (88, 'Carme', -7.656, -2.629, -0.821, 15, 21),
		   (89, 'Callirrhoe', -9.837, -3.106, -0.791, 15, 21),
		   (90, 'Carpo', -11.123, -3.629, -0.942, 15, 21),
		   (91, 'Chaldene', -10.901, -3.526, -0.81, 21, 21),
		   (92, 'Cyllene', -11.6, -3.805, -0.795, 21, 21),
		   (93, 'Elara', -6.837, -2.203, -1.105, 15, 21),
		   (94, 'Erinome', -11.123, -3.601, -0.808, 15, 21),
		   (95, 'Euanthe', -11.123, -3.629, -0.852, 15, 21),
		   (96, 'Eukelade', -10.822, -3.504, -0.785, 15, 21),
		   (97, 'Euporie', -11.6, -3.805, -0.887, 21, 21),
		   (98, 'Europa', -2.095, -0.611, -2.348, 21, 21),
		   (99, 'Eurydome', -11.123, -3.629, -0.809, 21, 21),
		   (100, 'Ganymede', -1.605, -3.629, -4.453, 17, 21),
		   (101, 'Harpalyke', -10.697, -3.472, -0.851, 15, 21),
		   (102, 'Hegemone', -11.123, -3.629, -0.786, 15, 21),
		   (103, 'Helike', -10.822, -3.504, -1.135, 15, 21),
		   (104, 'Hermippe', -10.822, -3.504, -0.848, 15, 21),
		   (105, 'Himalia', -6.153, -1.875, -1.115, 15, 21),
		   (106, 'Io', -1.825, -0.546, -2.55, 15, 21), 
		   (107, 'Iocaste', -10.486, -3.39, -0.847, 15, 21),
		   (108, 'Isonone', -10.901, -3.526, -0.809, 15, 21),
		   (109, 'Kale', -11.6, -3.805, -0.811, 15, 21),
		   (110, 'Kallichore', -11.6, -3.805, -0.825, 15, 21),
		   (111, 'Kalyke', -10.486, -3.39, -0.802, 15, 21), 
		   (112, 'Kore', -11.6, -3.805, -0.785, 15, 21),
		   (113, 'Leda', -8.737, -3.106, -1.13, 15, 21),
		   (114, 'Lysithea', -7.977, -2.726, -1.106, 15, 21),
		   (115, 'Magaclite', -10.454, -3.373, -0.798, 15, 21),
		   (116, 'Metis', -7.97, -2.504, -3.068, 15, 21), 
		   (117, 'Mneme', -11.6, -3.805, -0.851, 15, 21),
		   (118, 'Orthosie', -11.6, -3.805, -0.849, 15, 21),
		   (119, 'Pasiphae', -7.299, -2.549, -0.804, 15, 21),
		   (120, 'Pasithee', -11.6, -3.805, -0.813, 15, 21),
		   (121, 'Praxidike', -10.138, -3.273, -0.85, 15, 21),
		   (122, 'Sinope', -7.901, -2.659, -0.8, 15, 21),
		   (123, 'Sponde', -11.6, -3.805, -0.798, 15, 21),
		   (124, 'Dia', -11.232, -3.504, -1.076, 21, 21),
		   (125, 'S/2003 J2', -11.735, -3.805, -0.719, 15, 21),
		   (126, 'S/2003 J3', -12.478, -3.805, -0.912, 21, 21),
		   (127, 'S/2003 J4', -11.932, -3.805, -0.808, 15, 21),
		   (128, 'S/2003 J5', -10.868, -3.504, -0.793, 15, 21),
		   (129, 'S/2003 J9', -13.09, -4.106, -0.824, 21, 21),
		   (130, 'S/2003 J10', -11.782, -3.805, -0.79, 15, 21),
		   (131, 'S/2003 J12', -12.824, -4.106, -0.896, 21, 21),
		   (132, 'S/2003 J15', -11.780, -3.805, -0.833, 15, 21),
		   (133, 'S/2003 J16', -11.74, -3.805, -0.853, 15, 21),
		   (134, 'S/2003 J17', -11.881, -3.805, -0.833, 15, 21),
		   (135, 'S/2003 J18', -12.189, -3.805, -0.859, 21, 21),
		   (136, 'S/2003 J19', -12.089, -3.805, -0.817, 21, 21),
		   (137, 'S/2003 J23', -12.167, -3.805, -0.803, 21, 21),
		   (138, 'S/2010 J1', -11.819, -3.805, -0.807, 15, 21),
		   (139, 'S/2010 J2', -12.819, -4.106, -0.867, 15, 21),
		   (140, 'S/2011 J2', -12.735, -4.106, -0.807, 15, 21),
		   (141, 'S/2011 J1', -12.999, -4.106, -0.871, 21, 21),
		   (142, 'Taygete', -10.559, -3.407, -0.806, 15, 21),
		   (143, 'Thebe', -6.873, -2.106, -2.829, 15, 21),
		   (144, 'Thelxinoe', -11.6, -3.805, -0.849, 15, 21),
		   (145, 'Themisto', -9.938, -3.203, -1.299, 15, 21),
		   (146, 'Thyone', -10.822, -3.504, -0.846, 15, 21),
		   (147, 'Aegir', -10.329, -3.328, -0.858, 15, 22),
		   (148, 'Albiorix', -8.454, -2.629, -0.96, 15, 22),
		   (149, 'Anthe', -12.6, -4.106, -2.879, 15, 22),
		   (150, 'Atlas', -8.931, -2.632, -3.036, 21, 22),
		   (151, 'Bebhionn', -11.077, -3.328, -0.941, 21, 22),
		   (152, 'Bergelmir', -11.299, -3.328, -0.889, 21, 22),
		   (153, 'Bestla', -10.873, -3.261, -0.871, 21, 22),
		   (154, 'Calypso', -9.174, -2.775, -2.706, 21, 22),
		   (155, 'Daphnis', -10.776, -3.261, -3.04, 21, 22),
		   (156, 'Dione', -3.735, -1.057, -2.598, 15, 22),
		   (157, 'Enceladus', -4.743, -1.408, -2.798, 15, 22),
		   (158, 'Epimetheus', -7.052, -2.041, -2.995, 21, 22),
		   (159, 'Erriapo', -10.751, -3.106, -0.929, 21, 22),
		   (160, 'Farbauti', -10.6, -3.407, -0.866, 15, 22),
		   (161, 'Fenrir', -11.776, -3.504, -0.824, 21, 22),
		   (162, 'Fornjot', -11.077, -3.328, -0.775, 21, 22),
		   (163, 'Greip', -11.299, -3.328, -0.915, 21, 22),
		   (164, 'Hati', -11.299, -3.328, -0.877, 21, 22),
		   (165, 'Helene', -8.299, -2.549, -2.598, 21, 22),
		   (166, 'Hyperion', -6.028, -1.975, -2.004, 15, 22),
		   (167, 'Hyrrokkin', -10.776, -3.203, -0.909, 21, 22),
		   (168, 'Iapetus', -3.518, -0.949, -1.623, 21, 22),
		   (169, 'Ijiraq', -10.044, -2.96, -1.117, 21, 22),
		   (170, 'Janus', -6.497, -1.855, -2.995, 21, 22),
		   (171, 'Jarnsaxa', -11.475, -3.328, -0.901, 21, 22),
		   (172, 'Kari', -10.998, -3.261, -0.83, 21, 22),
		   (173, 'Kiviuq', -9.776, -2.875, -1.119, 21, 22),
		   (174, 'Loge', -11.299, -3.328, -0.812, 21, 22),
		   (175, 'Methone', -11.822, -3.629, -2.887, 21, 22),
		   (176, 'Mimas', -5.197, -1.506, -2.907, 21, 22),
		   (177, 'Mundilfari', -10.822, -3.261, -0.903, 21, 22),
		   (178, 'Narvi', -10.776, -3.203, -0.903, 21, 22),
		   (179, 'Paaliaq', -9.143, -2.708, -0.993, 21, 22),
		   (180, 'Pallene', -11.258, -3.504, -2.851, 21, 22),
		   (181, 'Pan', -9.077, -2.82, -3.049, 15, 22),
		   (182, 'Pandora', -7.63, -2.203, -3.024, 21, 22),
		   (183, 'Phoebe', -5.857, -1.763, -1.063, 15, 22),
		   (184, 'Polydeuces', -12.123, -3.504, -2.598, 21, 22),
		   (185, 'Prometheus', -7.572, -2.173, -3.031, 21, 22),
		   (186, 'Rhea', -3.413, -0.922, -2.453, 21, 22),
		   (187, 'Siarnaq', -8.572, -2.453, -0.916, 21, 22),
		   (188, 'Skathi', -10.776, -3.203, -0.981, 21, 22),
		   (189, 'Skoll', -11.299, -3.328, -0.928, 21, 22),
		   (190, 'Surtur', -11.6, -3.328, -0.819, 21, 22),
		   (191, 'Suttungr', -10.822, -3.261, -0.886, 21, 22),
		   (192, 'S/2004 S07', -10.822, -3.328, -0.878, 21, 22),
		   (193, 'S/2004 S12', -10.484, -3.407, -0.882, 15, 22),
		   (194, 'S/2004 S13', -10.531, -3.328, -0.909, 15, 22),
		   (195, 'S/2004 S17', -10.895, -3.504, -0.905, 15, 22),
		   (196, 'S/2006 S1', -10.32, -3.328, -0.897, 15, 22),
		   (197, 'S/2006 S3', -10.305, -3.328, -0.85, 15, 22),
		   (198, 'S/2007 S2', -10.251, -3.328, -0.956, 15, 22),
		   (199, 'S/2007 S3', -10.509, -3.407, -0.863, 15, 22),
		   (200, 'Tarqeq', -10.509, -3.261, -0.919, 21, 22),
		   (201, 'Tarvos', -9.18, -2.902, -0.914, 15, 22),
		   (202, 'Telesto', -8.931, -2.715, -2.706, 21, 22),
		   (203, 'Tethys', -3.985, -1.08, -2.706, 21, 22),
		   (204, 'Thrymr', -10.454, -3.261, -0.864, 21, 22),
		   (205, 'Titan', -1.647, -0.394, -2.088, 15, 22),
		   (206, 'Ymir', -9.475, -2.805, -0.811, 21, 22),
		   (207, 'Ariel', -4.314, -1.041, -2.893, 21, 23),
		   (208, 'Belinda', -7.497, -2.286, -3.298, 15, 23),
		   (209, 'Bianca', -7.971, -2.482, -3.298, 15, 23),
		   (210, 'Caliban', -7.299, -2.203, -1.318, 21, 23),
		   (211, 'Cordelia', -7.992, -2.691, -3.478, 15, 23),
		   (212, 'Cressida', -7.512, -2.313, -3.384, 15, 23),
		   (213, 'Cupid', -9.378, -3.027, -3.301, 15, 23),
		   (214, 'Desdemona', -7.684, -2.373, -3.378, 15, 23),
		   (215, 'Ferdinand', -9.044, -2.784, -0.855, 21, 23),
		   (216, 'Francisco', -8.919, -2.763, -1.544, 15, 23),
		   (217, 'Juliet', -7.188, -2.181, -3.366, 21, 23),
		   (218, 'Mab', -8.776, -2.902, -3.185, 15, 23),
		   (219, 'Margaret', -9.036, -3.064, -1.008, 15, 23),
		   (220, 'Miranda', -4.957, -1.432, -3.062, 21, 23),
		   (221, 'Oberon', -3.317, -0.922, -2.41, 15, 23),
		   (222, 'Ophelia', -8.223, -2.623, -3.447, 15, 23),
		   (223, 'Perdita', -8.521, -2.805, -3.292, 15, 23),
		   (224, 'Portia', -6.709, -2.072, -3.355, 15, 23),
		   (225, 'Prospero', -7.847, -2.629, -0.964, 15, 23),
		   (226, 'Puck', -6.495, -1.918, -3.24, 21, 23),
		   (227, 'Rosalind', -7.378, -2.373, -3.33, 15, 23),
		   (228, 'Setebos', -7.901, -2.434, -0.934, 15, 23),
		   (229, 'Stephano', -8.434, -2.601, -1.272, 15, 23),
		   (230, 'Sycorax', -6.378, -1.902, -1.089, 21, 23),
		   (231, 'Titania', -3.242, -0.908, -2.536, 15, 23),
		   (232, 'Trinculo', -9.185, -3.106, -1.242, 15, 23),
		   (233, 'Umbriel', -3.69, -1.03, -2.75, 15, 23),
		   (234, 'Despina', -6.475, -1.902, -3.383, 21, 24),
		   (235, 'Galatea', -6.174, -1.96, -3.455, 15, 24),
		   (236, 'Halimede', -7.475, -2.328, -0.979, 15, 24),
		   (237, 'Larissa', -6.077, -1.805, -3.308, 21, 24),
		   (238, 'Laomedeia', -7.776, -2.526, -0.821, 15, 24),
		   (239, 'Naiad', -7.475, -2.407, -3.492, 15, 24),
		   (240, 'Nereid', -5.299, -1.574, -1.434, 15, 24),
		   (241, 'Neso', -7.475, -2.328, -0.5, 15, 24),
		   (242, 'Proteus', -5.077, -1.482, -3.105, 15, 24),
		   (243, 'Psamathe', -8.475, -2.526, -0.505, 21, 24),
		   (244, 'Sao', -7.776, -2.526, -0.826, 15, 24),
		   (245, 'Thalassa', -7.174, -2.151, -3.476, 21, 24),
		   (246, 'Triton', -2.446, -0.674, -2.625, 15, 24),
		   (247, 'Hippocamp', -8.299, -2.564, -3.153, 15, 24),
		   (248, 'Charon', -3.576, -1.024, -3.883, 15, 25),
		   (249, 'Nix', -8.361, -2.408, -3.488, 21, 25),
		   (250, 'Hydra', -8.298, -2.398, -3.363, 21, 25),
		   (251, 'Kerberos', -8.559, 0.665, -3.363, 21, 25),
		   (252, 'Styx', -8.901, -2.93, -3.552, 15, 25),
		   (253, 'Dysnomia', -4.862, -1.317, -3.604, 21, 26),
		   (254, 'Namaka', -6.523, -2.176, -3.766, 15, 27),
		   (255, 'Hi''iaka', -5.523, -1.614, -3.48, 21, 27)
GO
SET IDENTITY_INSERT CELESTIALBODY OFF

UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 0
 WHERE OrbSysID = 0
UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 1
 WHERE OrbSysID = 1
UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 11
 WHERE OrbSysID = 2
UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 15
 WHERE OrbSysID = 3
UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 17
 WHERE OrbSysID = 4
UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 20
 WHERE OrbSysID = 5
UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 22
 WHERE OrbSysID = 6
UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 25
 WHERE OrbSysID = 7
UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 30
 WHERE OrbSysID = 8
UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 32
 WHERE OrbSysID = 9
UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 36
 WHERE OrbSysID = 10
UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 40
 WHERE OrbSysID = 11
UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 43
 WHERE OrbSysID = 12
UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 46
 WHERE OrbSysID = 13
UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 58
 WHERE OrbSysID = 14
UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 60
 WHERE OrbSysID = 15
UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 63
 WHERE OrbSysID = 16
UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 68
 WHERE OrbSysID = 17
UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 72
 WHERE OrbSysID = 18
UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 4
 WHERE OrbSysID = 19
UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 5
 WHERE OrbSysID = 20
UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 6
 WHERE OrbSysID = 21
UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 7
 WHERE OrbSysID = 22
UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 8
 WHERE OrbSysID = 23
UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 9
 WHERE OrbSysID = 24
UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 10
 WHERE OrbSysID = 25
UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 76
 WHERE OrbSysID = 26
UPDATE [dbo].[ORBITALSYSTEM]
   SET [CelBodyID] = 77
 WHERE OrbSysID = 27

SET IDENTITY_INSERT FACTION ON
INSERT INTO [dbo].[FACTION]
           ([FacID],[FactionName])
     VALUES
           (0, 'None'),
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
SET IDENTITY_INSERT FACTION OFF
Go

SET IDENTITY_INSERT DBUSER ON
INSERT INTO [dbo].[DBUSER]
			( [UID]
			, [Username]
			, [Email]
			, [PasswordHash]
			, [Clearance]
			, [FacID])
     VALUES
           (0, 'None', 'None', 0, 0, 0),
           (1, 'funkyspacesattellite', 'comet@spacegmail.com', 1234, 1, 10),
           (2, 'spaceunclesam', 'WENEEDYOU@spaceusa.gov', 1234, 0, 1),
           (3, 'captainshark', 'CaptainShark@braves.com', 1234, 2, 4),
           (4, 'prettypurpleplane', 'aether@pollux.com', 1234, 3, 9),
           (5, 'smilingallthetime', 'sidesplit@dirge.com', 1234, 4, 9),
           (6, 'vendingmachineoflove', 'sodapop@spacegmail.com', 1234, 1, 8),
           (7, 'werewolfvampire', 'darkfall@spacegmail.com', 1234, 3, NULL)
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