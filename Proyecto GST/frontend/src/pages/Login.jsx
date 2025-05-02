import React from 'react'
import { Card, Container} from 'react-bootstrap'

export default function Login() {
  return (
    /*<div className='contenedor'>*/
    <div className='relative'>
      <Container>
        <Card>
          <Card.Body>
            <Card.Footer>Iniciar sesion</Card.Footer>
            <div className='contenedorInicarSesion'>
              <label htmlFor="Usuario">Escriba su usuario</label><br />
              <input type="text" id='usuario' name='usuario' placeholder='Escriba aqui:'/>
              <br />
              <br />
              <label htmlFor="Contraseña">Escriba su contraseña</label><br />
              <input type="text" id='contraseña' name='contraseña' placeholder='Escriba aqui' />
             </div>
          </Card.Body>
        </Card>
      </Container>  
    </div>
    /*</div>*/
  )
}
