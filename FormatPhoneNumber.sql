CREATE FUNCTION FormatPhoneNumber(@number VARCHAR(19))
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @result VARCHAR(100);
	IF LEN(@number) < 9
		BEGIN
			SET @result = 'Number is too short';
		END
	ELSE
	BEGIN
		IF @number LIKE '050%' 
			OR @number LIKE '051%' 
			OR @number LIKE '070%'
			OR @number LIKE '077%'
			OR @number LIKE '010%'
			OR @number LIKE '099%'
			OR @number LIKE '012%'
			BEGIN
				SET @result = CONCAT('+994 ',SUBSTRING(@number,1,3),' ',SUBSTRING(@number,4,3),' ',SUBSTRING(@number,7,2),' ',SUBSTRING(@number,9,2))
			END
		ELSE IF @number LIKE '50%' 
			OR @number LIKE '51%' 
			OR @number LIKE '70%'
			OR @number LIKE '77%'
			OR @number LIKE '10%'
			OR @number LIKE '99%'
			OR @number LIKE '12%'
			BEGIN
				SET @result = CONCAT('+994 0',SUBSTRING(@number,1,2),' ',SUBSTRING(@number,3,3),' ',SUBSTRING(@number,6,2),' ',SUBSTRING(@number,8,2))
			END
		 ELSE IF @number LIKE '994%' 
            BEGIN
                SET @result = CONCAT('+994 ',SUBSTRING(@number,4,3),' ',SUBSTRING(@number,7,3),' ',SUBSTRING(@number,10,2),' ',SUBSTRING(@number,12,2))
            END   
         ELSE IF @number LIKE '+994%' 
            BEGIN
                SET @result = CONCAT(SUBSTRING(@number,1,4),' ',SUBSTRING(@number,5,3),' ',SUBSTRING(@number,8,3),' ',SUBSTRING(@number,11,2),' ',SUBSTRING(@number,13,2))
            END   
		ELSE
        BEGIN
			SET @result = 'Invalid phone number format';
		END
	END

    RETURN @result;
END


DECLARE @result VARCHAR(19);
DECLARE @number VARCHAR(19);

SET @number = '0501112222'

SET @result = dbo.FormatPhoneNumber(@number)

SELECT @result AS Result