create database sentiment_analysis;


select * from master_review_data_manual mrdm;

CREATE TABLE extracted_reviews (
    Review_Text TEXT,          -- TEXT for long review text
    Review_Rating INT          -- INT for the 1-5 rating score
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/reviews_for_export.csv'
INTO TABLE extracted_reviews
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES; -- IGNORE 1 LINES skips the header row (Review Text,Rating)

select * from extracted_reviews;