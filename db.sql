CREATE TYPE user_type AS ENUM('Coach', 'Seeker');

CREATE TYPE app_status AS ENUM('Phone Screen', 'Hiring Task', 'On-site Interview', 'Rejected', 'Offer', 'Never Heard Back');

CREATE TABLE users(
    userId serial PRIMARY KEY,
    email text NOT NULL,
    firstName text NOT NULL,
    lastName text NOT NULL,
    password text NOT NULL,
    salt text NOT NULL,
    userType USER_TYPE NOT NULL
);

CREATE TABLE coach_classes(
    id serial PRIMARY KEY,
    coachId int NOT NULL,
    seekerId int NOT NULL,
    CONSTRAINT fk_career_coach
        FOREIGN KEY(coachId)
        REFERENCES users(userId)
        ON DELETE CASCADE,
    CONSTRAINT fk_seeker
        FOREIGN KEY (seekerId)
        REFERENCES users(userId)
        ON DELETE CASCADE
);

CREATE TABLE app_tracker(
    appId serial PRIMARY KEY,
    week int,
    status APP_STATUS,
    dateSubmitted date NOT NULL,
    companyType text,
    jobTitle text NOT NULL,
    company text NOT NULL,
    location text,
    appUrl text,
    contact text
);

CREATE TABLE materials(
    materialId serial PRIMARY KEY,
    userId int NOT NULL,
    materialName text,
    link text,
    feedback text,
    feedbackDate date,
    coachId int,
    CONSTRAINT fk_user
        FOREIGN KEY(userId)
        REFERENCES users(userId)
        ON DELETE CASCADE,
    CONSTRAINT fk_coach
        FOREIGN KEY (coachId)
        REFERENCES users(userId)
        ON DELETE SET NULL
);