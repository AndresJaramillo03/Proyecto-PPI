import React from 'react';
import '../css/style.css';
import ilustracion from '../assets/ilustracion.png'; // Usa la imagen que se ve en tu mockup

export default function Home() {
  return (
    <div className="hero-section">
      <div className="hero-content">
        <div className="hero-text">
          <h1>Tu bienestar <br /> mental es nuestra <br /> prioridad.</h1>
          <p>
            En este espacio, creemos que la salud mental es la base de una vida equilibrada y satisfactoria.
            Estamos comprometidos a brindarte el apoyo necesario para que...
          </p>
          <button className="hero-button">LEER MÁS</button>
        </div>
        <div className="hero-image">
          <img src={ilustracion} alt="Ilustración bienestar mental" />
        </div>
      </div>
    </div>
  );
}