import React from 'react'

export default function Articles() {
  return (
    <div>
      <h2>Articulos</h2>

        <div className='container'>
            <div className='row'>
                <div className='col'>

                <table className='table table-striped table-hover table-bordered'>
                    <thead>
                        <tr>
                            <th>TITULO</th>
                            <th>AUTOR</th>
                            <th>FECHA</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>El Impacto de la IA Generativa en la Creación de Contenido</td>
                            <td>Dra. Elena Sandoval</td>
                            <td>2024-05-10</td>
                        </tr>
                        <tr>
                            <td>Aprendizaje Profundo y sus Aplicaciones en el Reconocimiento de Imágenes</td>
                            <td>Ing. Roberto Castro</td>
                            <td>2024-05-18</td>
                        </tr>
                        <tr>
                            <td>IA Explicable: Comprendiendo las Decisiones de los Algoritmos</td>
                            <td>Lic. Marta Vargas</td>
                            <td>2024-05-26</td>
                        </tr>
                        <tr>
                            <td>Desarrollo de Aplicaciones Nativas de la Nube con Kubernetes</td>
                            <td>Ing. Andrés Jiménez</td>
                            <td>2024-06-03</td>
                        </tr>
                        <tr>
                            <td>El Auge del Desarrollo Low-Code/No-Code: Ventajas y Desafíos</td>
                            <td>Lic. Patricia Ruiz</td>
                            <td>2024-06-11</td>
                        </tr>
                        <tr>
                            <td>DevSecOps: Integrando la Seguridad en el Ciclo de Desarrollo</td>
                            <td>Ing. Héctor Díaz</td>
                            <td>2024-06-19</td>
                        </tr>
                        <tr>
                            <td>Ciberseguridad en la Era de la Computación Cuántica</td>
                            <td>Lic. Sofía Morales</td>
                            <td>2024-06-27</td>
                        </tr>
                        <tr>
                            <td>Protección de Dispositivos IoT: Mejores Prácticas de Seguridad</td>
                            <td>Ing. David Navarro</td>
                            <td>2024-07-05</td>
                        </tr>
                        <tr>
                            <td>La IA como Herramienta para la Detección y Prevención de Ciberataques</td>
                            <td>Dra. Carmen Ortega</td>
                            <td>2024-07-13</td>
                        </tr>
                    </tbody>
                 </table>
                </div>
            </div>
        </div>
    </div>
  )
}