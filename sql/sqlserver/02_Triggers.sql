CREATE TRIGGER trg_informe_insert
ON INFORME_TECNICO
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN CONGRESO c ON i.id_articulo = c.id_articulo
    )
    OR EXISTS (
        SELECT 1
        FROM inserted i
        JOIN REVISTA r ON i.id_articulo = r.id_articulo
    )
    BEGIN
        RAISERROR('Artículo ya pertenece a otro tipo',16,1);
        RETURN;
    END

    INSERT INTO INFORME_TECNICO
    SELECT * FROM inserted;
END;
GO

CREATE TRIGGER trg_congreso_insert
ON CONGRESO
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN INFORME_TECNICO it ON i.id_articulo = it.id_articulo
    )
    OR EXISTS (
        SELECT 1
        FROM inserted i
        JOIN REVISTA r ON i.id_articulo = r.id_articulo
    )
    BEGIN
        RAISERROR('Artículo ya pertenece a otro tipo',16,1);
        RETURN;
    END

    INSERT INTO CONGRESO
    SELECT * FROM inserted;
END;
GO

CREATE TRIGGER trg_revista_insert
ON REVISTA
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN INFORME_TECNICO it ON i.id_articulo = it.id_articulo
    )
    OR EXISTS (
        SELECT 1
        FROM inserted i
        JOIN CONGRESO c ON i.id_articulo = c.id_articulo
    )
    BEGIN
        RAISERROR('Artículo ya pertenece a otro tipo',16,1);
        RETURN;
    END

    INSERT INTO REVISTA
    SELECT * FROM inserted;
END;
GO
