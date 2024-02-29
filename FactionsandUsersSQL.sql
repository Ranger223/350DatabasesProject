USE [Milestone3]
GO

INSERT INTO [dbo].[FACTION]
           ([FactionName])
     VALUES
           ('The Church Of Spiffo'),
           ('United Space Of America'),
           ('The Cult Of Moments'),
           ('The Anarchists Union'),
           ('The Kin'),
           ('Alpha Centauri Fan Club'),
           ('Fuze'),
           ('Orion Baking Society'),
           ('Enigma Books'),
           ('Louisville Historical Society'),
GO

INSERT INTO [dbo].[DBUSER]
     VALUES
           ('funkyspacesattellite', 'comet@spacegmail.com', 1234, 1, 10),
           ('spaceunclesam', 'WENEEDYOU@spaceusa.gov', 1234, 0, 1),
           ('captainshark', 'CaptainShark@braves.com', 1234, 2, 4),
           ('prettypurpleplane', 'aether@pollux.com', 1234, 3, 9),
           ('smilingallthetime', 'sidesplit@dirge.com', 1234, 4, 9),
           ('vendingmachineoflove', 'sodapop@spacegmail.com', 1234, 1, 8),
           ('werewolfvampire', 'darkfall@spacegmail.com', 1234, 3, NULL)
GO

USE [Milestone3]
GO
SET IDENTITY_INSERT FACTIONCONTROLS ON
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



