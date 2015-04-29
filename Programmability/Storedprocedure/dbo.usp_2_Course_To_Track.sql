USE [s15guest04]
GO
/****** Object:  StoredProcedure [dbo].[usp_2_Class_To_Track]    Script Date: 4/29/2015 1:19:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[usp_2_Class_To_Track] 
	@track_name VARCHAR(50),
	@course_title VARCHAR(100)
AS
BEGIN TRY
BEGIN TRAN
	SET NOCOUNT ON;

	DECLARE @track_variable INT, @course_variable INT
	SET @track_variable = (
	SELECT pk_track_id  --Track
	FROM dbo.Track
	WHERE name = @track_name)

	SET @course_variable = (
	SELECT pk_course_id  --Class
	FROM dbo.Course
	WHERE title = @course_title )

	UPDATE dbo.Course
	SET fk_track_id = @track_variable
	OUTPUT DELETED.fk_track_id, INSERTED.fk_track_id
	WHERE pk_course_id = @course_variable


	
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
PRINT 'Custom Procedure2  failed'
PRINT ERROR_MESSAGE()
END CATCH
