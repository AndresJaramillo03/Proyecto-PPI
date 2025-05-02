import React from 'react'
import { Card, Container } from 'react-bootstrap';
import '../style/Home.css'

export default function Home() {
  return (
    <Container>
        <h1>Bienvenido al sitio</h1>

        <Card>
            <Card.Body>
                <h3>Tendencias de la IA</h3>

                <ul>
                    <li>Agentes de IA: Sistemas autónomos para tareas complejas.</li>
                    <li>IA Multimodal: Integración de diversos datos (texto, imágenes, audio) para una comprensión más rica.</li>
                    <li>IA Generativa: Creación de contenido original (texto, imágenes, música).</li>
                    <li>IA y Experiencia del Cliente: Personalización y mejora de interacciones con IA.</li>
                    <li>Ética y Regulación: Desarrollo de marcos para un uso responsable de la IA.</li>
                    <li>Democratización de la IA: herramientas de IA cada vez mas accesibles para todos.</li>
                    <li>Hardware Especializado: Desarrollo de hardware para procesos de IA mas rapidos.</li>
                    <li>IA en Salud: Avances en diagnóstico, tratamiento y medicina personalizada.</li>
                </ul>
                <br />
                <div className='imagenIA'>
                    <img src="" alt="" />
                </div>

            </Card.Body>
        </Card>

        <Card>
            <Card.Body>
                <h3>Ciberseguridad</h3>

                <ul>
                    <li>Inteligencia Artificial (IA) en Ciberseguridad:
                    Uso de la IA para detectar y responder a amenazas cibernéticas.</li>
                    <li>Seguridad Zero Trust:
                    Verificación continua y derechos de acceso mínimos.</li>
                    <li>Seguridad en la Nube:
                    Protección de datos y aplicaciones en entornos de nube.</li>
                    <li>Seguridad de IoT:
                    Protección de dispositivos conectados a Internet.</li>
                    <li>Aumento de Ataques de Phishing:
                    Incremento en la sofisticación de los ataques de suplantación de identidad.</li>
                    <li>Computación Cuántica:
                    Evolución de la computación que implica nuevos retos en la ciberseguridad, y nuevos métodos de proteccion.</li>
                    <li>Ciberseguridad en la periferia:
                    Protección de los dispositivos que se encuentran fuera de las redes corporativas.</li>
                </ul>
                <br />
                <div className='imagenCiberseguridad'>
                    <img src="" alt="" />
                </div>
            </Card.Body>
        </Card>

        <Card>
            <Card.Body>
                <h3>Tendecias de desarrollo</h3>

                <ul>
                    <li>Inteligencia Artificial (IA) y Aprendizaje Automático (ML):
                    Integración de IA y ML en aplicaciones para automatización y análisis de datos.</li>
                    <li>Desarrollo Low-Code/No-Code:
                    Plataformas que permiten crear aplicaciones con poca o ninguna programación.</li>
                    <li>Desarrollo de Aplicaciones Nativas de la Nube:
                    Creación de aplicaciones diseñadas para entornos de nube.</li>
                    <li>DevOps y DevSecOps:
                    Automatización de procesos de desarrollo y operaciones, con integración de seguridad.</li>
                    <li>Microservicios:
                    Desarrollo de aplicaciones como conjuntos de servicios pequeños e independientes.</li>
                    <li>Contenedores y Orquestación (Docker, Kubernetes):
                    Tecnologías para empaquetar y gestionar aplicaciones en contenedores.</li>
                    <li>Desarrollo de Aplicaciones Web Progresivas (PWA):
                    Aplicaciones web que ofrecen una experiencia similar a las aplicaciones nativas.</li>
                    <li>Ciberseguridad en el ciclo de desarrollo:
                    Integración de la seguridad en las primeras etapas del desarrollo de software.</li>
                </ul>
                <br />
                <div className='imagenDesarrollo'>
                    <img src="" alt="" />
                </div>
            </Card.Body>
        </Card>

    </Container>
  )
}