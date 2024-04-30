import React, { useState } from 'react';

const Todo = ({ todo }) => {
  const [isChecked, setIsChecked] = useState(todo.completed);

  const handleCheckboxChange = () => {
    setIsChecked(!isChecked);
  };

  return (
    <div>
      <input
        type="checkbox"
        checked={isChecked}
        onChange={handleCheckboxChange}
      />
      <span>{todo.text}</span>
    </div>
  );
};

export default Todo;
