import React, { useState } from 'react';
import { Card, Container } from 'react-bootstrap';
import '../style/About.css';

export default function About() {

    let [mostrarContenido, setmostrarContenido] = useState(false)

  return (
    <Container>
            <h2>Sobre Nosotros: Innovación y Pasión por la Tecnología</h2>
            <Card>

                <Card.Body>
                    <ul>
                        <h6>En el corazón de este proyecto se encuentra un equipo diverso y apasionado, unido por la visión de crear experiencias digitales excepcionales. 
                        Permítanos presentarles a algunos de los talentos que hacen posible este sitio:</h6>
                        <br />
                        <li>
                        Elena Ramírez, Líder de Desarrollo Front-End:
                        Con una trayectoria de más de 8 años en el desarrollo web, Elena es una experta en la creación de interfaces de usuario intuitivas y atractivas. 
                        Su enfoque meticuloso y su pasión por las últimas tecnologías front-end, como React y Vue.js, garantizan una experiencia de usuario fluida y moderna.
                        </li>
                        <br />
                        {mostrarContenido &&(
                            <>
                                <li>
                                Javier Mendoza, Arquitecto de Software Back-End:
                                Javier es el cerebro detrás de la infraestructura robusta y escalable que impulsa este sitio. Su profundo conocimiento de 
                                arquitecturas de software y su dominio de lenguajes como Node.js y Python aseguran un rendimiento óptimo y una seguridad impecable.
                                </li>
                                <br />
                                <li>
                                Sofía Herrera, Diseñadora de Experiencia de Usuario (UX):
                                Sofía es la responsable de que cada interacción en este sitio sea significativa y placentera. Su enfoque centrado en el usuario y 
                                su habilidad para traducir necesidades complejas en diseños intuitivos son fundamentales para la satisfacción de nuestros visitantes.
                                </li>
                                <br />
                                <li>
                                Carlos Fernández, Especialista en Ciberseguridad:
                                Carlos es el encargado de proteger nuestra plataforma, y a nuestros usuarios, de los peligros del mundo digital. 
                                Con amplios conocimientos en la detección y prevención de ciberataques, Carlos asegura que la información de nuestros usuarios este siempre protegida.
                                </li>
                                <br />
                                <li>
                                Daniela Vargas, Gestora de Proyectos:
                                Daniela es la que se encarga de que todos los miembros del equipo trabajen en conjunto de manera efectiva, y de que los objetivos se cumplan. 
                                Con su amplio conocimiento en la gestión de proyectos, Daniela asegura la correcta realización de todas las fases del proyecto.
                                </li>
                                <br />
                                <h5>Nuestra Filosofía:</h5>
                                <p>Creemos en la colaboración, la innovación y el aprendizaje continuo. Nos esforzamos por mantenernos a la 
                                    vanguardia de las últimas tendencias tecnológicas y por crear soluciones que superen las expectativas de nuestros usuarios.
                                </p>
                                <br />
                                <h5>Nuestro Compromiso:</h5>
                                <p>Estamos comprometidos con la excelencia y la transparencia. Valoramos la retroalimentación de nuestros usuarios y nos esforzamos por mejorar continuamente.
                                    Este equipo ficticio le da un toque humano y profesional a tu página "About.jsx", creando una sensación de confianza y cercanía con los visitantes del sitio.
                                </p>

                            </>
                        )}
                            </ul>
                            <br />
                        <button className='btn btn-sm botonVerMas' onClick={() => setmostrarContenido(!mostrarContenido)} > {mostrarContenido ? 'Mostrar menos del articulo':'Mostrar mas sobre el articulo'}</button>
                        <br />
                        <br />
                    <div className='imagenGif'>
                        <img src="" alt="" />
                    </div>

                </Card.Body>

            </Card>
    </Container>
  )
}