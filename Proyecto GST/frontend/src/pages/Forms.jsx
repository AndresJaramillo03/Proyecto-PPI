import React, { useState } from 'react';
import '../css/style.css';
import { Container } from 'react-bootstrap';
import { Button, Modal, Form } from 'react-bootstrap';

export default function Forms() {
  const [show, setShow] = useState(false);

  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);

  return (
    <div className="relative">
      <Container className="text-center py-5">

        <h2 className="mb-4 text-white">Bienestar Emocional en el Trabajo</h2>

        <div className="d-flex justify-content-center gap-3">
          <button className="btn btn-primary px-4" onClick={handleShow}>
            Crear nuevo formulario
          </button>

          <button className="btn btn-outline-light px-4">
            Ver último formulario
          </button>
        </div>

      </Container>

      <Modal show={show} onHide={handleClose}>
        <Modal.Header closeButton>
          <Modal.Title>FORMULARIO</Modal.Title>
        </Modal.Header>

        <Modal.Body>
          <Form>

            <Form.Group className="mb-3" controlId="formPregunta">
              <Form.Label>¿Cómo te has sentido emocionalmente en el trabajo durante la última semana?</Form.Label>
              <Form.Control type="text" placeholder="Ingresa la respuesta" />
            </Form.Group>

            <Form.Group className="mb-3" controlId="formPregunta">
              <Form.Label>¿Te sientes motivado/a para realizar tus tareas diarias?</Form.Label>
              <Form.Control type="text" placeholder="Ingresa la respuesta" />
            </Form.Group>

            <Form.Group className="mb-3" controlId="formPregunta">
              <Form.Label>¿Sientes que tu trabajo es valorado por tus superiores o compañeros?</Form.Label>
              <Form.Control type="text" placeholder="Ingresa la respuesta" />
            </Form.Group>

            <Form.Group className="mb-3" controlId="formPregunta">
              <Form.Label>¿Has sentido estrés o ansiedad relacionados con el trabajo recientemente?</Form.Label>
              <Form.Control type="text" placeholder="Ingresa la respuesta" />
            </Form.Group>

            <Form.Group className="mb-3" controlId="formPregunta">
              <Form.Label>¿Te resulta fácil concentrarte en tus tareas durante la jornada laboral?</Form.Label>
              <Form.Control type="text" placeholder="Ingresa la respuesta" />
            </Form.Group>

            <Form.Group className="mb-3" controlId="formPregunta">
              <Form.Label>¿Te sientes agotado/a al final del día laboral?</Form.Label>
              <Form.Control type="text" placeholder="Ingresa la respuesta" />
            </Form.Group>

            <Form.Group className="mb-3" controlId="formPregunta">
              <Form.Label>¿Te sientes apoyado/a emocionalmente por tus compañeros y/o líderes?</Form.Label>
              <Form.Control type="text" placeholder="Ingresa la respuesta" />
            </Form.Group>

            <Form.Group className="mb-3" controlId="formPregunta">
              <Form.Label>¿Sientes que puedes hablar abiertamente sobre cómo te sientes en el trabajo?</Form.Label>
              <Form.Control type="text" placeholder="Ingresa la respuesta" />
            </Form.Group>

            <Form.Group className="mb-3" controlId="formPregunta">
              <Form.Label>¿Te sientes satisfecho/a con el equilibrio entre tu vida laboral y personal?</Form.Label>
              <Form.Control type="text" placeholder="Ingresa la respuesta" />
            </Form.Group>

            <Form.Group className="mb-3" controlId="formPregunta">
              <Form.Label>¿Hay algo que actualmente te esté afectando negativamente en tu entorno laboral?</Form.Label>
              <Form.Control type="text" placeholder="Ingresa la respuesta" />
            </Form.Group>

            </Form>
        </Modal.Body>

        <Modal.Footer>
          <Button>Enviar</Button>
        </Modal.Footer>
      </Modal>
    </div>
  );
}