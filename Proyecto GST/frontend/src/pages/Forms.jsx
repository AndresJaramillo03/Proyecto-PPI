import React, { useState } from 'react';
import '../css/loginForm.css';
import fondoHome from '../assets/fondo-home.png';
import { Container, Row, Col, Form, Button } from 'react-bootstrap';

export default function Forms() {

//Aqui

  // Estado para cada respuesta
  const [responses, setResponses] = useState({
    pregunta1: '',
    pregunta2: '',
    pregunta3: '',
    pregunta4: '',
    pregunta5: '',
    pregunta6: '',
  });

  const [lastForm, setLastForm] = useState(null);
  const [message, setMessage] = useState('');
  const apiUrl = 'http://localhost:3000/formularios'; // ajusta si tu ruta es distinta

  // Maneja cambio en inputs
  const handleChange = e => {
    const { id, value } = e.target;
    setResponses(prev => ({ ...prev, [id]: value }));
  };

  // Enviar form completo
  const handleSubmit = async (e) => {
    e.preventDefault();
    setMessage('Guardando...');
    try {
      // Prepara payload de preguntas y usuario (aquí 123 es ejemplo de id_usuario)
      const payload = {
        // si tu backend espera un objeto "respuestas", ajústalo
        respuestas: responses,
        id_usuario_fk: 123
      };
      const res = await fetch(apiUrl, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
      });
      const body = await res.json();
      if (res.ok) {
        setMessage('Formulario enviado correctamente');
        setResponses({ pregunta1: '', pregunta2: '', pregunta3: '', pregunta4: '', pregunta5: '', pregunta6: '' });
      } else {
        setMessage(body.message || 'Error al enviar');
      }
    } catch (err) {
      setMessage('Fallo de red al enviar');
    }
  };

  // Obtener último formulario
  const handleViewLast = async () => {
    setMessage('Cargando último formulario...');
    try {
      const res = await fetch(apiUrl);
      const data = await res.json();
      if (Array.isArray(data) && data.length) {
        const last = data[data.length - 1];
        setLastForm(last);
        setMessage('Último formulario cargado');
      } else {
        setMessage('No hay formularios');
      }
    } catch {
      setMessage('Error al cargar');
    }
  };

//

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