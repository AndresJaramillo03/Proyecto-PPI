import React, { useState } from "react";
import fondoHome from "../assets/fondo-home.png";
import { Container, Row, Col, Form, Button } from "react-bootstrap";
import axios from "axios";

export default function Forms() {
  const [respuestas, setRespuestas] = useState({
    r1: "",
    r2: "",
    r3: "",
    r4: "",
    r5: "",
    r6: "",
  });

  const handleChange = (e) => {
    const { id, value } = e.target;
    setRespuestas({ ...respuestas, [id]: value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {

      const preguntasResponse = await axios.post("http://localhost:3000/preguntas", {
        ...respuestas,
        r7: "Bien",
        r8: "Bien",
        r9: "Bien",
        r10: "Ninguno",
      });

      const id_pregunta_fk = preguntasResponse.data.id_pregunta;


      const formularioResponse = await axios.post("http://localhost:3000/formularios", {
        id_pregunta_fk,
        id_usuario_fk: 1,
      });

      alert("Formulario enviado con éxito");

    } catch (error) {
      console.error(error);
      alert("Error al enviar el formulario.");
    }
  };

  return (
    <div
      className="form-page-wrapper"
      style={{ backgroundImage: `url(${fondoHome})` }}
    >
      <div className="form-card">
        <h2 className="text-center">FORMULARIO</h2>
        <Form onSubmit={handleSubmit}>
          <Row className="gy-4">
            <Col md={6}>
              <Form.Group controlId="r1">
                <Form.Label>
                  ¿Sientes que las demandas de tu trabajo son excesivas o difíciles de manejar?
                </Form.Label>
                <Form.Control type="text" value={respuestas.r1} onChange={handleChange} />
              </Form.Group>
            </Col>

            <Col md={6}>
              <Form.Group controlId="r2">
                <Form.Label>
                  ¿Te resulta difícil desconectar del trabajo fuera del horario laboral?
                </Form.Label>
                <Form.Control type="text" value={respuestas.r2} onChange={handleChange} />
              </Form.Group>
            </Col>

            <Col md={6}>
              <Form.Group controlId="r3">
                <Form.Label>
                  ¿Experimentas fatiga o agotamiento, incluso después de descansar?
                </Form.Label>
                <Form.Control type="text" value={respuestas.r3} onChange={handleChange} />
              </Form.Group>
            </Col>

            <Col md={6}>
              <Form.Group controlId="r4">
                <Form.Label>
                  ¿Sientes que no tienes suficiente control sobre tus tareas o decisiones laborales?
                </Form.Label>
                <Form.Control type="text" value={respuestas.r4} onChange={handleChange} />
              </Form.Group>
            </Col>

            <Col md={6}>
              <Form.Group controlId="r5">
                <Form.Label>
                  ¿Te resulta difícil cumplir con los plazos y objetivos de trabajo?
                </Form.Label>
                <Form.Control type="text" value={respuestas.r5} onChange={handleChange} />
              </Form.Group>
            </Col>

            <Col md={6}>
              <Form.Group controlId="r6">
                <Form.Label>
                  ¿Sientes que tu carga de trabajo ha aumentado significativamente en los últimos meses?
                </Form.Label>
                <Form.Control type="text" value={respuestas.r6} onChange={handleChange} />
              </Form.Group>
            </Col>
          </Row>

          <div className="form-actions mt-4 d-flex justify-content-between">
            <Button variant="info" type="submit">Enviar</Button>
            <Button variant="outline-secondary" type="button">Ver último formulario</Button>
          </div>
        </Form>
      </div>
    </div>
  );
}