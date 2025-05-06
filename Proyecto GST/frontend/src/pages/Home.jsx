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
    </div>
  );
}