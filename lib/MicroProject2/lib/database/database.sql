CREATE TABLE participants (
    participant_id VARCHAR(36) PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255), 
    phone_number VARCHAR(50),
    password VARCHAR(255)
);

CREATE TABLE questions (
    question_id VARCHAR(36) PRIMARY KEY,
    title VARCHAR(255),
    possible_answers TEXT,
    good_answer TEXT
);

CREATE TABLE quizzes (
    quiz_id VARCHAR(36) PRIMARY KEY,
    title VARCHAR(255), 
    questions_id LONGTEXT
);

CREATE TABLE answers (
    answer_id VARCHAR(36) PRIMARY KEY,
    question_id VARCHAR(36),
    answer TEXT,
    FOREIGN KEY (question_id) REFERENCES questions(question_id) ON DELETE CASCADE
);

CREATE TABLE submissions (
    submission_id VARCHAR(36) PRIMARY KEY,
    quiz_id VARCHAR(36),
    participant_id VARCHAR(36),
    answers_id LONGTEXT,
    FOREIGN KEY (quiz_id) REFERENCES quizzes(quiz_id) ON DELETE CASCADE,
    FOREIGN KEY (participant_id) REFERENCES participants(participant_id) ON DELETE CASCADE
);
