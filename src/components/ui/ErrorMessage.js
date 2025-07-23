import React from 'react';
import Card from './Card';

const ErrorMessage = ({ message }) => (
  <Card className="bg-red-50 border border-red-200 text-red-700">
    <div className="p-6 text-center">
      <h3 className="font-bold mb-2 text-red-800">Oops! Something went wrong.</h3>
      <p className="text-red-600">{message}</p>
    </div>
  </Card>
);

export default ErrorMessage;