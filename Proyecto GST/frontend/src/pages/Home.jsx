import '../css/style.css';
import React, { useState } from 'react';
import ilustracion from '../assets/ilustracion.png';

export default function Home() {
  const [showMore, setShowMore] = useState(false);

  const VerMas = () => {
    setShowMore(!showMore);
  };

  return (
    <div className="hero-section">
      <div className="hero-content">
        <div className="hero-text">
          <h1>Tu bienestar <br /> mental es nuestra <br /> prioridad.</h1>

          {showMore ? (
            <p>En este espacio, creemos que la salud mental es la base de una vida equilibrada y satisfactoria.
               Estamos comprometidos a brindarte el apoyo necesario para que puedas explorar tus emociones sin miedo ni prejuicios,
               conectar con profesionales que te escuchen y comprenderte, y acceder a herramientas prácticas que te acompañen en tu día a día. 
               Aquí encontrarás talleres, charlas y contenidos interactivos diseñados para fortalecer tu resiliencia, mejorar tus relaciones y
               potenciar tu energía vital. Nuestro objetivo es que descubras recursos para cuidar de ti mismo: desde técnicas de mindfulness y 
               manejo del estrés, hasta ejercicios de autoexploración y grupos de apoyo. ¡Bienvenido a un espacio donde tu salud emocional florece
               y tu bienestar cobra vida!.</p>
          ) : (
            <p>En este espacio, creemos que la salud mental es la base de una vida equilibrada y satisfactoria.
            Estamos comprometidos a brindarte el apoyo necesario para que...</p>)}

            <button className="hero-button" onClick={VerMas}> {showMore ? 'Ver menos' : 'Ver más'}</button>

          

        </div>
        <div className="hero-image">
          <img src={ilustracion} alt="Ilustración bienestar mental" />
        </div>
      </div>
    </div>
  );
}