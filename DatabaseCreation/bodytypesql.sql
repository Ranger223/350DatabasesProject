USE [Milestone3]
GO
SET IDENTITY_INSERT CelBodTYPE ON
INSERT INTO [dbo].[CelBodTYPE]
           ([HabID],[CelBodyTypeName]
           ,[CelBodyTypeID])
     VALUES
		   (1, 'sol', 1),
		   (1, 'Neutron', 2),
		   (1, 'Pulsar', 3),
		   (1, 'Red Giant', 4),
		   (1, 'White Dwarf', 5),
		   (1, 'Brown Dwarf', 6),
		   (1, 'Red Dwarf', 7),
		   (1, 'Black Hole', 8),
		   (1, 'Quasar Black Hole', 9),
		   (1, 'Orange Dwarf', 10),
		   (2, 'Terrestrial', 11),
		   (2, 'Super-Earth', 12),
		   (3, 'Neptoid', 13),
		   (3, 'Gas Giant', 14),
		   (3, 'Rock', 15),
		   (3, 'Big Rock', 16),
		   (3, 'Dwarf', 17),
		   (4, 'Magma', 18),
		   (4, 'Big Magma', 19),
		   (3, 'Arctic', 20),
		   (3, 'Big Arctic', 21),
		   (4, 'Hostile Environment', 22),
		   (5, 'Desert', 23),
		   (4, 'Ice Giant', 24),
		   (3, 'Plutoid', 25)
GO
SET IDENTITY_INSERT CelBodTYPE OFF


