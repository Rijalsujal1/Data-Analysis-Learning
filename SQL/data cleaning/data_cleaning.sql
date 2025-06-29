
-- 1. Create a staging table (to keep raw data untouched)
CREATE TABLE layoffs_staging LIKE layoffs;

-- 2. Copy raw data into staging
INSERT INTO layoffs_staging SELECT * FROM layoffs;

-- 3. Create a second staging table with row numbers for identifying duplicates
CREATE TABLE layoffs_staging2 (
  company TEXT,
  location TEXT,
  industry TEXT,
  total_laid_off INT,
  percentage_laid_off TEXT,
  date TEXT,
  stage TEXT,
  country TEXT,
  funds_raised_millions INT,
  row_num INT
);

-- 4. Insert data into layoffs_staging2 with ROW_NUMBER to find duplicates
INSERT INTO layoffs_staging2
SELECT *,
  ROW_NUMBER() OVER (
    PARTITION BY company, location, industry, total_laid_off,
                 percentage_laid_off, `date`, stage, country, funds_raised_millions
  ) AS row_num
FROM layoffs_staging;

-- 5. Delete duplicate rows (row_num > 1)
DELETE FROM layoffs_staging2 WHERE row_num > 1;

-- 6. Trim leading/trailing spaces from key text columns
UPDATE layoffs_staging2 SET company = TRIM(company);
UPDATE layoffs_staging2 SET location = TRIM(location);
UPDATE layoffs_staging2 SET country = TRIM(TRAILING '.' FROM country);

-- 7. Convert `date` column from text to DATE format
UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');
ALTER TABLE layoffs_staging2 MODIFY COLUMN `date` DATE;

-- 8. Set empty strings in `industry` to NULL
UPDATE layoffs_staging2 SET industry = NULL WHERE industry = '';

-- 9. Fill missing industry values by matching with same company
-- This version ensures only one value per company is used
UPDATE layoffs_staging2 t1
JOIN (
  SELECT company, MAX(industry) AS industry
  FROM layoffs_staging2
  WHERE industry IS NOT NULL
  GROUP BY company
) t2 ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL;

-- 10. Remove rows where both `total_laid_off` and `percentage_laid_off` are NULL
DELETE FROM layoffs_staging2
WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL;

-- 11. Drop helper column row_num
ALTER TABLE layoffs_staging2 DROP COLUMN row_num;

-- Final check: select cleaned dataset
SELECT * FROM layoffs_staging2 WHERE company = 'Airbnb';
SELECT * FROM layoffs_staging2;
