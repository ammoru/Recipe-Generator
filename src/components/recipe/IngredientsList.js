import React, { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';

const IngredientsList = ({ ingredients }) => (
  <div>
    <h3 className="text-2xl font-bold text-slate-800 mb-4">Ingredients</h3>
    <ul className="space-y-3">
      {ingredients.map((item, index) => (
        <motion.li
          key={index}
          className="flex items-center bg-slate-100 p-3 rounded-lg border border-slate-200"
          initial={{ opacity: 0, x: -20 }}
          animate={{ opacity: 1, x: 0 }}
          transition={{ duration: 0.5, delay: index * 0.1 }}
        >
          <span className="font-bold text-emerald-600 w-1/3">{item.quantity}</span>
          <span className="text-slate-700">{item.name}</span>
          {item.notes && <span className="text-slate-500 italic ml-2">({item.notes})</span>}
        </motion.li>
      ))}
    </ul>
  </div>
);

export default IngredientsList;