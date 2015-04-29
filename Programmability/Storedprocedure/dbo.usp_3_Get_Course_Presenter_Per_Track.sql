USE [s15guest04]
GO
/****** Object:  StoredProcedure [dbo].[usp_3_Presenter_Class_Per_Track]    Script Date: 4/29/2015 3:14:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[usp_3_Presenter_Class_Per_Track] 

AS
BEGIN TRY
BEGIN TRAN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT track.name, course.title, person.first_name, person.last_name

FROM dbo.Course course
INNER JOIN dbo.Schedule schedule
ON schedule.fk_course_id = course.pk_course_id

INNER JOIN dbo.Presenter presenter
ON presenter.pk_presenter_id = schedule.fk_presenter_id

INNER JOIN dbo.Person person
ON person.pk_person_id = presenter.fk_person_id

INNER JOIN dbo.Track track
ON track.pk_track_id = course.fk_track_id

ORDER BY track.name
	
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
PRINT 'Custom Procedure3  failed'
PRINT ERROR_MESSAGE()
END CATCH
