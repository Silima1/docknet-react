import React from 'react';
import { createRoot } from 'react-dom/client'; // Importe createRoot do React a partir de "react-dom/client"
import App from './App';
import { render, screen } from '@testing-library/react';
import { act } from 'react-dom/test-utils'; // Importe a função act do React Testing Library

it('renders without crashing', () => {
  const div = document.createElement('div');
  const root = createRoot(div);
  
  act(() => { // Envolve a renderização em act
    root.render(<App />);
  });
});
