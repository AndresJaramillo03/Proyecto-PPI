import React from 'react';
import { Card, Container } from 'react-bootstrap';

export default function Login() {
  return (
    <div className='relative'>
      <Container className="d-flex justify-content-center align-items-center min-vh-100">
        <Card style={{ width: '100%', maxWidth: '400px' }} className="shadow-sm">
          <Card.Header className="text-center bg-primary text-white">
            <h5>Iniciar Sesión</h5>
          </Card.Header>
          <Card.Body>
            <div className='contenedorIniciarSesion'>
              <div className="mb-3">
                <label htmlFor="usuario" className="form-label">Escriba su usuario</label>
                <input
                  type="text"
                  id="usuario"
                  name="usuario"
                  className="form-control"
                  placeholder="Escriba aquí"
                />
              </div>
              <div className="mb-3">
                <label htmlFor="contraseña" className="form-label">Escriba su contraseña</label>
                <input
                  type="password"
                  id="contraseña"
                  name="contraseña"
                  className="form-control"
                  placeholder="Escriba aquí"
                />
              </div>
            </div>
          </Card.Body>
        </Card>
      </Container>
    </div>
  );
}