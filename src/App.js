// App.js
import React from 'react';
import TodoList from './TodoList';

function App() {
  const todos = [
    { text: 'Learn React', completed: false },
    { text: 'Build a Todo App', completed: false },
    { text: 'Deploy the App', completed: false }
  ];

  return (
    <div className="App">
      <h1>Todo List</h1>
      <TodoList todos={todos} />
    </div>
  );
}

export default App;

// This is a new comment added to the end of the file
