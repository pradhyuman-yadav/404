import React from 'react';
import './PageNotFound.css';

const PageNotFound = () => {
  return (
    <div className="container-404">
      <h1 data-text="404">404</h1>
      <p>Oops! The page you're looking for doesn't exist.</p>
      <a href="/">Go back to the homepage</a>
    </div>
  );
};

export default PageNotFound;
