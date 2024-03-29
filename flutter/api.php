<?php
header('Content-Type: application/json');

// Обработка GET-запроса
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $data = array('message' => 'Hello from PHP!', 'status' => 'success');
    echo json_encode($data);
} else {
    http_response_code(405); // Method Not Allowed
    $error = array('message' => 'Method Not Allowed', 'status' => 'error');
    echo json_encode($error);
}
$data = json_decode(file_get_contents("php://input"), true);

// Обработка запроса на получение списка факультетов
if ($data['action'] === 'get_departments') {
    $departments = ['IT', 'Marketing', 'Finance', 'HR'];
    
    // Возвращаем список факультетов в формате JSON
    echo json_encode($departments);
}

// Обработка запроса на добавление факультета
if ($data['action'] === 'add_department') {
    $newDepartment = $data['department'];
    
    // Добавляем факультет в базу данных или другое хранилище
    
    // Возвращаем успешный статус
    echo json_encode(['message' => 'Department added successfully']);
}
?>