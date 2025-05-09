import React from 'react';
import '../css/loginForm.css';
import fondoHome from '../assets/fondo-home.png';
import { Container, Row, Col, Form, Button } from 'react-bootstrap';

export default function Forms() {
  return (
    <div
      className="form-page-wrapper"
      style={{ backgroundImage: `url(${fondoHome})` }}
    >
      <div className="form-card">
        <h2 className="text-center">FORMULARIO</h2>

        <Form>
          <Row className="gy-4">
            <Col md={6}>
              <Form.Group controlId="pregunta1">
                <Form.Label>
                  ¿Sientes que las demandas de tu trabajo son excesivas o difíciles de manejar?
                </Form.Label>
                <Form.Control type="text" placeholder="Ingresa tu respuesta" />
              </Form.Group>
            </Col>

            <Col md={6}>
              <Form.Group controlId="pregunta2">
                <Form.Label>
                  ¿Te resulta difícil desconectar del trabajo fuera del horario laboral?
                </Form.Label>
                <Form.Control type="text" placeholder="Ingresa tu respuesta" />
              </Form.Group>
            </Col>

            <Col md={6}>
              <Form.Group controlId="pregunta3">
                <Form.Label>
                  ¿Experimentas fatiga o agotamiento, incluso después de descansar?
                </Form.Label>
                <Form.Control type="text" placeholder="Ingresa tu respuesta" />
              </Form.Group>
            </Col>

            <Col md={6}>
              <Form.Group controlId="pregunta4">
                <Form.Label>
                  ¿Sientes que no tienes suficiente control sobre tus tareas o decisiones laborales?
                </Form.Label>
                <Form.Control type="text" placeholder="Ingresa tu respuesta" />
              </Form.Group>
            </Col>

            <Col md={6}>
              <Form.Group controlId="pregunta5">
                <Form.Label>
                  ¿Te resulta difícil cumplir con los plazos y objetivos de trabajo?
                </Form.Label>
                <Form.Control type="text" placeholder="Ingresa tu respuesta" />
              </Form.Group>
            </Col>

            <Col md={6}>
              <Form.Group controlId="pregunta6">
                <Form.Label>
                  ¿Sientes que tu carga de trabajo ha aumentado significativamente en los últimos meses?
                </Form.Label>
                <Form.Control type="text" placeholder="Ingresa tu respuesta" />
              </Form.Group>
            </Col>
          </Row>

          <div className="form-actions">
            <Button variant="info">Enviar</Button>
            <Button variant="outline-secondary">Ver último formulario</Button>
          </div>
        </Form>
      </div>
    </div>
  );
}