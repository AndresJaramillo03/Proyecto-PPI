import React from 'react';
import { useNavigate } from 'react-router-dom';
import '../css/styleHeader.css';

export default function Header() {
  const navigate = useNavigate();
  
  return (
    <header className="navbar custom-navbar shadow-sm">
      <div className="container d-flex justify-content-between align-items-center">
        <h1 className="titulo-gst m-0">GST</h1>
        <div className="botones">
          <button onClick={() => navigate("/Home")}>Inicio</button>
          <button onClick={() => navigate("/Forms")}>Formulario</button>
          <button onClick={() => navigate("/Login")}>Registro</button>
        </div>
      </div>
    </header>
  );
}