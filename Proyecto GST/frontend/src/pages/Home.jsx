import React from 'react';
import { Card, Container } from 'react-bootstrap';
import '../css/style.css';

export default function Home() {
  return (
    <div className="home-background">
      <Container className="d-flex justify-content-center align-items-center min-vh-100">
        <Card className="custom-card shadow-lg">
          <Card.Header className="custom-header text-white text-center">
            <h3>Carta de presentación para ti</h3>
          </Card.Header>
          <Card.Body className="text-center">
            <h4 className="custom-text">
              ¡Bienvenido! En GST, creemos firmemente que cuidar nuestra mente es 
              fundamental para prosperar en el trabajo y en la vida. Este espacio ha sido creado pensando en ti, para 
              ofrecerte un lugar seguro donde encontrar apoyo, aprender y tomar las riendas de tu bienestar mental en 
              el entorno laboral.
            </h4>
          </Card.Body>
        </Card>

      </Container>
  
      <Container className="d-flex justify-content-center align-items-center min-vh-100">
        <Card className="custom-card shadow-lg">
          <Card.Header className="custom-header text-white text-center">
            <h3>Consejos para que tu dia sea mejor</h3>
          </Card.Header>

          <Card.Body className="text-center">
            <h4 className="custom-text">Empieza con calma</h4>
            <p className="custom-text">En lugar de saltar de la cama al estrés, dedica unos minutos a estirarte suavemente, 
              respirar profundo o simplemente estar presente antes de revisar tu teléfono o empezar tus tareas.</p>
          </Card.Body >

          <Card.Body className="text-center">
            <h4 className="custom-text">Muévete un poco</h4>
            <p className="custom-text">La actividad física libera endorfinas, que tienen un efecto positivo en tu estado de ánimo. 
              No tiene que ser un entrenamiento intenso; una caminata corta, bailar con tu canción favorita o hacer algunos estiramientos 
              pueden marcar la diferencia.</p>
          </Card.Body>

          <Card.Body className="text-center">
            <h4 className="custom-text">Conecta con otros</h4>
            <p className="custom-text">Las interacciones sociales significativas son importantes para nuestra salud mental. 
              Llama a un amigo, tómate un café con alguien querido o simplemente charla con un vecino.</p>
          </Card.Body>

        </Card>

      </Container>

    </div>
  );
}