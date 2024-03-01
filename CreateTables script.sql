CREATE TABLE [dbo].[FACTION](
	[FacID] [int] IDENTITY(1,1) NOT NULL,
	[FactionName] [varchar](32) NULL,
	PRIMARY KEY (FacID)
);

CREATE TABLE [dbo].[HABITABILITY](
	[HabID] [int] IDENTITY(1,1) NOT NULL,
	[HabName] [varchar](24) NULL,
	[Colonizable] [bit] NOT NULL,
	PRIMARY KEY(HabID)
);

CREATE TABLE [dbo].[DBUSER](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](32) NOT NULL,
	[Email] [varchar](64) NOT NULL,
	[PasswordHash] [varchar](80) NULL,
	[Clearance] [int] NOT NULL,
	[FacID] [int] NULL,
	PRIMARY KEY (UID),
	FOREIGN KEY (FacID) REFERENCES FACTION(FacID),
	UNIQUE (Username)
);

CREATE TABLE [dbo].[CelBodTYPE](
	[CelBodyTypeID] [int] IDENTITY(1,1) NOT NULL,
	[CelBodyTypeName] [varchar](30) NULL,
	[HabID] [int] NOT NULL,
	PRIMARY KEY(CelBodyTypeID),
	FOREIGN KEY (HabID) REFERENCES HABITABILITY(HabID)
);

CREATE TABLE [dbo].[ORBITALSYSTEM](
	[OrbSysID] [int] IDENTITY(1,1) NOT NULL,
	[OrbSysName] [varchar](24) NULL,
	[CelBodyID] [int] NULL,
	PRIMARY KEY (OrbSysID)
);

CREATE TABLE [dbo].[CELESTIALBODY](
	[CelBodyID] [int] IDENTITY(1,1) NOT NULL,
	[CelBodyName] [varchar](30) NULL,
	[Mass] [decimal](10, 3) NULL,
	[Radius] [decimal](10, 3) NULL,
	[OrbitalDistance] [decimal](10, 3) NULL,
	[OSystemID] [int] NULL,
	[CelBodyTypeID] [int] NOT NULL,
	PRIMARY KEY (CelBodyID),
	FOREIGN KEY (OSystemID) REFERENCES ORBITALSYSTEM(OrbSysID),
	FOREIGN KEY (CelBodyTypeID) REFERENCES CelBodTYPE(CelBodyTypeID)
);

CREATE TABLE [dbo].[SAVED](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[CelBodyID] [int] NOT NULL,
	PRIMARY KEY (UID, CelBodyID),
	FOREIGN KEY (UID) REFERENCES DBUSER(UID),
	FOREIGN KEY (CelBodyID) REFERENCES CELESTIALBODY(CelBodyID)
);

CREATE TABLE [dbo].[FACTIONCONTROLS](
	[FacID] [int] IDENTITY(1,1) NOT NULL,
	[CBID] [int] NOT NULL,
	FOREIGN KEY (FacID) REFERENCES FACTION(FacID),
	FOREIGN KEY (CBID) REFERENCES CELESTIALBODY(CelBodyID)
);

ALTER TABLE ORBITALSYSTEM
ADD FOREIGN KEY (CelBodyID) REFERENCES CELESTIALBODY(CelBodyID);

ALTER TABLE ORBITALSYSTEM
ADD UNIQUE (CelBodyID);



