import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import fondoHome from '../assets/fondo-home.jpg';
import '../css/loginForm.css';

export default function Login() {
  const navigate = useNavigate();
  const [usuario, setUsuario] = useState('');
  const [contrasena, setContrasena] = useState('');

  const handleLogin = async () => {
    try {
      const response = await axios.post('http://localhost:3000/api/login', {
        usuario,
        contrasena,
      });

      if (response.data.success) {
        localStorage.setItem('usuario', JSON.stringify(response.data.usuario));
        navigate('/Forms');
      } else {
        alert('Credenciales incorrectas');
      }
    } catch (error) {
      console.error('Error al iniciar sesión', error);
      alert('Error del servidor al iniciar sesión');
    }
  };

  const handleRegister = () => {
    navigate('/Register');
  };

  const handleHome = () => {
    navigate('/');
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
          value={usuario}
          onChange={(e) => setUsuario(e.target.value)}
        />
        <input
          type="password"
          className="login-input mb-3"
          placeholder="Contraseña"
          value={contrasena}
          onChange={(e) => setContrasena(e.target.value)}
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
        <button className="login-button mb-3" onClick={handleLogin}>
          INICIAR
        </button>
        <button className="login-button mb-3" onClick={handleRegister}>
          REGISTRARSE
        </button>
      </div>
    </div>
  );
}