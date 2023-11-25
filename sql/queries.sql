-- name: CreateCategory :exec
INSERT INTO categories (name) VALUES(?);

-- name: GetCategory :one
SELECT * FROM categories WHERE id = ?;

-- name: GetCategories :many
SELECT * FROM categories;

-- name: CreateCourse :exec
INSERT INTO courses (name, category_id) VALUES(?,?);

-- name: GetCourse :one
SELECT * FROM courses WHERE id = ?;

-- name: GetCourses :many
SELECT * FROM courses;

-- name: UpdateCategory :exec
UPDATE categories SET name = ? WHERE id = ?;

-- name: DeleteCategory :exec
DELETE FROM categories WHERE id = ?;

-- name: UpdateCourse :exec
UPDATE courses SET name = ?, category_id = ? WHERE id = ?;

-- name: DeleteCourse :exec
DELETE FROM courses WHERE id = ?;

-- name: UpdateLesson :exec
UPDATE lessons SET name = ?, course_id = ? WHERE id = ?;

-- name: DeleteLesson :exec
DELETE FROM lessons WHERE id = ?;

-- name: UpdateQuestion :exec
UPDATE questions SET name = ?, lesson_id = ? WHERE id = ?;

-- name: DeleteQuestion :exec
DELETE FROM questions WHERE id = ?;

-- name: UpdateAnswer :exec
UPDATE answers SET name = ?, question_id = ? WHERE id = ?;

-- name: DeleteAnswer :exec
DELETE FROM answers WHERE id = ?;

-- name: UpdateUser :exec
UPDATE users SET name = ?, email = ?, password = ?, role = ? WHERE id = ?;

-- name: DeleteUser :exec
DELETE FROM users WHERE id = ?;

-- name: UpdateUserCourse :exec
UPDATE user_courses SET user_id = ?, course_id = ? WHERE id = ?;

-- name: DeleteUserCourse :exec
DELETE FROM user_courses WHERE id = ?;

-- name: UpdateUserLesson :exec
UPDATE user_lessons SET user_id = ?, lesson_id = ? WHERE id = ?;

-- name: DeleteUserLesson :exec
DELETE FROM user_lessons WHERE id = ?;

-- name: UpdateUserQuestion :exec
UPDATE user_questions SET user_id = ?, question_id = ? WHERE id = ?;

-- name: DeleteUserQuestion :exec
DELETE FROM user_questions WHERE id = ?;

-- name: UpdateUserAnswer :exec
UPDATE user_answers SET user_id = ?, answer_id = ? WHERE id = ?;

-- name: DeleteUserAnswer :exec
DELETE FROM user_answers WHERE id = ?;

-- Exemplo de INNER JOIN para obter informações do curso e sua categoria
-- name: GetCourseWithCategory :one
SELECT courses.id AS course_id, courses.name AS course_name, categories.id AS category_id, categories.name AS category_name
FROM courses
INNER JOIN categories ON courses.category_id = categories.id
WHERE courses.id = ?;

-- Exemplo de LEFT JOIN para obter informações do curso e sua categoria (incluindo cursos sem categoria)
-- name: GetCourseWithCategoryLeftJoin :one
SELECT courses.id AS course_id, courses.name AS course_name, categories.id AS category_id, categories.name AS category_name
FROM courses
LEFT JOIN categories ON courses.category_id = categories.id
WHERE courses.id = ?;

-- Exemplo de INNER JOIN para obter informações da lição e o curso ao qual ela pertence
-- name: GetLessonWithCourse :one
SELECT lessons.id AS lesson_id, lessons.name AS lesson_name, courses.id AS course_id, courses.name AS course_name
FROM lessons
INNER JOIN courses ON lessons.course_id = courses.id
WHERE lessons.id = ?;

-- Exemplo de LEFT JOIN para obter informações da lição e o curso ao qual ela pertence (incluindo lições sem curso)
-- name: GetLessonWithCourseLeftJoin :one
SELECT lessons.id AS lesson_id, lessons.name AS lesson_name, courses.id AS course_id, courses.name AS course_name
FROM lessons
LEFT JOIN courses ON lessons.course_id = courses.id
WHERE lessons.id = ?;

-- Exemplo de INNER JOIN para obter informações da pergunta, resposta e lição
-- name: GetQuestionWithAnswerAndLesson :one
SELECT questions.id AS question_id, questions.name AS question_name, answers.id AS answer_id, answers.name AS answer_name, lessons.id AS lesson_id, lessons.name AS lesson_name
FROM questions
INNER JOIN answers ON questions.id = answers.question_id
INNER JOIN lessons ON questions.lesson_id = lessons.id
WHERE questions.id = ?;

-- Exemplo de LEFT JOIN para obter informações da pergunta, resposta e lição (incluindo perguntas sem respostas)
-- name: GetQuestionWithAnswerAndLessonLeftJoin :one
SELECT questions.id AS question_id, questions.name AS question_name, answers.id AS answer_id, answers.name AS answer_name, lessons.id AS lesson_id, lessons.name AS lesson_name
FROM questions
LEFT JOIN answers ON questions.id = answers.question_id
LEFT JOIN lessons ON questions.lesson_id = lessons.id
WHERE questions.id = ?;

-- Exemplo de INNER JOIN para obter informações do usuário e curso que ele está fazendo
-- name: GetUserWithCourse :one
SELECT users.id AS user_id, users.name AS user_name, user_courses.id AS user_course_id, courses.id AS course_id, courses.name AS course_name
FROM users
INNER JOIN user_courses ON users.id = user_courses.user_id
INNER JOIN courses ON user_courses.course_id = courses.id
WHERE users.id = ?;

-- Exemplo de LEFT JOIN para obter informações do usuário e curso que ele está fazendo (incluindo usuários sem cursos)
-- name: GetUserWithCourseLeftJoin :one
SELECT users.id AS user_id, users.name AS user_name, user_courses.id AS user_course_id, courses.id AS course_id, courses.name AS course_name
FROM users
LEFT JOIN user_courses ON users.id = user_courses.user_id
LEFT JOIN courses ON user_courses.course_id = courses.id
WHERE users.id = ?;

-- Exemplo de INNER JOIN para obter informações do usuário e lição que ele está fazendo
-- name: GetUserWithLesson :one
SELECT users.id AS user_id, users.name AS user_name, user_lessons.id AS user_lesson_id, lessons.id AS lesson_id, lessons.name AS lesson_name
FROM users
INNER JOIN user_lessons ON users.id = user_lessons.user_id
INNER JOIN lessons ON user_lessons.lesson_id = lessons.id
WHERE users.id = ?;

-- Exemplo de LEFT JOIN para obter informações do usuário e lição que ele está fazendo (incluindo usuários sem lições)
-- name: GetUserWithLessonLeftJoin :one
SELECT users.id AS user_id, users.name AS user_name, user_lessons.id AS user_lesson_id, lessons.id AS lesson_id, lessons.name AS lesson_name
FROM users
LEFT JOIN user_lessons ON users.id = user_lessons.user_id
LEFT JOIN lessons ON user_lessons.lesson_id = lessons.id
WHERE users.id = ?;
