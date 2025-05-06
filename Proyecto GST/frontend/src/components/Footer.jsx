import React from 'react';
import '../css/styleFooter.css';

export default function Footer() {
  return (
    <footer className="footer-container text-white">
      <div className="container py-3">
        <div className="footer-content text-center">
          <p>© 2024 Página reservada. Todos los derechos reservados.</p>
          <p>Esta página fue hecha por: <strong>Andrés Felipe Jaramillo Palacio - Maryury Hernandez - Sebastian Usuga</strong></p>
          <p>Asignatura: Desarrollo Web III</p>
        </div>
      </div>
    </footer>
  );
}