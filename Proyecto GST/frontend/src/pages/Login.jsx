import React from 'react';
import { Link, useNavigate } from 'react-router-dom';
import fondoHome from '../assets/fondo-home.jpg';
import '../css/loginForm.css';
import Home from './Home';

export default function Login() {
  const navigate = useNavigate();

  const handleHome = () => {
    navigate('/');
  };

  const handleRegister = () => {
    navigate('/Register');
  };
  

  return (
    <div
      className="login-wrapper"
      style={{
        backgroundImage: `url(${fondoHome})`,
        backgroundSize: 'cover',
        backgroundPosition: 'center',
        width: '100vw',
        height: '100vh',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
      }}
    >
      <div className="login-card text-center">
        <h2 className="mb-4">INICIA SESIÓN</h2>
        <input
          type="text"
          className="login-input mb-3"
          placeholder="Usuario"
        />
        <input
          type="password"
          className="login-input mb-3"
          placeholder="Contraseña"
        />
        <div className="form-check text-start mb-3">
          <input
            className="form-check-input"
            type="checkbox"
            id="recordar"
            checked
            readOnly
          />
          <label className="form-check-label label" htmlFor="recordar">
            Recordar
          </label>
        </div>

        {}
        <button className="login-button mb-3" onClick={handleHome}>INICIAR</button>

        {}
        
        <button className="login-button mb-3" onClick={handleRegister}>REGISTRARSE</button>
      </div>
    </div>
  );
}