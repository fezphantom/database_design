-- List all artifacts and the names of their donors.
SELECT
    donor.name AS name,
    artifact.name AS artifact_name
FROM
    donor INNER JOIN artifact
    ON donor.id = artifact.donor_id;

-- Show all artifacts stored in the room labeled "Room 1".
SELECT
	artifact.name,
    location.room
FROM
	artifact INNER JOIN location
    ON artifact.location_id = location.id
WHERE
	location.room = 'Room 1' LIMIT 100

-- List all exhibitions and the artifacts displayed in each.
SELECT
    exhibition.title as title,
    artifact.name as artifact
FROM
    exhibition INNER JOIN artifact_exhibition
    ON exhibition.id = artifact_exhibition.exhibition_id
    INNER JOIN artifact ON artifact_exhibition.artifact_id = artifact.id;

-- Show the names of all artifacts that have appeared in more than one exhibition.
SELECT
    artifact.name,
    COUNT(artifact.id)
FROM
    artifact INNER JOIN artifact_exhibition
    ON artifact.id = artifact_exhibition.artifact_id
GROUP BY
    artifact.name
HAVING
    COUNT(artifact.id) > 1;



-- For each donor, show how many artifacts they have donated.
SELECT
    donor.name,
    COUNT(artifact.id) AS number_artifacts
FROM
    donor JOIN artifact ON donor.id = artifact.donor_id
GROUP BY
    donor.name;


-- Find donors who donated artifacts stored in climate-controlled locations
SELECT
    donor.name,
    artifact.name,
    location.climate_controlled
FROM
    donor JOIN artifact ON donor.id = artifact.donor_id
    JOIN location ON artifact.location_id = location.id
WHERE
    location.climate_controlled = 'true';