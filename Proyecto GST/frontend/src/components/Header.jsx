import React from 'react'
import { useNavigate }  from 'react-router-dom';
import '../css/styleHeader.css'

export default function Header() {
  const navigate = useNavigate();
  return (
    <div className='navbar navbar-light bg-light"'>
      <div className='tituloGst container-fluid'>
        <h1>GST</h1>
      </div>
        <div className='botones'>
          <button className='bg-white text-blue-600 px-4 py-2 rounded' onClick={() => navigate("/Home")}>Inicio</button>
          <button className='bg-white text-blue-600 px-4 py-2 rounded' onClick={() => navigate("/Forms")}>Formulario</button>
          <button className='bg-white text-blue-600 px-4 py-2 rounded' onClick={() => navigate("/Login")}>Registro</button>
        </div>
      
    </div>
  )
}